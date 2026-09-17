# Isolated verification of the uniform example

This extension proves the paper's uniform pair, with factor orders **310472** and **934177**, product color bound **1184**, and minimum factor quantum chromatic number **1185**. It also proves the strict inequality for colorings in arbitrary nonzero unital complex C*-algebras.

The matrix is the frozen Round4 source matrix, with **no diagonal weights**. New kernel-checked scalar identities are

```
trace M = 400025192
sum M   = 1202501792
394 * sum M - 1184 * trace M = 155878720 > 0
```

`SourceTotals.lean` reduces the full entry sum to four times the entry sum of the 197-by-197 trivial Fourier block. It verifies the reduced sum and the 197-term diagonal sum by kernel reduction. No floating arithmetic, external numerical premise, or native decision procedure enters these proofs.

## New source inventory

1. `Hedetniemi/Expository/SourceTotals.lean`: exact source totals and their unweighted gap.
2. `Hedetniemi/Expository/Uniform.lean`: the uniform graph, product coloring, direct unweighted operator obstruction, independent embedding obstruction, and closed q/C* conclusions.
3. `Hedetniemi/Expository/Audit.lean`: concrete type-ascribed uses, safe closed endpoint checks, and transitive axiom checks for every safe declaration in the two imported extension modules.
4. `verify_expository.py`: the separate reproducible audit driver.

Other `Expository/Regular*.lean` work, if present, is outside this audit. The audit result records unrelated files explicitly and does not claim to verify them.

## Reproduction and trust scope

From the `LeanHedetniemi` directory, after the frozen prerequisite audits have completed:

```
python3 verify_expository.py
```

The driver checks the source and object hashes recorded by both earlier completed audits, checks the pinned Lean compiler and Lake hashes, and recompiles the three new modules with warnings treated as errors. It then verifies that all ten designated endpoints are safe parameter-free theorems and that their only possible transitive axioms are `propext`, `Classical.choice`, and `Quot.sound`. It also checks the same axiom policy for all safe declarations in the two new proof modules.

The driver writes `verification_expository/result.json` and separate compilation logs. It starts with an `IN_PROGRESS` record, writes `FAIL` on error, and writes `PASS` only after the source, dependency, endpoint, and axiom checks finish. It verifies frozen dependency hashes again at the end. Existing Lean sources, old proof objects, and previous audit records are neither modified nor rebuilt.

This is an incremental audit against previously audited local proof objects and cached upstream Mathlib. It does not claim to rerun the long Round4 certificate compilation. Source snapshots and exact source/object/dependency hashes are retained in this directory for the added layer. The older shortened-fiber counterexample remains unchanged and independently available as the paper's refinement.

## Principal theorem names

All names have prefix `Hedetniemi.Expository.`:

- `sourceMatrix_trace`, `sourceMatrix_entry_sum`, `source_uniform_gap`
- `uniformG_card`, `uniform_product_colorable`
- `uniformG_no_projective_coloring`, `uniformG_no_projective_coloring_via_embedding`
- `uniformG_not_quantumColorable`, `uniformG_quantumChromaticNumber_lower`
- `uniform_quantum_counterexample`, `uniform_quantum_hedetniemi_fails`
- `uniform_cstar_counterexample`, `uniform_cstar_hedetniemi_fails`

The generic operator obstructions quantify over a C*-algebra and a hypothetical coloring. The designated graph/count/counterexample endpoints are closed and carry no such hypotheses.
