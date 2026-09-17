# Supplementary data consistency review

This read-only review compared the production Round4 Lean definitions with the frozen package in `research/quantum_hedetniemi_2026-09-16/smaller_search/round4_certification/`. No proof source or verifier was edited, and no Lean compiler was run for this comparison. The comparison supplements the running Lean audit; it is **not an independent Lean PASS**.

## Comparisons performed

The production sources reviewed were `SmallGraphs.lean`, `ProductColoring.lean`, `GeneralGadget.lean`, `CertificateGraph.lean`, `CertificateWeights.lean`, `CertificateData.lean`, `CertificateFactors.lean`, the 100 `CertificateFactorB*P*.lean` data modules, and the final lower-bound/endpoint definitions. The frozen inputs were `instance.json`, `matrix_certificate.json`, `gram_certificate.json.gz`, and the gadget specification in `PROOF_LEDGER.md`.

A separate Python comparison decoded the actual `NatLookupTree` expressions using the lookup rule defined in Lean, then unpacked the signed 32-bit entries. It compared:

- All 197 cosets and all 788 sorted vertex coordinates, including the piecewise `cosetNat` lookup.
- All 22 exported Cayley generators, in their stated order.
- All 155,236 kernel entries: four matrices of size 197 by 197, reconstructed independently from the JSON orbit specifications and integer weights.
- All 155,236 Fourier-block entries, against the signed character sums of those kernels.
- All 155,236 entries of the packed Gram factors, using the stated zero entries above the diagonal.
- All 788 production direct factor lists and every one of their positions in the factor lookup trees, against the frozen compressed Gram certificate.
- The Gram scale, exactly 1,000,000.
- All diagonal congruence weights: default 74 and all 20 exceptional coordinates.
- All fiber sizes: default 394, with the sole exception 239 at coordinate 996, which is vertex index 760 in the sorted Lean ordering.

Every comparison agreed exactly. These were integer comparisons, not floating-point tolerance checks.

## Recomputed parameters

The comparison reconstructed the source matrix and recomputed the weighted sums directly from its entries, the diagonal weights, and the fiber sizes.

| Quantity | Exact value |
|---|---:|
| Base vertices | 788 |
| First-factor vertices | 310317 |
| Second-factor vertices | 934177 |
| Product-color threshold | 1184 |
| Source-matrix trace | 400025192 |
| Source-matrix entry sum | 1202501792 |
| Weighted lifted numerator N | 1020438226912198088 |
| Weighted lifted denominator D | 861856598314848 |
| Strict integer gap N − 1184 D | 14507418056 |

These values agree with both `instance.json` and the production Lean statements. In particular, the denominator and the strict gap are positive.

## Gadget and enumeration comparison

In zero-based labels, the concrete Lean gadget uses center labels 0 through 787, private anchors 789 through 1183, and residual list `{0, …, 788} \ {i}` in block `i`. Each block has 394 low finals, 395 high finals, and 395 binaries. These lists, the anchor edges, the binary edges, and the final clique agree with the frozen gadget specification. Consequently its order is

`1184 + 1 + 788 × (394 + 395 + 395) = 934177`.

Lean enumerates the residual labels by replacing the center label with the spare anchor 788. The ledger instead enumerates the residual list increasingly before splitting it into even and odd palettes. These enumerations differ in some blocks. This changes the particular evaluation coloring, but does not change the graph: each low final has the whole residual list, and the high-final and binary lists depend only on the residual set and their private labels. Low-final vertices may be identified by their ordinal indices; their individual palette labels do not determine any additional edge. Both constructions therefore describe the same gadget and support the same product-color threshold 1184.

## Scope

No data mismatch was found. This review establishes agreement between the mathematical instance described by the frozen package and the concrete data used by the production Lean development. It does not replace kernel verification of positivity, the operator obstruction, the product coloring, or the final closed theorem. The status of that verification belongs to the full audit's own result record.
