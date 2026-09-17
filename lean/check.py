#!/usr/bin/env python3
"""Check and recompile the frozen quantum Hedetniemi supplement.

Place this file in the supplement's lean/ directory, or pass --root lean/.
--check-sources needs only Python; it does NOT certify any Lean theorem.
A full run needs lake on PATH, Lean 4.19.0, and the pinned Mathlib dependencies
already installed as described in the supplement README. This script never
installs toolchains, fetches dependencies, runs lake build, or resumes a run.
Cached upstream libraries and the Lean toolchain remain trusted dependencies.
"""
from __future__ import annotations

import argparse
from collections import Counter
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import subprocess
import sys
import time

SOURCE_COUNT = 371
MANIFEST_DIGEST = "bd1172d699f8ffd59b543ac69dd37caecc8fa5930bdcef4abfeb0d2d805bbea5"
AUDIT_DIGEST = "a65e4e7f8f4c146e3f7395cf02d1fb6a8dd893bfaaa616ae02494de70aa864bf"
LAKEFILE_DIGEST = "364d06e6e3c583fcabe885be8bf405da019714cc38ae821dd0ce348893a41bf6"
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}
ENDPOINTS = {
    "Hedetniemi.Round4.quantum_hedetniemi_counterexample",
    "Hedetniemi.Round4.unconditional_quantum_product_counterexample",
    "Hedetniemi.Round4.small_product_colorable",
    "Hedetniemi.Round4.smallG_card",
    "Hedetniemi.Round4.smallH_card",
    "Hedetniemi.Round4.smallG_quantumChromaticNumber_lower",
    "Hedetniemi.Round4.smallH_quantumChromaticNumber",
    "Hedetniemi.Round4.smallH_vertex_critical",
    "Hedetniemi.Round4.cstar_hedetniemi_counterexample",
    "Hedetniemi.Round4.unconditional_cstar_product_counterexample",
}
MARKERS = {
    "HEDETNIEMI_AXIOM_DECL": "declarations",
    "HEDETNIEMI_UNSAFE_RUNTIME_DECL": "runtime",
    "HEDETNIEMI_UNCONDITIONAL_ENDPOINT": "endpoints",
    "HEDETNIEMI_AXIOM_AUDIT_PASSED": "summary",
}
KINDS = {"axiom", "definition", "theorem", "opaque", "quotient",
         "inductive", "constructor", "recursor"}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def unique_object(pairs):
    result = {}
    for key, value in pairs:
        require(key not in result, "Duplicate JSON key: " + key)
        result[key] = value
    return result


def read_json(text):
    return json.loads(text, object_pairs_hook=unique_object)


def save_json(path, value):
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    os.replace(temporary, path)


def blank_comments_and_strings(text):
    """Read import lines without confusing nested comments or strings with code."""
    result, i, depth, in_string = [], 0, 0, False
    while i < len(text):
        if depth:
            if text.startswith("/-", i):
                depth += 1
                result.extend("  ")
                i += 2
            elif text.startswith("-/", i):
                depth -= 1
                result.extend("  ")
                i += 2
            else:
                result.append("\n" if text[i] == "\n" else " ")
                i += 1
        elif in_string:
            if text[i] == "\\" and i + 1 < len(text):
                result.extend("  ")
                i += 2
            else:
                if text[i] == '"':
                    in_string = False
                result.append("\n" if text[i] == "\n" else " ")
                i += 1
        elif text.startswith("--", i):
            end = text.find("\n", i)
            if end == -1:
                end = len(text)
            result.extend(" " * (end - i))
            i = end
        elif text.startswith("/-", i):
            depth = 1
            result.extend("  ")
            i += 2
        elif text[i] == '"':
            in_string = True
            result.append(" ")
            i += 1
        else:
            result.append(text[i])
            i += 1
    require(not depth and not in_string, "Unterminated Lean comment or string")
    return "".join(result)


def imports(path):
    result = []
    for line in blank_comments_and_strings(path.read_text(encoding="utf-8")).splitlines():
        if not re.match(r"\s*(?:public\s+)?import\b", line):
            continue
        match = re.fullmatch(r"\s*import\s+(.+?)\s*", line)
        require(match is not None, "Unsupported import syntax in " + str(path))
        for module in match.group(1).split():
            require(re.fullmatch(r"[A-Za-z_][A-Za-z_0-9']*(?:\.[A-Za-z_][A-Za-z_0-9']*)*",
                                 module) is not None, "Unsupported import token: " + module)
            result.append(module)
    return result


def validate_sources(root):
    manifest_path = root / "source_manifest.json"
    require(manifest_path.is_file() and not manifest_path.is_symlink(), "Missing or symlinked manifest")
    manifest = read_json(manifest_path.read_text(encoding="utf-8"))
    require(type(manifest) is dict and len(manifest) == SOURCE_COUNT,
            "Manifest must contain exactly 371 source entries")
    canonical = json.dumps(manifest, sort_keys=True, separators=(",", ":")).encode()
    require(hashlib.sha256(canonical).hexdigest() == MANIFEST_DIGEST,
            "Manifest differs from the frozen audited supplement")
    require(manifest.get("Round4Verification.lean") == AUDIT_DIGEST,
            "The final Lean audit source is not the frozen version")
    sources = {}
    for name, expected in manifest.items():
        parts = PurePosixPath(name)
        require(type(name) is str and str(parts) == name and not parts.is_absolute()
                and ".." not in parts.parts and "\\" not in name
                and name.endswith(".lean"), "Invalid manifest source path")
        require(type(expected) is str and re.fullmatch(r"[0-9a-f]{64}", expected) is not None,
                "Invalid SHA-256 in manifest: " + name)
        module = name[:-5].replace("/", ".")
        require(module == "Round4Verification" or module.startswith("Hedetniemi."),
                "Unexpected local module: " + module)
        path = root / name
        require(path.is_file() and not any((root.joinpath(*parts.parts[:i])).is_symlink()
                for i in range(1, len(parts.parts) + 1)), "Missing or symlinked source: " + name)
        require(sha256(path) == expected, "Source hash mismatch: " + name)
        sources[module] = path
    inventory = set()
    for directory, subdirectories, filenames in os.walk(root):
        if Path(directory) == root:
            subdirectories[:] = [d for d in subdirectories if d not in {".lake", "logs"}]
        for filename in filenames:
            if filename.endswith(".lean"):
                inventory.add((Path(directory) / filename).relative_to(root).as_posix())
    require(inventory == set(manifest), "Local Lean source inventory differs from the manifest")
    require((root / "lean-toolchain").read_text(encoding="utf-8").strip()
            == "leanprover/lean4:v4.19.0", "Lean toolchain is not pinned to 4.19.0")
    require(sha256(root / "lakefile.toml") == LAKEFILE_DIGEST,
            "Lake configuration differs from the pinned Mathlib configuration")
    dependencies = {m: imports(p) for m, p in sources.items()}
    ordered, seen, active = [], set(), set()

    def visit(module):
        require(module not in active, "Local import cycle at " + module)
        if module in seen:
            return
        require(module in sources, "Missing local import: " + module)
        active.add(module)
        for dep in dependencies[module]:
            if dep in sources:
                visit(dep)
            elif dep == "Hedetniemi" or dep.startswith("Hedetniemi."):
                raise ValueError("Missing local dependency: " + dep)
            else:
                require(not (root / (dep.replace(".", "/") + ".lean")).exists(),
                        "Unmanifested local dependency: " + dep)
        active.remove(module)
        seen.add(module)
        ordered.append(module)

    visit("Round4Verification")
    require(seen == set(sources), "Manifest contains sources outside the final import closure")
    require(ordered[-1] == "Round4Verification" and "Hedetniemi.Round4.Disproof" in seen,
            "Concrete endpoint/audit missing from closure")
    return manifest, sources, dependencies, ordered


def string_set(value, label):
    require(type(value) is list and all(type(x) is str and x for x in value),
            "Invalid string list: " + label)
    require(len(value) == len(set(value)), "Duplicates in " + label)
    return set(value)


def audit_output(log_path, expected_modules):
    """Only the final, unchanged Lean audit's output may satisfy these checks."""
    rows = {name: [] for name in MARKERS.values()}
    with log_path.open(encoding="utf-8") as stream:
        for line in stream:
            for marker, target in MARKERS.items():
                match = re.search(r"(?:^|\s)" + marker + r" (\{.*\})\s*$", line)
                if match:
                    record = read_json(match.group(1))
                    require(type(record) is dict, "Audit marker did not contain an object")
                    rows[target].append(record)
    require(len(rows["summary"]) == 1, "Missing or duplicate Lean audit summary")
    summary = rows["summary"][0]
    declarations, runtime, endpoints = rows["declarations"], rows["runtime"], rows["endpoints"]
    require(declarations and endpoints, "Missing declaration or endpoint audit")
    all_names, safe_names = set(), {}
    counts, runtime_counts = Counter(), Counter()
    for is_runtime, records, totals in [(False, declarations, counts), (True, runtime, runtime_counts)]:
        for row in records:
            name, module = row.get("name"), row.get("module")
            require(type(name) is str and name and name not in all_names,
                    "Invalid or duplicate declaration name")
            require(module in expected_modules and row.get("kind") in KINDS
                    and row.get("unsafe") is is_runtime, "Malformed declaration audit record")
            all_names.add(name)
            totals[module] += 1
            if not is_runtime:
                require(row.get("axiom_coverage") == "shared_transitive_union"
                        and string_set(row.get("axioms_upper_bound"), name) == ALLOWED,
                        "Unapproved declaration dependency: " + name)
                safe_names[name] = row
    for field, actual in [("declaration_count", len(declarations)),
                          ("unsafe_runtime_declaration_count", len(runtime)),
                          ("theorem_count", sum(x["kind"] == "theorem" for x in declarations))]:
        require(type(summary.get(field)) is int and summary[field] == actual,
                "Audit count mismatch: " + field)
    require(string_set(summary.get("allowed_axioms"), "allowed axioms") == ALLOWED,
            "Incorrect audit axiom policy")
    require(string_set(summary.get("actual_transitive_axiom_union"), "actual axioms") <= ALLOWED,
            "Unapproved transitive axiom")
    module_rows = summary.get("modules")
    require(type(module_rows) is list and all(type(r) is dict for r in module_rows),
            "Missing module audit")
    names = [r.get("module") for r in module_rows]
    require(len(names) == len(set(names)) and set(names) == expected_modules,
            "Audited modules differ from the source closure")
    for row in module_rows:
        module = row["module"]
        require(type(row.get("declaration_count")) is int
                and row["declaration_count"] == counts[module]
                and type(row.get("unsafe_runtime_declaration_count")) is int
                and row["unsafe_runtime_declaration_count"] == runtime_counts[module],
                "Per-module declaration count mismatch: " + module)
    endpoint_names = []
    for row in endpoints:
        name = row.get("name")
        require(name in ENDPOINTS and name in safe_names and safe_names[name]["kind"] == "theorem"
                and row.get("kind") == "theorem" and row.get("unsafe") is False
                and row.get("no_parameters") is True
                and type(row.get("type")) is str and row["type"].strip(),
                "Malformed or conditional final endpoint")
        require(string_set(row.get("axioms"), name) <= ALLOWED,
                "Final endpoint has an unapproved axiom")
        endpoint_names.append(name)
    require(len(endpoint_names) == len(ENDPOINTS) and set(endpoint_names) == ENDPOINTS,
            "Missing or duplicate final endpoint")
    return summary, endpoints, declarations, runtime


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parent,
                        help="Supplement lean/ directory (default: this script's directory)")
    parser.add_argument("--check-sources", action="store_true",
                        help="Validate source hashes, inventory and import closure; do not compile")
    parser.add_argument("--output", type=Path, help="Log directory (default: ROOT/logs)")
    args = parser.parse_args()
    root = args.root.resolve()
    output = args.output.resolve() if args.output else root / "logs"
    output.mkdir(parents=True, exist_ok=True)
    result_path = output / "verification_result.json"
    record = {"status": "PREFLIGHT", "lean_verified": False, "started_unix": time.time(),
              "root": str(root), "driver_sha256": sha256(Path(__file__).resolve()),
              "not_certified": ["Global minimality", "A separately formalized Alice/Bob POVM-game equivalence"],
              "trust_scope": "Lean kernel/toolchain and cached upstream Mathlib dependencies"}
    save_json(result_path, record)  # Invalidate any old PASS before checking anything.
    try:
        manifest, sources, dependencies, ordered = validate_sources(root)
        record.update(source_count=len(sources), local_module_count=len(sources)-1,
                      manifest_digest=MANIFEST_DIGEST, ordered_modules=ordered)
        if args.check_sources:
            record.update(status="SOURCES_CHECKED", finished_unix=time.time())
            save_json(result_path, record)
            print("SOURCES_CHECKED: 371 sources, exact import closure; no Lean compilation performed.")
            return 0
        lake = shutil.which("lake")
        require(lake is not None, "lake is not on PATH; install the documented prerequisites first")
        require((root / "lake-manifest.json").is_file(),
                "Missing lake-manifest.json; perform the README's pinned dependency setup first")
        configuration = {name: sha256(root / name) for name in
                         ("source_manifest.json", "lean-toolchain", "lakefile.toml", "lake-manifest.json")}
        record.update(lake=str(lake), lake_sha256=sha256(Path(lake)), configuration=configuration,
                      status="IN_PROGRESS", compiled_sources=[])
        env = dict(os.environ)
        env.pop("LEAN_PATH", None)
        env.pop("LEAN_SRC_PATH", None)
        version = subprocess.run([lake, "env", "lean", "--version"], cwd=root, env=env,
                                 text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        (output / "toolchain.log").write_text(version.stdout, encoding="utf-8")
        require(version.returncode == 0 and re.search(r"Lean \(version 4\.19\.0(?:,|\))", version.stdout),
                "The active Lean compiler is not version 4.19.0; see toolchain.log")
        record["lean_version"] = version.stdout.strip()
        save_json(result_path, record)
        objects = {}
        for number, module in enumerate(ordered, 1):
            source = sources[module]
            name = source.relative_to(root).as_posix()
            require(sha256(source) == manifest[name], "Source changed before compilation: " + name)
            for dep in dependencies[module]:
                if dep in sources:
                    require(dep in objects and sha256(objects[dep][0]) == objects[dep][1],
                            "Compiled dependency changed or missing: " + dep)
            obj = root / ".lake/build/lib/lean" / (module.replace(".", "/") + ".olean")
            obj.parent.mkdir(parents=True, exist_ok=True)
            if obj.exists():
                obj.unlink()  # Every local source is freshly compiled; never reuse a stale object.
            log = output / (module + ".log")
            print("[{}/{}] {}".format(number, len(ordered), module), flush=True)
            started = time.monotonic()
            with log.open("w", encoding="utf-8") as stream:
                run = subprocess.run([lake, "env", "lean", "--error=warning", "-o", str(obj), str(source)],
                                     cwd=root, env=env, stdout=stream, stderr=subprocess.STDOUT)
            require(run.returncode == 0, "Compilation failed: " + module + "; see " + str(log))
            with log.open(encoding="utf-8") as stream:
                require(not any(re.search(r"(?:^|\s)(?:error|warning):", line) for line in stream),
                        "Lean emitted an error or warning: " + module)
            require(obj.is_file() and not obj.is_symlink(), "Compiler did not create a regular object: " + module)
            require(sha256(source) == manifest[name], "Source changed during compilation: " + name)
            obj_hash = sha256(obj)
            objects[module] = (obj, obj_hash)
            record["compiled_sources"].append({"module": module, "source": name,
                "source_sha256": manifest[name], "olean_sha256": obj_hash,
                "seconds": time.monotonic()-started})
            save_json(result_path, record)
        summary, endpoints, declarations, runtime = audit_output(
            output / "Round4Verification.log", set(sources) - {"Round4Verification"})
        require(validate_sources(root)[0] == manifest, "Source inventory changed during verification")
        require(all(sha256(root / name) == digest for name, digest in configuration.items()),
                "Verification configuration changed during the run")
        require(sha256(Path(lake)) == record["lake_sha256"], "Lake binary changed during the run")
        require(sha256(Path(__file__).resolve()) == record["driver_sha256"], "Driver changed during the run")
        require(all(sha256(path) == digest for path, digest in objects.values()),
                "Compiled local proof object changed after compilation")
        for name, data in [("axiom_audit.json", summary), ("endpoints.json", endpoints),
                           ("declarations.json", declarations), ("runtime_declarations.json", runtime)]:
            save_json(output / name, data)
        record.update(status="PASS", lean_verified=True, finished_unix=time.time(),
                      axiom_audit=summary, endpoints=endpoints)
        save_json(result_path, record)
        print("PASS: all 371 sources compiled; all ten closed endpoints and the complete axiom audit passed.")
        return 0
    except KeyboardInterrupt:
        record.update(status="INTERRUPTED", lean_verified=False, finished_unix=time.time())
        save_json(result_path, record)
        print("INTERRUPTED: no verification pass recorded.", file=sys.stderr)
        return 130
    except Exception as exc:
        record.update(status="FAIL", lean_verified=False, error=str(exc), finished_unix=time.time())
        save_json(result_path, record)
        print("FAIL: " + str(exc), file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
