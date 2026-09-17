# Frozen baseline proof package

This is the unchanged 371-source baseline used by the paper's smaller example
and by both extensions. This explanatory README was added when assembling the
GitHub folder; none of the original Lean sources, manifest, or checker changed.

From the parent folder, check source integrity without compiling:

```sh
python3 lean/check.py --check-sources
```

For proof compilation, install Python 3.9+, Git, and
[elan](https://github.com/leanprover/elan), with `lake` on `PATH`. This folder's
`lean-toolchain` selects Lean 4.19.0; `lakefile.toml` pins Mathlib commit
`c44e0c8ee63ca166450922a373c7409c5d26b00b`.

From this folder:

```sh
lake update
lake exe cache get
python3 check.py
```

Then return to the parent folder and check both separately audited extensions:

```sh
cd ..
python3 lean_extension/check.py
```

On a clean installation this command currently stops at its first module; see
"Known issue of the extension checker" in the parent README.

The baseline full run writes `logs/verification_result.json`. The extension
requires that default-location result to be a full `PASS`; a source-only run is
not sufficient. Both checkers treat warnings as errors. Dependency setup needs
internet access and several gigabytes of storage. The historical workspace that
the recorded audit files mention is not part of this repository.

See the parent [README](../README.md), original
[verification guide](../VERIFICATION_GUIDE.md), and
[theorem map](../THEOREM_MAP.md) for scope and recorded audit details.
