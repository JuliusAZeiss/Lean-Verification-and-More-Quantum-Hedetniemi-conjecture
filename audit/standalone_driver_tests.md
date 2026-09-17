# Portable Lean driver review and tests

Driver: `/private/tmp/hedetniemi_check_lean.py` (intended delivery location: `lean/check.py`).

The driver uses Python's standard library and `lake` on PATH. It accepts `--root`, `--output`, and `--check-sources`. A full run compiles the complete 371-source local dependency closure serially with warnings fatal, without artifact reuse, and compiles the unchanged `Round4Verification.lean` last. Only that last log supplies audit markers. Source-only success is recorded as `SOURCES_CHECKED`, with `lean_verified: false`; it cannot produce `PASS`.

The full path requires preinstalled Lean 4.19.0 and the README's dependency setup. The script does not download toolchains or run dependency-fetch/build commands. It checks the frozen source manifest, the exact source inventory and import closure, the unchanged final audit source, and the pinned Lake configuration. Before a final pass it rechecks sources, configuration, driver, Lake executable, and all compiled local objects. Every run invalidates any previous successful record before preflight; exceptions and interruption produce explicit non-pass records.

## Tests performed

1. Ran the actual `--check-sources` command against the prepared supplement. It accepted all 371 sources and the exact import closure, without invoking Lean.
2. Imported the driver and applied its audit-output parser to the existing completed `Round4Verification.log`. It accepted exactly 8,328 safe declarations, 7,244 theorems and ten closed final endpoints, with complete module coverage and matching runtime counts.
3. Mutated that output separately to remove an endpoint, duplicate an endpoint, remove the audit summary, duplicate the summary, introduce `sorryAx`, give an endpoint an unresolved parameter flag, mark an endpoint unsafe, and change the declaration count. Every mutation was rejected.
4. Confirmed rejection of duplicate JSON object keys.

The detailed parser result is `/private/tmp/hedetniemi_driver_parser_tests.txt`. Source-only output is `/private/tmp/hedetniemi_driver_tests/source_check/verification_result.json`.

## Review scope

I reviewed dependency ordering, exact source-closure coverage, marker parsing, duplicate detection, endpoint flags, shared-axiom-union handling, and pass/failure record transitions. There is no resume path. Hashes identify the frozen certificate version; they do not themselves establish its mathematics.

I did **not** rerun all 371 Lean compilations with this new portable driver. The full kernel-check result remains the completed original audit supplied with the archive. These tests establish the portable driver's source-check behavior and audit-output validation, not an additional fresh full Lean pass.
