# Supplement to “A counterexample to the quantum Hedetniemi conjecture”

Author: Julius A. Zeiss. Revised 16 September 2026.

This supplement contains the exact certificate data, 382 local Lean source files, the three completed audit records, and reproduction instructions. The paper proves the following separations, in the projective quantum-coloring model and in nonzero unital complex C*-algebras:

| Paper example | First factor order | Second factor order | Product coloring | Minimum factor quantum chromatic number |
|---|---:|---:|---:|---:|
| Main theorem | 524288 | 1576451 | 1538 colors | 1539 |
| Uniform appendix example | 310472 | 934177 | 1184 colors | 1185 |
| Shortened appendix example | 310317 | 934177 | 1184 colors | 1185 |

The factor lower bounds impose no dimension or trace assumption. Global minimality is not claimed. `THEOREM_MAP.md` matches the paper's statements and graph notation to exact Lean declarations.

## Contents

- `data/verify_regular.py`: self-contained integer checker for the main regular base, its sparse identity and sum-of-squares certificate, with six rejection tests. It uses only the 22 printed generators.
- `data/regular_verification_result.json`: its recorded passing result.
- `data/instance.json`: retained coordinates, shortened clique sizes, diagonal weights, threshold and expected totals for the appendix example.
- `data/matrix_certificate.json`: the appendix's 197 cosets, coordinate basis, generators and 2189 integer-weighted matrix orbits.
- `data/gram_certificate.json.gz`: four integer lower-triangular Gram factors, with scale 1000000.
- `data/verify.py`: integer-only appendix checker with twelve rejection tests.
- `lean/`: unchanged 371-source baseline package and its original standalone checking driver.
- `lean_extension/`: 11 additional source files, exact source manifest, separate checking driver, and original passing audit evidence for the uniform and regular constructions. Its README and TESTING.md describe the extension checks.
- `audit/`: unchanged original Round4 audit, exact theorem types, declaration inventories, data-consistency review and earlier-dependency audit evidence.
- `SHA256SUMS`: hashes for the delivered files. Hashes identify files; they are not mathematical proofs.

## Run the independent integer checks

Python 3.9 or later is sufficient; no numerical libraries or optimization solvers are needed.

```sh
python3 data/verify_regular.py
python3 data/verify.py
```

The first program verifies both forms of the main matrix certificate exactly. The second verifies graph support, the four Fourier blocks, every Gram residual, diagonal dominance and the weighted appendix totals. Both write their results in `data/`.

Neither program executes Lean or checks the abstract operator and product-coloring proofs. Their `lean_executed_by_this_program: false` fields describe that scope, not the status of the formal proofs supplied here. The appendix checker's logic is unchanged from the frozen original; only that field name and its final scope message were clarified for publication.

## Check source identity without installing Lean

```sh
python3 lean/check.py --check-sources
python3 lean_extension/check.py --check-sources
```

These check source hashes, inventories and import coverage. They are integrity checks, not proof compilations. Every delivered Lean source is byte-for-byte identical to its completed original audit record. The extension driver verifies both the unchanged baseline and the separately audited extension manifests.

## Recompile the full paper's proof

Install Lean through `elan`, with `lake` on PATH. The package selects Lean 4.19.0 and pins Mathlib to commit `c44e0c8ee63ca166450922a373c7409c5d26b00b`.

First obtain the upstream dependencies and compile the baseline:

```sh
cd lean
lake update
lake exe cache get
python3 check.py
```

Then, from the supplement root:

```sh
python3 lean_extension/check.py
```

The extension driver requires the baseline driver's full PASS and checks its source, configuration and object provenance. It compiles extension objects in a separate directory, preserving all baseline sources and objects. Both drivers treat warnings as errors and run the exact endpoint and axiom audits. They write fresh results under their respective `logs/` directories.

Dependency installation requires internet access and several gigabytes of storage. The full baseline is substantial: its recorded original run took about 42 minutes with two compiler processes; the portable driver runs serially. The fresh regular extension audit took about 113 seconds in the original prepared workspace.

A clean standalone dependency installation and full run of the portable drivers have not been repeated during this revision. The original complete proof audits have passed. Packaging checks additionally include source and evidence validation, negative parser and mutation tests, and a real-Lean smoke test of the extension driver's environment and separate-root invocation. These distinctions are deliberate: a packaging check is not presented as another full proof run.

## Exact formal scope

The unchanged Round4 audit compiled 362 new modules, checked 8328 safe declarations in its 370 imported local proof modules, and verified ten closed endpoints. Nine earlier local dependencies were checked against their completed audit. Including its audit source gives 371 baseline source files.

The uniform extension checks 37 safe declarations and ten closed endpoints. The regular extension freshly compiles eight modules and checks 120 safe declarations and seventeen closed endpoints. Its final proof uses the short sparse identity; no abandoned large-batch checks are included or trusted.

All designated endpoints are safe and closed. Their transitive axiom dependencies contain only `propext`, `Classical.choice` and `Quot.sound`. There are no unfinished proofs, custom mathematical axioms or native-evaluation axioms in those dependencies. The Lean kernel/toolchain and cached upstream Mathlib remain trusted software dependencies.

The proof uses the paper's projective quantum-coloring definition. The published equivalence with general finite-dimensional graph-coloring-game strategies is cited, not separately formalized. The Golay-code provenance is contextual; the formal proof uses the explicit binary generators directly.

The original audit records retain their workspace provenance. Use the portable commands above for this supplement, rather than interpreting a historical workspace command as a portable one.
