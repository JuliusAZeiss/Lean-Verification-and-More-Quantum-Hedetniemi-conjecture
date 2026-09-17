#!/usr/bin/env python3
"""Verify the isolated uniform-example extension against frozen audited dependencies.

Uses Lean's kernel, not native_decide. Never rebuilds or edits an old proof module.
"""
import hashlib
import json
from pathlib import Path
import subprocess
import time

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "verification_expository"
LAKE = ROOT.parent / "LeanProofs/.toolchain/lean-4.19.0-darwin_aarch64/bin/lake"
LEAN = LAKE.with_name("lean")
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}
MODULES = ["Hedetniemi.Expository.SourceTotals", "Hedetniemi.Expository.Uniform",
           "Hedetniemi.Expository.Audit"]
ENDPOINTS = {"sourceMatrix_trace", "sourceMatrix_entry_sum", "source_uniform_gap",
             "uniformG_card", "uniform_product_colorable",
             "uniformG_quantumChromaticNumber_lower", "uniform_quantum_counterexample",
             "uniform_quantum_hedetniemi_fails", "uniform_cstar_counterexample",
             "uniform_cstar_hedetniemi_fails"}


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require(test, message):
    if not test:
        raise RuntimeError(message)


def check_files(rows):
    for name, expected in rows.items():
        path = Path(name)
        require(path.is_file(), "Missing dependency: " + name)
        require(digest(path) == expected, "Changed audited dependency: " + name)


def main():
    OUT.mkdir(exist_ok=True)
    record = {"status": "IN_PROGRESS", "started_unix": time.time(), "sources": []}
    result_path = OUT / "result.json"
    result_path.write_text(json.dumps(record, indent=2) + "\n")
    try:
        old_path = ROOT / "verification/result.json"
        prior_path = ROOT / "verification_round4/result.json"
        old = json.loads(old_path.read_text())
        prior = json.loads(prior_path.read_text())
        require(old.get("status") == "verified_unconditional", "Old audit is not complete")
        require(prior.get("status") == "PASS" and prior.get("concrete_round4_verified") is True,
                "Round4 audit is not complete")
        frozen = {str(old_path): digest(old_path), str(prior_path): digest(prior_path)}
        for row in old["sources"] + prior["sources"]:
            for name, key in [("source", "source_sha256"), ("olean", "olean_sha256")]:
                path = str(ROOT / row[name])
                require(path not in frozen or frozen[path] == row[key],
                        "Conflicting prior audit hashes: " + path)
                frozen[path] = row[key]
        for row in old["config"]:
            frozen[str(ROOT / row["path"])] = row["sha256"]
        frozen[str(LEAN)] = old["compiler"]["sha256"]
        require(digest(LEAN) == prior["compiler_sha256"], "Round4 compiler differs")
        require(digest(LAKE) == prior["lake_sha256"], "Round4 Lake differs")
        frozen[str(LAKE)] = prior["lake_sha256"]
        check_files(frozen)

        actual_sources = set((ROOT / "Hedetniemi/Expository").glob("*.lean"))
        expected_sources = {ROOT / (m.replace(".", "/") + ".lean") for m in MODULES}
        require(expected_sources <= actual_sources, "An audited extension source is missing")
        record["unrelated_expository_sources_not_audited"] = sorted(
            str(p.relative_to(ROOT)) for p in actual_sources - expected_sources)
        extension_hashes = {str(p): digest(p) for p in expected_sources}
        extension_hashes[str(Path(__file__).resolve())] = digest(Path(__file__).resolve())
        transcript = ""
        for module in MODULES:
            source = ROOT / (module.replace(".", "/") + ".lean")
            target = ROOT / ".lake/build/lib/lean" / (module.replace(".", "/") + ".olean")
            target.parent.mkdir(parents=True, exist_ok=True)
            snapshot = OUT / "sources" / source.relative_to(ROOT)
            snapshot.parent.mkdir(parents=True, exist_ok=True)
            snapshot.write_bytes(source.read_bytes())
            command = [str(LAKE), "env", "lean", "--error=warning", "-o", str(target), str(source)]
            start = time.monotonic()
            proc = subprocess.run(command, cwd=ROOT, stdout=subprocess.PIPE,
                                  stderr=subprocess.STDOUT, text=True, check=False)
            (OUT / (module + ".log")).write_text(proc.stdout)
            require(proc.returncode == 0, "Lean compilation failed: " + module + "\n" + proc.stdout)
            row = {"module": module, "source": str(source.relative_to(ROOT)),
                   "source_sha256": digest(source), "olean": str(target.relative_to(ROOT)),
                   "olean_sha256": digest(target), "seconds": time.monotonic() - start}
            record["sources"].append(row)
            transcript += proc.stdout
            print("Compiled " + module, flush=True)

        endpoints, summaries = [], []
        for line in transcript.splitlines():
            if "EXPOSITORY_ENDPOINT " in line:
                endpoints.append(json.loads(line.split("EXPOSITORY_ENDPOINT ", 1)[1]))
            if "EXPOSITORY_AUDIT_PASSED " in line:
                summaries.append(json.loads(line.split("EXPOSITORY_AUDIT_PASSED ", 1)[1]))
        require(len(summaries) == 1, "Missing or duplicate declaration audit")
        require(len(endpoints) == len(ENDPOINTS), "Unexpected endpoint count")
        require({x["name"].removeprefix("Hedetniemi.Expository.") for x in endpoints} == ENDPOINTS,
                "Wrong closed endpoints")
        for endpoint in endpoints:
            require(endpoint["safe"] and endpoint["closed"], "Unsafe/open endpoint")
            require(set(endpoint["axioms"]) <= ALLOWED, "Unapproved endpoint axiom")
        summary = summaries[0]
        require(set(summary["axioms"]) <= ALLOWED and summary["safe_declaration_count"] > 0,
                "Invalid declaration axiom audit")
        require(set(summary["modules"]) == set(MODULES[:-1]), "Unexpected imported extension modules")
        check_files(frozen)
        check_files(extension_hashes)
        (OUT / "verify_expository.py").write_bytes(Path(__file__).read_bytes())
        record.update(status="PASS", finished_unix=time.time(), endpoints=endpoints,
                      declaration_audit=summary, allowed_axioms=sorted(ALLOWED),
                      frozen_dependency_hashes=frozen,
                      frozen_prior_audits_unchanged=True,
                      audit_driver_sha256=digest(Path(__file__)),
                      compiler_sha256=digest(LEAN), lake_sha256=digest(LAKE),
                      scope="Closed uniform 310472/934177 counterexample and exact unweighted source totals.",
                      trust_scope="Lean kernel with frozen previously audited local objects and cached upstream Mathlib.")
        result_path.write_text(json.dumps(record, indent=2) + "\n")
        print("PASS: isolated uniform example, source totals, and standard-axiom audit.", flush=True)
    except Exception as error:
        record.update(status="FAIL", finished_unix=time.time(), error=str(error))
        result_path.write_text(json.dumps(record, indent=2) + "\n")
        raise


if __name__ == "__main__":
    main()
