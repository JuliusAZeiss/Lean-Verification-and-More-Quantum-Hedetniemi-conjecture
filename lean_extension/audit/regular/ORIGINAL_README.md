# Regular-base counterexample: separate Lean audit

`result.json` records a successful fresh Lean 4.19.0 verification of the explicit
regular-base counterexample. The audit rebuilt all eight modules in the actual
new import closure, with warnings treated as errors. No cached or previously
recorded new-module compile was adopted. The run took 112.8 seconds.

The final check inspected the transitive axioms of all 120 safe declarations in
the seven imported mathematical modules, and separately checked 17 designated
closed, universe-free theorem endpoints. Only `propext`, `Classical.choice`, and
`Quot.sound` occur. The existing unconditional and Round4 audits, sources, and
proof objects were hash-checked before and after this run and left unchanged.

## Mathematical result

The fixed binary Cayley base has 1024 vertices and 22 explicitly given generators.
The proof checks the concrete matrix identities

\[
M=A+10I,\qquad R=A^2-8A-180I,\qquad (M+4I)R+240M=12J,
\]

and derives

\[
4096M=R^*R+112M^*M\succeq0.
\]

With the 512-clique blow-up `regularG` and the explicit palette gadget
`regularH`, the closed endpoints establish:

- `|G| = 524288` and `|H| = 1576451`;
- the categorical product has an ordinary 1538-coloring;
- `chi_q(G) >= 1639` and `chi_q(H) = 1539`;
- consequently `min(chi_q(G), chi_q(H)) = 1539`;
- strict failure of the quantum and unital C*-algebraic product equalities.

The argument does not require the complete spectrum of the Cayley graph or an
external identification with a named code graph.

## New source inventory

All module names below have the prefix `Hedetniemi.Expository.`:

1. `RegularBase`
2. `RegularIdentityDefinition`
3. `RegularAlgebra`
4. `RegularKernelPolynomial`
5. `RegularSparse`
6. `RegularPSD`
7. `RegularCounterexample`
8. `RegularAudit`

The experimental `RegularIdentity00` through `RegularIdentity31` modules are
not imported, not used, and not part of this audit. The separate uniform-base
extension is also not part of this closure. Exact source snapshots are in
`sources/`, compiler logs are alongside this README, and hashes and elaborated
endpoint types are in `result.json`.

## Reproduce

From the `LeanHedetniemi` directory, with the pinned Lean runtime, cached Mathlib,
and the previously audited baseline objects available, run:

```sh
python3 verify_regular.py --jobs 2
```

The driver performs a fresh rebuild by default. Its optional strict resume
mechanism was not used for this result. The Lean audit emits
`REGULAR_ENDPOINT` records and one `REGULAR_AUDIT_PASSED` record; the driver
validates those records and writes `status: PASS` only after the final hash checks.

This verification establishes the concrete mathematical statements above. It
does not assert historical novelty or minimality of the counterexample sizes.
