# Portable extension checker: packaging tests

These tests concern the portable checker and its packaging. They supplement the
completed original proof audits in `audit/uniform/result.json` and
`audit/regular/result.json`; they do
not replace it and do not claim a fresh full compilation of the supplement.

The following checks passed:

1. `check.py --check-sources` verified all eleven extension source hashes, all
   recorded evidence hashes, exact extension source inventory and import closure,
   each source's identity against its completed original audit record, and the
   unchanged 371-source baseline inventory. The original uniform source and
   evidence hashes stayed unchanged when the regular group was added.
2. Parsing the original real Lean audit logs returned exactly ten specified safe,
   closed endpoints and the 37-declaration summary for the uniform group, and
   seventeen closed endpoints and the 120-declaration summary for the regular
   group. Each summary names exactly the corresponding non-audit source modules.
3. Thirty-four altered audit logs were rejected, seventeen per group: missing or duplicate endpoint;
   missing or duplicate summary; wrong or Boolean declaration count; wrong or
   duplicate audited module; `sorryAx` in the summary or an endpoint; unsafe or
   open endpoint; numeric value in place of a Boolean flag; empty endpoint type;
   unexpected endpoint; malformed extra marker; duplicate JSON key.
4. Separate temporary copies with an altered Lean source, an extra Lean source,
   or altered recorded audit evidence were rejected.
5. A full run without a completed baseline result failed before compilation and
   wrote `FAIL` with `lean_verified: false`. A source-only baseline result was
   also rejected. An output path inside the baseline was rejected before writing.
6. Baseline file hashes remained unchanged after source-only checking and these
   failure tests.
7. Two tiny test modules were compiled using the exact separate-root command
   mechanism: Lake supplied the existing pinned environment, the extension
   object directory was prepended, `--root` named the separate source root, and
   the second module imported the first. This tests compiler invocation and
   dependency lookup, not the mathematical extension endpoints.

The regular group contains exactly eight sources from its completed audit;
all eight were freshly compiled without adopting prior compilation records.
The unused 32 convolution-batch fallback sources are absent. The eleven-source
portable extension checker runs both original audits after their dependencies.

The full portable procedure is intentionally gated on a new successful run of
the baseline checker. No such long baseline rerun was performed merely to test
this packaging. The completed mathematical extension audits delivered here were
run separately against the frozen verified baseline and are preserved verbatim.

The checker was also reviewed for stale results, missing or duplicated audit
records, unknown source or object imports, dependency ordering, altered inputs,
baseline mutation, and interruption handling. It compiles every extension
source afresh, rejects shadowing object files, and records proof verification
only after all packaged audit groups pass.
