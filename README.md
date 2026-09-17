# Lean verification and supplementary material: a counterexample to the quantum Hedetniemi conjecture

Formal proofs, exact certificates and independent numerical checks for the paper

> J. A. Zeiss, *A counterexample to the quantum Hedetniemi conjecture*.

This repository contains complementary material only. It does not contain the paper.

| Example | First factor | Second factor | Ordinary coloring of the product | Minimum of the quantum chromatic numbers of the factors |
|---|---:|---:|---:|---:|
| Main example (Theorem 1) | 524,288 vertices | 1,576,451 vertices | 1,538 colors | 1,539 |
| Appendix A, G_0 | 310,472 vertices | 934,177 vertices | 1,184 colors | 1,185 |
| Appendix A, G'_0 | 310,317 vertices | 934,177 vertices | 1,184 colors | 1,185 |

The lower bounds for the factors hold for colorings by projections in every nonzero
unital C*-algebra. No claim of minimality is made.

## Contents

- [THEOREM_MAP.md](THEOREM_MAP.md): the correspondence between the statements of
  the paper and the Lean declarations, the main formal statements, and the exact
  scope of the formalization.
- [lean/](lean/): the baseline development (371 Lean sources) and its checker
  `lean/check.py`.
- [lean_extension/](lean_extension/): eleven further Lean sources (namespace
  `Hedetniemi.Expository`, including the main example) and their checker.
- [data/](data/): the exact integer certificates of Appendix A
  (`matrix_certificate.json`, `gram_certificate.json.gz`, `instance.json`) and two
  Python checkers (`verify_regular.py`, `verify.py`).
- [numerics/](numerics/): three further exact Python checks that follow the text
  of the paper and are independent of the checkers in `data/`.
- [audit/](audit/) and `lean_extension/audit/`: the recorded results of the Lean
  audits (endpoint types, declaration inventories, axiom lists, compiler logs).
- [VERIFICATION_GUIDE.md](VERIFICATION_GUIDE.md): the README of the original
  supplement, unchanged. It was written for an earlier draft of the paper. Where
  it mentions `THEOREM_MAP.md` and `SHA256SUMS`, it means the files of that
  supplement. Its remark that no run on a clean installation had been repeated,
  and its instruction to run `lean_extension/check.py`, are superseded by the
  section "Compiling the Lean proofs" below. The README files inside `lean/` and
  `lean_extension/` also come from the original supplement.
- `ORIGINAL_SUPPLEMENT_SHA256SUMS`: the checksum list of that supplement (426
  entries). Its entry `README.md` is the file now named `VERIFICATION_GUIDE.md`.
  Its entry `THEOREM_MAP.md` is the theorem map of the original supplement, which
  the present `THEOREM_MAP.md` replaces. Its entry
  `audit/earlier_dependency_audit.json` is not included here (see the notes
  below). `shasum -c` reports these three entries as failed or missing; the other
  entries match the files of this repository. Use `SHA256SUMS` to check the
  repository.

The development uses Lean **4.19.0** (`lean/lean-toolchain`) and Mathlib at commit
`c44e0c8ee63ca166450922a373c7409c5d26b00b` (`lean/lakefile.toml`).

## Checks that need only Python

All programs use the Python standard library and exact arithmetic (Python 3.9 or
later). None of them runs Lean.

```sh
python3 numerics/check_base_graph.py            # Section 3 and Remark 11 of the paper
python3 numerics/check_appendix_certificate.py  # the certificate of Appendix A
python3 numerics/compare_lean_data.py           # integer data in the Lean sources = JSON data
python3 data/verify_regular.py                  # checker of the original supplement, main example
python3 data/verify.py                          # checker of the original supplement, Appendix A
```

- `check_base_graph.py` reads no data. It checks the connection set S, Computations
  1 and 2, Lemma 8, equation (13), the spectrum, the intersection array, and the
  statements of Remark 11 about the code with parity-check columns S.
- `check_appendix_certificate.py` rebuilds M_0 from the orbit weights as described
  in the proof of Lemma 19 and checks symmetry, support, equation (24), the
  diagonal dominance (26) of the four residuals, the totals (22) and (23), Table 1,
  and the totals of the lifted matrix for G'_0.
- `compare_lean_data.py` decodes the integer literals of the Lean sources and
  compares them with the JSON files. Lean does not read the JSON files, so this
  comparison is the link between the Lean theorems about M_0 and the data files.
- `data/verify_regular.py` and `data/verify.py` include rejection tests and write
  result files into `data/`.

The source files can be checked against the recorded inventories without Lean:

```sh
python3 lean/check.py --check-sources
python3 lean_extension/check.py --check-sources
shasum -a 256 -c SHA256SUMS
```

These commands check file identities and import coverage. They do not compile
proofs. The two `check.py` commands write `lean/logs/verification_result.json` and
`lean_extension/logs/verification_result.json` (ignored by Git). A source-only run
of `lean/check.py` replaces the record of an earlier full run in `lean/logs/`. After
a full run, use `python3 lean/check.py --check-sources --output <another directory>`.

## Compiling the Lean proofs

Install [elan](https://github.com/leanprover/elan), then fetch the pinned
dependencies and the compiled Mathlib cache:

```sh
cd lean
lake update
lake exe cache get
cd ..
python3 lean/check.py
```

`lean/check.py` compiles the 371 baseline sources in dependency order. The last of
them is the audit module `lean/Round4Verification.lean`. The checker parses its
output and checks the ten closed endpoint theorems and the axioms of all
declarations. A run on a clean installation on 17 September 2026
(macOS, Apple M1 Pro, serial, about 80 minutes) passed. This covers Appendix A for
G'_0 and all general lemmas.

**Known issue of the extension checker.** `python3 lean_extension/check.py` is
meant to compile the eleven extension sources, which contain Theorem 1 and the
example G_0. On a clean installation it stops at its first module. The checker
puts the extension object directory first on `LEAN_PATH`. Lean 4.19 resolves
every module with root `Hedetniemi` in the first search-path entry that contains a
directory `Hedetniemi`, so the baseline imports are not found. The proofs are not
affected. With one object directory that contains the baseline `.olean` files and
the extension objects, all eleven extension sources compile with the checker's own
compiler flags, and both extension audits pass (10 and 17 endpoints; axioms
`propext`, `Classical.choice`, `Quot.sound`). This was checked on 17 September 2026.
Until the checker is corrected, the extension sources cannot be compiled with
`lean_extension/check.py`; the checker also rejects an extension object directory
that contains baseline objects. The check of 17 September 2026 was made by hand,
after a PASS of `python3 lean/check.py`. The directory `lean/.lake/build/lib/lean`
was copied to a new directory outside `lean/` and `lean_extension/`, and the copies
were compared with the recorded hashes of the baseline objects. Inside `lake env`,
run in `lean/`, this copy was put first on `LEAN_PATH`. The eleven sources were
compiled in the dependency order that the checker computes, each with the
checker's options `--root=<absolute path of lean_extension> --error=warning
-o <copy>/Hedetniemi/Expository/<name>.olean`. The logs were searched for errors
and warnings, and the output of the two audit modules was checked with the
function `parse_audit` of `lean_extension/check.py`.

On macOS 26, `lake exe cache get` may fail because the locally linked `cache`
executable is rejected by the dynamic linker. Relinking this executable with the
system compiler resolves the problem; the Lean and Lake binaries themselves work.

## Scope of the formalization

See [THEOREM_MAP.md](THEOREM_MAP.md). In short: the formal model is the projective
formulation of quantum colorings (relations (2) of the paper). Theorem 1 and
Corollary 18 are closed Lean theorems about explicitly defined graphs, for the
parameters χ, χ_q and χ_C*. They depend on no axioms other than `propext`,
`Classical.choice` and `Quot.sound`. The general results used in their proofs
(Lemma 5, Propositions 13 and 15) are formalized in general form, and Lemmas 8 and
19 for the explicit data. Theorem 2 and Corollary 6 are not separate declarations,
Lemma 14 is formalized in a different form, and Lemma 12(c) is not needed by the
Lean proof and is not formalized. The equivalence of the projective formulation
with the coloring game and the relations between the different models of quantum
colorings are taken from the literature and are not formalized.

## Notes on the recorded audit files

The files in `audit/` and `lean_extension/audit/` are the original records and
are unchanged. `lean_extension/check.py` verifies the hashes of the files in
`lean_extension/audit/`; the files in `audit/` are covered by `SHA256SUMS` only.
The records were written in the original workspace and contain absolute paths of
that workspace.

The records name files of the original workspace. The files
`verification_round4/result.json`, `endpoints.json`, `declarations.json`,
`runtime_declarations.json` and `data_consistency_review.md` are the files of the
same names in `audit/`. The folders `verification_expository/` and
`verification_regular/` are `lean_extension/audit/uniform/` and
`lean_extension/audit/regular/`; the scripts `verify_expository.py` and
`verify_regular.py` of the workspace are `original_verify_expository.py` and
`original_verify_regular.py` there. The record `verification/result.json`, which
`audit/result.json` names with its hash, belongs to an earlier development with a
different construction. It is not included. The historical workspace with earlier
and abandoned Lean developments is not part of this repository either.

## Citation

```bibtex
@misc{zeiss-lean,
  author       = {Zeiss, Julius A.},
  title        = {Lean verification and supplementary material for
                  ``A counterexample to the quantum Hedetniemi conjecture''},
  year         = {2026},
  howpublished = {GitHub repository},
  url          = {https://github.com/JuliusAZeiss/Lean-Verification-and-More-Quantum-Hedetniemi-conjecture}
}
```

## License

CC0 1.0 Universal, see [LICENSE](LICENSE).
