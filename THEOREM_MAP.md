# Correspondence between the paper and the Lean declarations

Paper: J. A. Zeiss, *A counterexample to the quantum Hedetniemi conjecture*.
The numbers below are those of the current version of the paper (Theorems 1 and 2,
Lemma 5, Corollary 6, Lemma 8, Corollary 9, Lemma 12, Proposition 13, Lemma 14,
Proposition 15, Corollary 18, Lemma 19). The file `VERIFICATION_GUIDE.md` is the
README of the original supplement, written for an earlier draft; it contains no
statement numbers.

All declarations live under the root namespace `Hedetniemi`. Sources in
`lean/` use `Hedetniemi` and `Hedetniemi.Round4`; sources in `lean_extension/`
use `Hedetniemi.Expository`.

## Notation

| Paper | Lean definition | Namespace |
|---|---|---|
| F, the base graph on 1024 vertices (Section 3) | `regularBase` | `Hedetniemi.Expository` |
| G = F[K_512] and H = H_512 of Theorem 1 | `regularG`, `regularH` | `Hedetniemi.Expository` |
| M = A + 10 I and R = A² − 8A − 180 I | `regularMatrix`, `regularGramMatrix` | `Hedetniemi.Expository` |
| F_0 (Appendix A) | `baseGraph` | `Hedetniemi.Round4` |
| M_0 (Appendix A) | `sourceMatrixInt`, `sourceMatrix` | `Hedetniemi.Round4` |
| G_0 = F_0[K_394] | `uniformG` | `Hedetniemi.Expository` |
| G'_0 (155 vertices deleted) | `smallG` | `Hedetniemi.Round4` |
| H_0 = H_394 | `smallH` | `Hedetniemi.Round4` |
| lexicographic product F[K_t] | `cliqueBlowup` | `Hedetniemi` |
| categorical product G × H | `categoricalProduct` | `Hedetniemi` |

The graph `regularG` has the vertex type `Fin 1024 × Fin 512`. The graph
`regularH` is the graph H_512 of the paper up to the names of the vertices: it is
`generalGadgetGraph regularPalette` on the inductive type `GeneralGadgetVertex`
with the constructors `anchor`, `center`, `final` and `binary`, which correspond to
the vertices e_b, f, (ℓ_{i,o} and z_{i,b}) and h_{i,b}. The generators of the
Cayley graph are `Hedetniemi.Round4.stepData`; this array contains the set S of the
paper in a different order.

## The formal model

The formal model is the projective formulation, relations (2) of the paper.

- `ProjectiveColoring G C A`, for a graph `G`, a finite color type `C` and a unital
  C*-algebra `A` (Mathlib's class `CStarAlgebra`), is a family `P : V → C → A` such
  that, for every vertex `v`, the elements `P v a` are self-adjoint idempotents
  that are pairwise orthogonal and sum to 1, and `P u a * P v a = 0` for adjacent
  `u`, `v`.
- `QuantumColorable G c` requires a `ProjectiveColoring` with `c` colors in the
  algebra of complex `d × d` matrices for some `d > 0`.
- `CStarColorable G c` requires one in some nonzero unital C*-algebra `A`
  (hypothesis `Nontrivial A`). Its definition quantifies over `A : Type`, the
  lowest of the universes `Type u`. The nonexistence statements do not depend on
  this restriction: they are derived from `regularG_no_projective_coloring`,
  `regularH_no_projective_coloring` and their analogues, which are stated for
  `A : Type*` in an arbitrary universe.
- `quantumChromaticNumber G` and `cstarChromaticNumber G` are the least such `c`.
- `Colorable` is Mathlib's `SimpleGraph.Colorable`: the existence of an ordinary
  coloring with the given number of colors.

## Main formal statements (Theorem 1)

All three are in `Hedetniemi.Expository`
(`lean_extension/Hedetniemi/Expository/RegularCounterexample.lean`).

```lean
theorem regular_quantum_counterexample :
    (categoricalProduct regularG regularH).Colorable 1538 ∧
      min (quantumChromaticNumber regularG) (quantumChromaticNumber regularH) = 1539

theorem regular_cstar_counterexample :
    CStarColorable (categoricalProduct regularG regularH) 1538 ∧
      ¬ CStarColorable regularG 1538 ∧ ¬ CStarColorable regularH 1538

theorem regularG_quantumChromaticNumber_lower :
    1639 ≤ quantumChromaticNumber regularG
```

Further declarations for Theorem 1, all in `Hedetniemi.Expository`:

- `regularG_projective_bound` states `8192 ≤ 5 * Fintype.card C` for every
  `ProjectiveColoring regularG C A` in a nonzero unital C*-algebra `A`. This is
  the bound χ_C*(G) ≥ 1639 of Theorem 1(b) and Corollary 9.
- `regularH_no_projective_coloring`, `regularH_colorable` and
  `regularH_quantumChromaticNumber` give χ_C*(H) = χ_q(H) = χ(H) = 1539.
- `regular_product_colorable` is Theorem 1(a).
- `regularG_card` and `regularH_card` give the orders 524288 and 1576451.
- `regular_quantum_hedetniemi_fails` and `regular_cstar_hedetniemi_fails` state
  the strict inequalities.

## Statement-by-statement correspondence

| Paper | Namespace | Declarations |
|---|---|---|
| Lemma 5 (theta bound in a C*-algebra) | `Hedetniemi` | `cstar_supported_psd_bound`, `ProjectiveColoring.supported_psd_bound` |
| Corollary 6 (bound for F[K_t]) | `Hedetniemi` | no declaration for `cliqueBlowup`; the generalization to variable fiber sizes is `ProjectiveColoring.variable_fiber_supported_psd_bound` (used for G'_0); see below |
| Lemma 8(a) | `Expository` | `regularBase_noClosedWalkFive`, `regularBase_noTriangles` |
| M = A + 10 I, R = A² − 8A − 180 I = M² − 28 M | `Expository` | `regularMatrix_eq_adjacency_add`, `regularGramMatrix_adjacency_polynomial`, `regularGramMatrix_polynomial` |
| Lemma 8(b), in the form (M + 4I)R + 240 M = 12 J | `Expository` | `regular_sparse_matrix_identity` |
| Equation (13), R² + 112 M² = 4096 M | `Expository` | `regularMatrix_sos` |
| Lemma 8(c) | `Expository` | `regularMatrix_posSemidef`, `regularMatrixInt_support`, `regularMatrix_trace`, `regularMatrix_entry_sum` |
| Corollary 9 | `Expository` | `regularG_projective_bound`, `regularG_no_projective_coloring`, `regularG_quantumChromaticNumber_lower` |
| Lemma 12 (operators Q_{b,a} and D_{v,b}) | `Hedetniemi`, `Round4` | Part (a): `anchor_columns` (column sums), `anchor_mask_projection`, `anchor_mask_mul_singleton` (the product formula for a singleton intersection, which is the case used). Part (b): `list_support_left`, `list_support_right`. Part (c) is not formalized: the Lean proof of Proposition 13 uses only that D_{f,i} is self-adjoint (`general_effect_sa`). Part (d): `binary_relative_identity`. Part (e): `singleton_intersection_identity`. They are applied through `generalAnchor_row`, `generalAnchor_col`, `general_support`, `general_binary_effect_sum`, `general_binary_center_zero`, `general_high_binary_zero` in `Round4/GeneralGadgetOperator.lean` |
| Proposition 13, first assertion | `Round4` | `general_gadget_no_projective_coloring`; instances `Expository.regularH_no_projective_coloring`, `smallH_no_projective_coloring` |
| Proposition 13, ordinary (c+1)-coloring | `Round4` | `general_gadget_colorable` |
| Lemma 14 and Proposition 15 (product coloring) | `Hedetniemi`, `Round4` | `generalProductColoring` (a definition that constructs the coloring), with `generalEvaluation_allowed`, `generalEvaluation_basicEdge`; instance `Expository.regular_product_colorable`. Lemma 14 is not a separate statement; its content is `radiusTwo_parity_proper` (`LocalColoring.lean`), `closedOne_neighbor_radius` and `odd_neighbor_radius` |
| Corollary 18 for G_0 | `Expository` | `uniform_quantum_counterexample`, `uniform_cstar_counterexample`, `uniform_cstar_hedetniemi_fails`, `uniform_product_colorable`, `uniformG_card`, `uniformG_no_projective_coloring` |
| Corollary 18 for G'_0 | `Round4` | `small_product_colorable`, `factors_min_quantumChromaticNumber`, `unconditional_cstar_product_counterexample`, `quantum_hedetniemi_counterexample`, `cstar_hedetniemi_counterexample`, `smallG_card`, `smallH_card`, `smallG_no_projective_coloring` |
| Lemma 19: M_0 ⪰ 0 | `Round4` | `sourceMatrixInt_posSemidef` |
| Lemma 19: support, equations (25) and (26) | `Round4` | `sourceMatrixInt_support`, `concrete_block_transform`, `all_residual_checks` |
| Lemma 19: totals (22) and (23) | `Expository` | `sourceMatrix_trace`, `sourceMatrix_entry_sum`, `source_uniform_gap` |
| Totals of M̃ (proof of Corollary 18 for G'_0) | `Round4` | `weighted_numerator`, `weighted_denominator` |

### Statements that are not single declarations

- **Theorem 2** is formalized through its components. `cstar_supported_psd_bound`
  and `general_gadget_no_projective_coloring` hold for an arbitrary nonzero unital
  C*-algebra. The latter and `generalProductColoring` use abstract finite types of
  labels and indices (the structure `GeneralPalette`) in place of [c], [p] and Γ.
  `generalProductColoring` applies to an arbitrary base graph without closed walks
  of length five and an arbitrary natural number `t`. Theorem 1 and Corollary 18 are the
  instances that the paper uses, and they are complete Lean theorems.
- **Corollary 6** is applied inside the instances: `regularG_projective_bound`
  and `uniformG_no_projective_coloring` apply
  `ProjectiveColoring.supported_psd_bound` to `M.submatrix Prod.fst Prod.fst`,
  which is the matrix M ⊗ J_t of the paper.
- A closed walk of length three gives a closed walk of length five (Remark 3(i)).
  The general product coloring therefore uses the single hypothesis
  `NoClosedWalkFive F`.

## Scope

- The three main statements and the theorems listed for Corollary 18, except
  `uniformG_no_projective_coloring` and `smallG_no_projective_coloring`, have no
  hypotheses and no universe parameters. They are statements about explicitly
  defined graphs. The two exceptions take one hypothesis, a `ProjectiveColoring`
  with 1184 colors in a nonzero unital C*-algebra `A : Type*`, and conclude
  `False`. They are universe polymorphic on purpose (see "The formal model").
- The sources contain neither `sorry` nor `native_decide`, and they declare no
  axioms. The audit modules `lean/Round4Verification.lean`,
  `lean_extension/Hedetniemi/Expository/Audit.lean` and
  `lean_extension/Hedetniemi/Expository/RegularAudit.lean` compute, with
  `Lean.collectAxioms`, the axioms on which the declarations of the development
  depend. They fail unless these axioms are among `propext`, `Classical.choice`
  and `Quot.sound`. In particular no proof depends on `sorryAx` or on
  `Lean.ofReduceBool`. The trusted base consists of the kernel of Lean 4.19.0 and
  of Mathlib at the commit fixed in `lean/lakefile.toml`.
- Recorded results: `audit/result.json` and `audit/endpoints.json` (baseline, ten
  endpoints), `lean_extension/audit/uniform/result.json` (ten endpoints) and
  `lean_extension/audit/regular/result.json` (seventeen endpoints).
- **Not formalized:** the equivalence of relations (2) with perfect strategies of
  the coloring game, and the relations (3) between the parameters χ_C*, χ_qc,
  χ_qa, χ_qs, χ_q and χ. They are taken from the literature cited in the paper.
  The statements of the paper about χ_qs, χ_qa and χ_qc follow from the formalized
  statements about χ_q and χ_C* and from (3).
- **Certificate data.** Lean does not read the JSON files in `data/`. The Lean
  theorems about M_0 are statements about integer literals in the Lean sources.
  That these literals agree with the JSON files is checked, outside Lean, by
  `numerics/compare_lean_data.py`; an earlier report of the same comparison is
  `audit/data_consistency_review.md`.
- Remark 11 of the paper (identification of F with the coset graph of the
  truncated binary Golay code, spectrum, intersection array) is not used in the
  proofs and is not formalized. Its finite computations are checked by
  `numerics/check_base_graph.py`.
