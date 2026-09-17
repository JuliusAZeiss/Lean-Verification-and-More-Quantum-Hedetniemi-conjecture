# Separately audited Lean extensions

This folder adds the paper's regular main example and uniform 788-base example
to the frozen proof package in `../lean/`. The original 371 sources and their
checker are unchanged. Two separate completed Lean audits cover the eleven
sources here:

- **Regular example:** eight sources, 120 safe declarations, and seventeen
  specified closed endpoints. They prove the sparse matrix identity, the
  sum-of-squares identity and positivity, and the counterexample on 524,288 and
  1,576,451 vertices at product color threshold 1,538.
- **Uniform 788-base example:** three sources, 37 safe declarations, and ten
  specified closed endpoints. They prove exact source-matrix totals and the
  counterexample on 310,472 and 934,177 vertices at threshold 1,184.

Both audits allow only `propext`, `Classical.choice`, and `Quot.sound`. Both
examples include the strict quantum-chromatic inequality and the stronger
obstruction to projective colorings over arbitrary nontrivial unital
C*-algebras. The original baseline covers the smaller, unequal-fiber first
factor with 310,317 vertices. The formal parameters are the ones defined in
the Lean sources; the equivalence with operational quantum coloring games is
supplied by the paper's references, rather than proved in these modules.

## Commands

From the supplement folder, check the delivered source identities and import
coverage without compiling:

```sh
python3 lean/check.py --check-sources
python3 lean_extension/check.py --check-sources
```

For a new proof verification, first follow `lean/README.md` to provide the
pinned Lean 4.19.0 and Mathlib environment. Then run, in this order:

```sh
python3 lean/check.py
python3 lean_extension/check.py
```

Both commands require `lake` on `PATH`; the extension requires the same `lake`
binary and Lean version used by the successful baseline run. The baseline must
write its default `lean/logs/verification_result.json`. A source-only check is
not a baseline proof verification and does not permit the extension's full run.
Neither checker installs a toolchain or downloads dependencies.

The extension checker validates the baseline's successful result, source and
configuration hashes, all 371 compiled object hashes, and its final audit log.
It then compiles all eleven extension modules in dependency order, with warnings
treated as errors, and runs each unchanged audit after its dependencies. Objects are
written only under `lean_extension/.lake/`; logs and the new result are written
under `lean_extension/logs/`. Unexpected extension objects that could shadow
baseline or upstream modules are rejected. The checker verifies at completion
that the frozen inputs and baseline objects have not changed.
It resolves, hashes, and holds fixed the actual Lean compiler for the extension
run. The frozen baseline driver records the compiler version and Lake binary
hash, but not a separate Lean binary hash; the extension cannot retrospectively
add that item to the original baseline record.

A new `PASS` with `lean_verified: true` is recorded only if compilation and all
twenty-seven endpoint and both declaration-axiom checks succeed. Failure, interruption, or a
source-only run records no proof-verification pass. The checker always replaces
an old result before starting, so a failed rerun cannot leave a stale `PASS`.

## Files and verification scope

- `Hedetniemi/Expository/RegularBase.lean`, `RegularIdentityDefinition.lean`,
  `RegularAlgebra.lean`, `RegularKernelPolynomial.lean`, `RegularSparse.lean`,
  and `RegularPSD.lean`: the explicit regular base, sparse integer identity,
  polynomial and sum-of-squares arguments, and positivity.
- `Hedetniemi/Expository/RegularCounterexample.lean`: the concrete regular-base
  graphs, product coloring, graph orders, and quantum and C*-algebraic results.
- `Hedetniemi/Expository/RegularAudit.lean`: the regular group's closed-endpoint
  and transitive-axiom audit.
- `Hedetniemi/Expository/SourceTotals.lean`: exact trace and entry sum of the
  unweighted source matrix, and the strict numerical gap.
- `Hedetniemi/Expository/Uniform.lean`: the uniform blow-up, graph orders,
  product coloring, lower bound, and quantum and C*-algebraic conclusions.
- `Hedetniemi/Expository/Audit.lean`: the closed-endpoint and transitive-axiom audit.
- `extension_manifest.json`: pinned source identities and recorded audit evidence.
- `audit/uniform/`: the completed original isolated audit and its compiler logs.
  `original_verify_expository.py` and `ORIGINAL_README.md` are retained as
  provenance, including their original workspace paths; use `check.py` here
  for the portable verification procedure.
- `audit/regular/`: the completed original regular audit and its eight compiler
  logs. `original_verify_regular.py` and `ORIGINAL_README.md` preserve the
  original audit's instructions and paths as provenance; use this folder's
  `check.py` for portable verification. All eight sources were freshly compiled
  for this audit without resume records.
- `TESTING.md`: tests of this portable packaging and parser, separate from the
  original mathematical proof audit.

Hashes identify the delivered files; they do not prove the mathematical claims.
The original recorded audits and a new successful compilation are different
pieces of evidence. Packaging tests performed here validate the exact sources,
audit records, parser failures, and baseline isolation; they do not claim a
fresh installation or a full recompilation through this portable driver.
The verification trusts the Lean kernel/toolchain and the pinned upstream
Mathlib environment used by the baseline checker.

Only these two completed extensions are included. The abandoned larger
`RegularIdentity00`–`RegularIdentity31` fallback batches are not dependencies
of the regular proof and are not packaged. Further extensions may be packaged
only after their own completed audits and an explicit manifest update.
