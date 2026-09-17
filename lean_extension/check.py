#!/usr/bin/env python3
"""Verify separately audited extensions after the frozen baseline Lean build.

Run ../lean/check.py first. --check-sources only checks file identities and
import coverage; it neither requires nor claims a fresh Lean compilation.
This driver installs nothing and never changes baseline sources or objects.
"""
from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import subprocess
import sys
import time

MANIFEST_DIGEST = "3648d3c929bc8e23948aa4242d69ad86d366576c6b6a3e6de5a8edb052b2c33c"
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def unique_object(pairs):
    result = {}
    for key, value in pairs:
        require(key not in result, "Duplicate JSON key: " + key)
        result[key] = value
    return result


def read_json(path):
    return json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=unique_object)


def save_json(path, data):
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(json.dumps(data, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    os.replace(temporary, path)


def checked_path(root, name):
    require(type(name) is str, "Invalid file name")
    path = PurePosixPath(name)
    require(str(path) == name and not path.is_absolute() and ".." not in path.parts
            and "\\" not in name, "Unsafe relative path: " + name)
    require(not any(root.joinpath(*path.parts[:i]).is_symlink()
                    for i in range(1, len(path.parts) + 1)), "Symlinked input: " + name)
    result = root / name
    require(result.is_file(), "Missing input: " + name)
    return result


def source_checks(root, baseline):
    manifest = read_json(checked_path(root, "extension_manifest.json"))
    canonical = json.dumps(manifest, sort_keys=True, separators=(",", ":")).encode()
    require(hashlib.sha256(canonical).hexdigest() == MANIFEST_DIGEST,
            "Extension manifest differs from the separately audited release")
    require(manifest["format"] == 1, "Unknown manifest version")
    helper_path = checked_path(baseline, "check.py")
    require(digest(helper_path) == manifest["baseline_driver_sha256"],
            "The frozen baseline driver has changed")
    spec = importlib.util.spec_from_file_location("frozen_baseline_checker", helper_path)
    helper = importlib.util.module_from_spec(spec)
    old_bytecode = sys.dont_write_bytecode
    try:
        sys.dont_write_bytecode = True
        spec.loader.exec_module(helper)
    finally:
        sys.dont_write_bytecode = old_bytecode
    baseline_manifest, baseline_sources, _, _ = helper.validate_sources(baseline)
    sources = {}
    for name, expected in manifest["sources"].items():
        path = checked_path(root, name)
        require(name.endswith(".lean") and name.startswith("Hedetniemi/"), "Invalid extension source")
        require(digest(path) == expected, "Changed extension source: " + name)
        module = name[:-5].replace("/", ".")
        require(module not in baseline_sources, "Extension would replace a baseline module")
        sources[module] = path
    inventory = set()
    for directory, subdirectories, filenames in os.walk(root):
        if Path(directory) == root:
            subdirectories[:] = [d for d in subdirectories if d not in {".lake", "logs"}]
        for filename in filenames:
            if filename.endswith(".lean"):
                inventory.add((Path(directory) / filename).relative_to(root).as_posix())
    require(inventory == set(manifest["sources"]), "Unexpected or missing extension source")
    for name, expected in manifest["evidence"].items():
        require(digest(checked_path(root, name)) == expected, "Changed recorded audit evidence: " + name)
    dependencies = {m: helper.imports(p) for m, p in sources.items()}
    ordered, seen, active = [], set(), set()

    def visit(module):
        require(module not in active, "Extension import cycle: " + module)
        if module in seen:
            return
        require(module in sources, "Missing extension import: " + module)
        active.add(module)
        for dep in dependencies[module]:
            if dep in sources:
                visit(dep)
            elif dep.startswith("Hedetniemi"):
                require(dep in baseline_sources, "Import is outside both audited source sets: " + dep)
            else:
                relative = dep.replace(".", "/") + ".lean"
                require(not (root / relative).exists() and not (baseline / relative).exists(),
                        "Unmanifested local import: " + dep)
        active.remove(module)
        seen.add(module)
        ordered.append(module)

    group_names = set()
    for group in manifest["groups"]:
        require(group["name"] not in group_names, "Duplicate extension audit group")
        group_names.add(group["name"])
        original = read_json(root / group["record"])
        require(original.get("status") == "PASS", "Extension has no completed original audit")
        require(original.get("declaration_audit") == group["summary"], "Recorded summary mismatch")
        require({r["name"] for r in original["endpoints"]} == set(group["endpoints"]),
                "Recorded endpoint mismatch")
        rows = original.get("sources")
        expected_modules = set(group["summary"]["modules"]) | {group["audit_module"]}
        require(type(rows) is list and len(rows) == len(expected_modules)
                and {r.get("module") for r in rows} == expected_modules,
                "Recorded source audit inventory mismatch")
        for row in rows:
            name = row["module"].replace(".", "/") + ".lean"
            require(row.get("source") == name
                    and row.get("source_sha256") == manifest["sources"].get(name)
                    and row.get("source_sha256_after", row["source_sha256"]) == row["source_sha256"],
                    "Packaged source differs from its completed audit: " + name)
        visit(group["audit_module"])
    require(seen == set(sources), "An extension source is outside the final audit closures")
    return manifest, helper, sources, baseline_manifest, baseline_sources, dependencies, ordered


def strings(value, label):
    require(type(value) is list and all(type(x) is str and x for x in value), "Invalid " + label)
    require(len(value) == len(set(value)), "Duplicate " + label)
    return set(value)


def parse_audit(log_path, group):
    endpoints, summaries = [], []
    with log_path.open(encoding="utf-8") as stream:
        for line in stream:
            for marker, target in [(group["endpoint_marker"], endpoints),
                                   (group["summary_marker"], summaries)]:
                match = re.search(r"(?:^|\s)" + re.escape(marker) + r" (\{.*\})\s*$", line)
                require(not re.search(r"(?:^|\s)" + re.escape(marker) + r"(?:\s|$)", line)
                        or match is not None, "Malformed audit marker line")
                if match:
                    row = json.loads(match.group(1), object_pairs_hook=unique_object)
                    require(type(row) is dict, "Malformed audit marker")
                    target.append(row)
    require(len(summaries) == 1, "Missing or duplicate extension axiom summary")
    summary, expected = summaries[0], group["summary"]
    require(type(summary.get("safe_declaration_count")) is int
            and summary["safe_declaration_count"] == expected["safe_declaration_count"] > 0,
            "Extension declaration count mismatch")
    require(strings(summary.get("modules"), "audited modules") == set(expected["modules"]),
            "Extension module audit mismatch")
    actual_axioms = strings(summary.get("axioms"), "axiom union")
    require(actual_axioms <= ALLOWED and actual_axioms == set(expected["axioms"]),
            "Unexpected extension axiom union")
    names = []
    for row in endpoints:
        require(row.get("safe") is True and row.get("closed") is True
                and type(row.get("type")) is str and bool(row["type"].strip()),
                "Unsafe, open or malformed extension endpoint")
        require(strings(row.get("axioms"), "endpoint axioms") <= ALLOWED,
                "Unapproved extension endpoint axiom")
        require(type(row.get("name")) is str, "Missing endpoint name")
        names.append(row["name"])
    require(len(names) == len(group["endpoints"]) and len(names) == len(set(names))
            and set(names) == set(group["endpoints"]), "Missing, duplicate or unexpected extension endpoint")
    return {"summary": summary, "endpoints": endpoints}


def baseline_build_checks(baseline, helper, manifest, sources):
    record_path = baseline / "logs/verification_result.json"
    require(record_path.is_file(), "Run the baseline lean/check.py full verification first")
    record = read_json(record_path)
    require(record.get("status") == "PASS" and record.get("lean_verified") is True,
            "Baseline has no fresh full PASS; --check-sources is not enough")
    require(record.get("driver_sha256") == digest(baseline / "check.py"), "Baseline driver provenance changed")
    require(record.get("manifest_digest") == helper.MANIFEST_DIGEST
            and record.get("source_count") == len(sources), "Baseline source provenance mismatch")
    frozen = {record_path: digest(record_path), baseline / "check.py": digest(baseline / "check.py")}
    configuration = record.get("configuration")
    require(type(configuration) is dict and set(configuration) == {
        "source_manifest.json", "lean-toolchain", "lakefile.toml", "lake-manifest.json"},
        "Baseline configuration provenance is missing")
    for name, expected in configuration.items():
        path = checked_path(baseline, name)
        require(digest(path) == expected, "Baseline configuration changed: " + name)
        frozen[path] = expected
    compiled = record.get("compiled_sources")
    require(type(compiled) is list and len(compiled) == len(sources), "Incomplete baseline compilation record")
    seen = set()
    for row in compiled:
        module = row.get("module")
        require(module in sources and module not in seen, "Unexpected or duplicate baseline object")
        seen.add(module)
        name = sources[module].relative_to(baseline).as_posix()
        require(row.get("source") == name and row.get("source_sha256") == manifest[name],
                "Baseline source compilation mismatch: " + module)
        obj = checked_path(baseline, ".lake/build/lib/lean/" + module.replace(".", "/") + ".olean")
        require(digest(obj) == row.get("olean_sha256"), "Baseline compiled object changed: " + module)
        frozen[obj] = row["olean_sha256"]
        frozen[sources[module]] = manifest[name]
    summary, endpoints, _, _ = helper.audit_output(baseline / "logs/Round4Verification.log",
                                                 set(sources) - {"Round4Verification"})
    require(summary == record.get("axiom_audit") and endpoints == record.get("endpoints"),
            "Baseline audit log and PASS record disagree")
    frozen[baseline / "logs/Round4Verification.log"] = digest(baseline / "logs/Round4Verification.log")
    return record, frozen


def unchanged(files):
    require(all(path.is_file() and digest(path) == expected for path, expected in files.items()),
            "An audited input or compiled object changed during verification")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parent)
    parser.add_argument("--baseline", type=Path, help="Frozen lean/ folder (default: ../lean)")
    parser.add_argument("--output", type=Path, help="Log directory (default: ROOT/logs)")
    parser.add_argument("--check-sources", action="store_true")
    args = parser.parse_args()
    root = args.root.resolve()
    baseline = args.baseline.resolve() if args.baseline else root.parent / "lean"
    output = args.output.resolve() if args.output else root / "logs"
    if root == baseline or baseline in root.parents or output == baseline or baseline in output.parents:
        print("FAIL: extension sources and output must be outside the frozen baseline.", file=sys.stderr)
        return 1
    output.mkdir(parents=True, exist_ok=True)
    result_path = output / "verification_result.json"
    record = {"status": "PREFLIGHT", "lean_verified": False, "started_unix": time.time(),
              "driver_sha256": digest(Path(__file__).resolve()), "baseline": str(baseline),
              "trust_scope": "Lean kernel/toolchain, freshly checked baseline objects, cached upstream Mathlib"}
    save_json(result_path, record)
    try:
        manifest, helper, sources, base_manifest, base_sources, dependencies, ordered = source_checks(root, baseline)
        record.update(extension_source_count=len(sources), baseline_source_count=len(base_sources),
                      manifest_digest=MANIFEST_DIGEST, ordered_modules=ordered)
        if args.check_sources:
            record.update(status="SOURCES_CHECKED", finished_unix=time.time())
            save_json(result_path, record)
            print("SOURCES_CHECKED: {} extension and {} baseline sources; no Lean compilation.".format(
                len(sources), len(base_sources)))
            return 0
        prior, frozen = baseline_build_checks(baseline, helper, base_manifest, base_sources)
        lake = shutil.which("lake")
        require(lake is not None and digest(Path(lake)) == prior.get("lake_sha256"),
                "lake on PATH differs from the successful baseline build")
        frozen[Path(lake)] = digest(Path(lake))
        frozen[Path(__file__).resolve()] = record["driver_sha256"]
        frozen[root / "extension_manifest.json"] = digest(root / "extension_manifest.json")
        frozen.update({root / n: h for n, h in manifest["sources"].items()})
        frozen.update({root / n: h for n, h in manifest["evidence"].items()})
        build = root / ".lake/build/lib/lean"
        expected_objects = {build / (m.replace(".", "/") + ".olean") for m in sources}
        require(not build.is_symlink() and not any(p.is_symlink() for p in build.parents
                    if p != root and root in p.parents), "Symlinked extension build directory")
        if build.exists():
            require(all(not p.is_symlink() for p in build.rglob("*")),
                    "Symlinked extension build input")
            require(set(build.rglob("*.olean")) <= expected_objects,
                    "Unexpected extension object could shadow a baseline or upstream module")
        # Lake supplies the baseline and upstream environment. Only the separate
        # extension object directory is prepended; no baseline object is replaced.
        env = dict(os.environ)
        env.pop("LEAN_PATH", None)
        env.pop("LEAN_SRC_PATH", None)
        resolved = subprocess.run([lake, "env", sys.executable, "-c",
            "import json,shutil; print(json.dumps(shutil.which('lean')))"],
            cwd=baseline, env=env, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        require(resolved.returncode == 0, "Cannot resolve the active Lean compiler")
        compiler_name = json.loads(resolved.stdout)
        require(type(compiler_name) is str, "Lean compiler is not on Lake's PATH")
        compiler = Path(compiler_name).resolve()
        require(compiler.is_file(), "Active Lean compiler is missing")
        frozen[compiler] = digest(compiler)
        wrapper = ("import os,sys; os.environ['LEAN_PATH']=sys.argv[1]+os.pathsep+"
                   "os.environ.get('LEAN_PATH',''); os.execv(sys.argv[2],sys.argv[2:])")
        prefix = [lake, "env", sys.executable, "-c", wrapper, str(build), str(compiler)]
        version = subprocess.run(prefix + ["--version"], cwd=baseline, env=env, text=True,
                                 stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        require(version.returncode == 0 and version.stdout.strip() == prior.get("lean_version"),
                "Lean compiler version differs from the baseline build")
        record.update(status="IN_PROGRESS", compiled_sources=[], lean_version=version.stdout.strip(),
                      lean_binary=str(compiler), lean_binary_sha256=frozen[compiler],
                      baseline_result_sha256=digest(baseline / "logs/verification_result.json"))
        save_json(result_path, record)
        audits = {g["audit_module"]: g for g in manifest["groups"]}
        results, objects = {}, {}
        for number, module in enumerate(ordered, 1):
            for dep in dependencies[module]:
                if dep in sources:
                    require(dep in objects and digest(objects[dep][0]) == objects[dep][1],
                            "Missing or changed extension dependency: " + dep)
            obj = build / (module.replace(".", "/") + ".olean")
            obj.parent.mkdir(parents=True, exist_ok=True)
            if obj.exists():
                obj.unlink()
            log = output / (module + ".log")
            started = time.monotonic()
            print("[{}/{}] {}".format(number, len(ordered), module), flush=True)
            with log.open("w", encoding="utf-8") as stream:
                run = subprocess.run(prefix + ["--root=" + str(root), "--error=warning",
                                              "-o", str(obj), str(sources[module])],
                                     cwd=baseline, env=env, stdout=stream, stderr=subprocess.STDOUT)
            require(run.returncode == 0, "Extension compilation failed; see " + str(log))
            with log.open(encoding="utf-8") as stream:
                require(not any(re.search(r"(?:^|\s)(?:error|warning):", x) for x in stream),
                        "Extension emitted a warning or error: " + module)
            require(obj.is_file() and not obj.is_symlink(), "Missing regular extension object")
            objects[module] = (obj, digest(obj))
            frozen[obj] = objects[module][1]
            record["compiled_sources"].append({"module": module,
                "source_sha256": digest(sources[module]), "olean_sha256": digest(obj),
                "seconds": time.monotonic()-started})
            save_json(result_path, record)
            if module in audits:
                results[audits[module]["name"]] = parse_audit(log, audits[module])
        require(set(results) == {g["name"] for g in manifest["groups"]}, "An extension audit did not run")
        source_checks(root, baseline)
        unchanged(frozen)
        record.update(status="PASS", lean_verified=True, finished_unix=time.time(), audits=results,
                      baseline_unchanged=True)
        save_json(result_path, record)
        print("PASS: all packaged extensions compiled and their closed endpoint/axiom audits passed.")
        return 0
    except KeyboardInterrupt:
        record.update(status="INTERRUPTED", lean_verified=False, finished_unix=time.time())
        save_json(result_path, record)
        print("INTERRUPTED: no extension pass recorded.", file=sys.stderr)
        return 130
    except Exception as error:
        record.update(status="FAIL", lean_verified=False, error=str(error), finished_unix=time.time())
        save_json(result_path, record)
        print("FAIL: " + str(error), file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
