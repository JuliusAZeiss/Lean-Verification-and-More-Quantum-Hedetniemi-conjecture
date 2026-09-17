# Lean verification of the smaller counterexample

**Status: PASS, completed 16 September 2026 at 19:21 UTC.** The recorded run has
`"status": "PASS"` and `"concrete_round4_verified": true` in
[verification_round4/result.json](verification_round4/result.json).

Lean 4.19.0 compiled all 362 new modules with warnings treated as errors. The
transitive axiom audit covered all 8,328 safe declarations, including 7,244
theorems, from the 370 imported local proof modules. All ten final endpoints
passed the independent checks for closed theorem types and allowed axioms.
The exact transitive axiom union is `propext`, `Classical.choice`, and `Quot.sound`.
No unfinished proof, custom axiom, or native evaluation axiom is admitted.
The full run took 41.79 minutes; source, object, dependency, compiler, and
configuration hashes were checked before reporting success.

The verified closed theorem is
`Hedetniemi.Round4.quantum_hedetniemi_counterexample` in
`Hedetniemi/Round4/Disproof.lean`. It fixes the actual graphs, rather than assuming
the existence of a suitable graph or positive matrix:

\[
|V(G)|=310317,\quad |V(H)|=934177,\qquad
\chi_q(G\times H)\le1184<1185=\min\{\chi_q(G),\chi_q(H)\}.
\]

The base graph has 788 vertices. Its explicit coordinate table, 22 XOR generators,
and unequal clique fibers are in `Hedetniemi/Round4/SmallGraphs.lean`.
The second factor and explicit product coloring are in `ProductColoring.lean`.
The matrix, its exact integer checks, and the algebraic positivity proof are
separate modules imported by `WeightedBounds.lean`.

## What the formal statements cover

- `QuantumColorable` quantifies over every finite positive matrix dimension and
  actual complex projection-valued colorings. It has no search cutoff.
- `smallG_no_projective_coloring` and `smallH_no_projective_coloring` quantify over
  arbitrary nonzero unital C*-algebras. These statements have no dimension or
  trace assumption.
- `CStarModel.lean` defines the corresponding chromatic parameter by allowing
  any such algebra. The additional verified closed endpoint is
  `cstar_hedetniemi_counterexample`, for the same concrete pair.
- The faithful-tracial endpoints explicitly convert zero forbidden tracial
  probabilities into zero operator products.
- `smallH_vertex_critical` asserts that H has quantum chromatic number 1185 and
  every single-vertex deletion has quantum chromatic number exactly 1184.
  Ordinary deletion colorings are also constructed.
- `smallH_endomorphism_injective` proves the finite-graph core property.

The development does **not** prove global minimality of this counterexample.
It also does not formalize a separate equivalence between the projection model
and general Alice/Bob mixed-state or POVM strategies, the faithful trace quotient,
or operational inclusions between q, qs, qa, and qc correlation models.
No such bridge is silently included in the verification claim.

## Reproduce the audit in this workspace

From the workspace root:

```sh
python3 LeanHedetniemi/verify_round4.py
```

The verifier compiles every new production Lean source in dependency order with
warnings treated as errors. It rejects missing imports or omitted production
sources. The frozen earlier proof dependencies are checked against the source
and object hashes of their completed audit; they are not rebuilt on each run.
The upstream Mathlib objects and pinned Lean 4.19.0 compiler are trusted software
dependencies and are not rebuilt.

`Round4Verification.lean` audits every safe declaration introduced by an imported
local proof module, including private and generated declarations. It allows only
`propext`, `Classical.choice`, and `Quot.sound`; unfinished proofs and extra axioms
fail the audit. Compiler-generated unsafe runtime declarations are inventoried
separately and cannot serve as safe proof terms. The final endpoints must be
closed theorems with no unproved graph or positivity assumptions, and independent
type-ascribed uses fix the graph definitions and numerical claims.
The full declaration audit uses one shared dependency traversal to compute the
exact union of transitive axioms; its per-declaration records report the allowed
upper bound. The closed endpoints additionally receive independent exact axiom
lists from Lean's standard collector.

The audit saves source snapshots, compilation logs, SHA-256 hashes, dependency
provenance, axiom lists, and exact endpoint types in `verification_round4/`.
The final [endpoint records](verification_round4/endpoints.json) contain the
actual types printed by Lean and their individual exact axiom lists.
The [supplementary data review](verification_round4/data_consistency_review.md)
also checks agreement with the earlier frozen numerical package.
After an interrupted or failed run, `--resume` may reuse only artifacts already
compiled by this audit whose source, object, direct dependency objects, compiler,
and configuration hashes still match. The final axiom audit always runs again.
The earlier portable Python certificate archive is frozen and predates this Lean
development; its original “not yet Lean certified” wording is historical.
