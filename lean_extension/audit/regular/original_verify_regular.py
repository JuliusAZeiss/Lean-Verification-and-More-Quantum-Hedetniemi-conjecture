#!/usr/bin/env python3
"""Separate kernel audit of the regular 1024-vertex-base counterexample.

Optional --resume accepts recorded, hash-checked, warning-fatal compiler passes;
it never accepts a cached proof object merely because the object exists.
"""
import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
import hashlib
import json
from pathlib import Path
import re
import subprocess
import time

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "verification_regular"
LAKE = ROOT.parent / "LeanProofs/.toolchain/lean-4.19.0-darwin_aarch64/bin/lake"
LEAN = LAKE.with_name("lean")
FINAL = "Hedetniemi.Expository.RegularAudit"
PREFIX = "Hedetniemi.Expository.Regular"
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}
ENDPOINTS = {"regularMatrix_eq_adjacency_add", "regularGramMatrix_adjacency_polynomial",
             "regular_sparse_matrix_identity",
             "regularMatrix_sos", "regularMatrix_entry_sum", "regularMatrix_trace", "regularMatrix_posSemidef",
             "regularG_card", "regularH_card", "regularH_colorable", "regular_product_colorable",
             "regularG_quantumChromaticNumber_lower", "regularH_quantumChromaticNumber",
             "regular_quantum_counterexample", "regular_quantum_hedetniemi_fails",
             "regular_cstar_counterexample", "regular_cstar_hedetniemi_fails"}


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_path(module):
    return ROOT / (module.replace(".", "/") + ".lean")


def object_path(module):
    return ROOT / ".lake/build/lib/lean" / (module.replace(".", "/") + ".olean")


def imports(module):
    return re.findall(r"^\s*import\s+([A-Za-z0-9_.]+)", source_path(module).read_text(), re.M)


def command(module):
    # Match the independently recorded batch command, including its built-in
    # warning-fatal option, so deterministic object fingerprints are preserved.
    return ["../LeanProofs/.toolchain/lean-4.19.0-darwin_aarch64/bin/lake",
            "env", "lean", "-DwarningAsError=true", "-o",
            str(object_path(module).relative_to(ROOT)), str(source_path(module).relative_to(ROOT))]


def approved_command(actual, module):
    if not isinstance(actual, list) or len(actual) != 7:
        return False
    if actual[1:3] != ["env", "lean"] or actual[3] not in (
            "--error=warning", "-DwarningAsError=true") or actual[4] != "-o":
        return False
    def resolved(name):
        path = Path(name)
        return (path if path.is_absolute() else ROOT / path).resolve()
    return (resolved(actual[0]) == LAKE.resolve() and
            resolved(actual[5]) == object_path(module).resolve() and
            resolved(actual[6]) == source_path(module).resolve())


def dependency_objects(module):
    return [{"module": dep, "sha256": digest(object_path(dep))}
            for dep in imports(module) if dep.startswith("Hedetniemi.")]


def check_files(rows):
    for name, expected in rows.items():
        path = Path(name)
        require(path.is_file() and digest(path) == expected, "Changed or missing audited file: " + name)


def compile_module(module, cached):
    source, obj = source_path(module), object_path(module)
    deps = dependency_objects(module)
    before = digest(source)
    row = cached.get(module)
    prior_log = ROOT / row["log"] if row is not None and "log" in row else None
    can_reuse = (module != FINAL and row is not None and obj.exists() and
                 approved_command(row.get("command"), module) and row.get("exit_code") == 0 and
                 row.get("source_sha256") == before and row.get("source_sha256_after") == before and
                 row.get("olean_sha256") == digest(obj) and row.get("dependency_objects") == deps and
                 row.get("compiler_sha256") == digest(LEAN) and
                 row.get("regular_base_olean_sha256") == digest(object_path(PREFIX + "Base")) and
                 prior_log is not None and prior_log.is_file() and
                 row.get("log_sha256") == digest(prior_log))
    snapshot = OUT / "sources" / source.relative_to(ROOT)
    snapshot.parent.mkdir(parents=True, exist_ok=True)
    snapshot.write_bytes(source.read_bytes())
    if can_reuse:
        adopted = dict(row)
        adopted["adopted_recorded_compile"] = True
        return adopted, ""
    obj.parent.mkdir(parents=True, exist_ok=True)
    started = time.monotonic()
    proc = subprocess.run(command(module), cwd=ROOT, stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT, text=True, check=False)
    log = OUT / (module + ".log")
    log.write_text(proc.stdout)
    require(proc.returncode == 0, "Lean compilation failed: " + module + "\n" + proc.stdout)
    require(digest(source) == before, "Source changed while compiling: " + module)
    require(dependency_objects(module) == deps, "Dependency changed while compiling: " + module)
    return {"module": module, "source": str(source.relative_to(ROOT)),
            "source_sha256": before, "source_sha256_after": digest(source),
            "olean": str(obj.relative_to(ROOT)), "olean_sha256": digest(obj),
            "command": command(module), "exit_code": 0,
            "compiler_sha256": digest(LEAN), "dependency_objects": deps,
            "regular_base_olean_sha256": digest(object_path(PREFIX + "Base")),
            "seconds": time.monotonic() - started, "log": str(log.relative_to(ROOT)),
            "log_sha256": digest(log),
            "adopted_recorded_compile": False}, proc.stdout


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--resume", action="append", default=[], metavar="JSON",
                        help="Reuse only successful compiler records with exact source/object/dependency hashes")
    parser.add_argument("--jobs", type=int, default=2, choices=[1, 2])
    args = parser.parse_args()
    OUT.mkdir(exist_ok=True)
    cached, resume_inputs = {}, []
    for name in args.resume:
        path = Path(name).resolve()
        data = json.loads(path.read_text())
        rows = data.get("sources", data.get("rows", []))
        require(isinstance(rows, list), "Resume records must be a list")
        for row in rows:
            cached[row["module"]] = row
        resume_inputs.append({"path": str(path), "sha256": digest(path)})
    record = {"status": "IN_PROGRESS", "started_unix": time.time(),
              "sources": [], "resume_inputs": resume_inputs, "jobs": args.jobs}
    result_path = OUT / "result.json"
    result_path.write_text(json.dumps(record, indent=2) + "\n")
    try:
        old_path, prior_path = ROOT / "verification/result.json", ROOT / "verification_round4/result.json"
        old, prior = json.loads(old_path.read_text()), json.loads(prior_path.read_text())
        require(old.get("status") == "verified_unconditional", "Old audit is incomplete")
        require(prior.get("status") == "PASS" and prior.get("concrete_round4_verified") is True,
                "Round4 prerequisite audit is incomplete")
        frozen = {str(old_path): digest(old_path), str(prior_path): digest(prior_path)}
        for row in old["sources"] + prior["sources"]:
            for name, key in [("source", "source_sha256"), ("olean", "olean_sha256")]:
                path = str(ROOT / row[name])
                require(path not in frozen or frozen[path] == row[key], "Conflicting prior hashes")
                frozen[path] = row[key]
        for row in old["config"]:
            frozen[str(ROOT / row["path"])] = row["sha256"]
        frozen[str(LEAN)], frozen[str(LAKE)] = prior["compiler_sha256"], prior["lake_sha256"]
        check_files(frozen)
        ordered, seen, active = [], set(), set()

        def visit(module):
            if module in seen or not module.startswith(PREFIX):
                return
            require(module not in active, "Import cycle")
            require(source_path(module).is_file(), "Missing source: " + module)
            active.add(module)
            for dep in imports(module):
                require(not dep.startswith("Hedetniemi.Expository.") or dep.startswith(PREFIX),
                        "Regular proof unexpectedly imports another new extension: " + dep)
                visit(dep)
            active.remove(module)
            seen.add(module)
            ordered.append(module)

        visit(FINAL)
        require({PREFIX + "Base", PREFIX + "PSD", PREFIX + "Counterexample"} <= seen,
                "Incomplete regular proof closure")
        new_hashes = {str(source_path(m)): digest(source_path(m)) for m in ordered}
        new_hashes[str(Path(__file__).resolve())] = digest(Path(__file__).resolve())
        record["source_modules"] = ordered
        record["unrelated_expository_sources_not_audited"] = sorted(
            str(p.relative_to(ROOT)) for p in (ROOT / "Hedetniemi/Expository").glob("*.lean")
            if p not in {source_path(m) for m in ordered})
        completed, pending, transcript = set(), ordered.copy(), ""
        with ThreadPoolExecutor(max_workers=args.jobs) as executor:
            while pending:
                ready = [m for m in pending if all(not d.startswith(PREFIX) or d in completed
                                                  for d in imports(m))][:args.jobs]
                require(ready, "No ready dependency layer")
                jobs = {executor.submit(compile_module, m, cached): m for m in ready}
                for future in as_completed(jobs):
                    module = jobs[future]
                    row, output = future.result()
                    record["sources"].append(row)
                    completed.add(module)
                    pending.remove(module)
                    transcript += output
                    result_path.write_text(json.dumps(record, indent=2) + "\n")
                    print(("Adopted recorded compile " if row["adopted_recorded_compile"] else "Compiled ")
                          + module, flush=True)

        endpoints, summaries = [], []
        for line in transcript.splitlines():
            if "REGULAR_ENDPOINT " in line:
                endpoints.append(json.loads(line.split("REGULAR_ENDPOINT ", 1)[1]))
            if "REGULAR_AUDIT_PASSED " in line:
                summaries.append(json.loads(line.split("REGULAR_AUDIT_PASSED ", 1)[1]))
        require(len(summaries) == 1 and len(endpoints) == len(ENDPOINTS), "Missing final audit records")
        require({x["name"].removeprefix("Hedetniemi.Expository.") for x in endpoints} == ENDPOINTS,
                "Wrong regular endpoints")
        for endpoint in endpoints:
            require(endpoint["safe"] and endpoint["closed"] and set(endpoint["axioms"]) <= ALLOWED,
                    "Unsafe, conditional, or unapproved endpoint")
        summary = summaries[0]
        require(set(summary["axioms"]) <= ALLOWED and summary["safe_declaration_count"] > 0,
                "Invalid declaration audit")
        require(set(summary["modules"]) == set(ordered) - {FINAL}, "Module closure mismatch")
        check_files(frozen)
        check_files(new_hashes)
        for row in record["sources"]:
            require(digest(ROOT / row["olean"]) == row["olean_sha256"], "New object changed after audit")
            require(dependency_objects(row["module"]) == row["dependency_objects"],
                    "New object dependency changed after audit")
        (OUT / "verify_regular.py").write_bytes(Path(__file__).read_bytes())
        record.update(status="PASS", finished_unix=time.time(), endpoints=endpoints,
                      declaration_audit=summary, allowed_axioms=sorted(ALLOWED),
                      frozen_dependency_hashes=frozen, frozen_prior_audits_unchanged=True,
                      audit_driver_sha256=digest(Path(__file__)),
                      compiler_sha256=digest(LEAN), lake_sha256=digest(LAKE),
                      scope="Explicit regular-base 524288/1576451 quantum and C* counterexample.",
                      trust_scope="Lean kernel, recorded successful new compiles, frozen previously audited local objects, and cached Mathlib.")
        result_path.write_text(json.dumps(record, indent=2) + "\n")
        print("PASS: regular-base counterexample and transitive standard-axiom audit.", flush=True)
    except Exception as error:
        record.update(status="FAIL", finished_unix=time.time(), error=str(error))
        result_path.write_text(json.dumps(record, indent=2) + "\n")
        raise


if __name__ == "__main__":
    main()
