import Hedetniemi.Expository.Uniform
import Hedetniemi.Expository.SourceTotals
import Lean.Util.CollectAxioms

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

open Lean Elab Command in
elab "#audit_expository" : command => do
  let env ← getEnv
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  let modules := env.allImportedModuleNames.filter fun m =>
    (`Hedetniemi.Expository).isPrefixOf m
  let mut state : Lean.CollectAxioms.State := {}
  let mut count := 0
  for (name, info) in env.constants.toList do
    if let some idx := env.getModuleIdxFor? name then
      let owner := env.allImportedModuleNames[idx.toNat]!
      if modules.contains owner && !info.isUnsafe then
        let (_, next) := ((Lean.CollectAxioms.collect name).run env).run state
        state := next
        for ax in state.axioms do
          unless allowed.contains ax do
            throwError "Unexpected axiom {ax} in {name}"
        count := count + 1
  if count == 0 then throwError "Empty extension audit"
  let endpoints := #[
    `Hedetniemi.Expository.sourceMatrix_trace,
    `Hedetniemi.Expository.sourceMatrix_entry_sum,
    `Hedetniemi.Expository.source_uniform_gap,
    `Hedetniemi.Expository.uniformG_card,
    `Hedetniemi.Expository.uniform_product_colorable,
    `Hedetniemi.Expository.uniformG_quantumChromaticNumber_lower,
    `Hedetniemi.Expository.uniform_quantum_counterexample,
    `Hedetniemi.Expository.uniform_quantum_hedetniemi_fails,
    `Hedetniemi.Expository.uniform_cstar_counterexample,
    `Hedetniemi.Expository.uniform_cstar_hedetniemi_fails]
  for name in endpoints do
    let some info := env.find? name | throwError "Missing endpoint {name}"
    unless info.isTheorem && !info.isUnsafe && info.levelParams.isEmpty do
      throwError "Endpoint is not a safe universe-free theorem: {name}"
    if info.type.isForall || info.type.hasFVar || info.type.hasMVar then
      throwError "Endpoint has free hypotheses: {name}"
    let axioms ← Lean.collectAxioms name
    for ax in axioms do
      unless allowed.contains ax do throwError "Unexpected endpoint axiom {ax}"
    let typeText ← liftTermElabM do
      let type ← Lean.Meta.whnf info.type
      if type.isForall then throwError "Hidden endpoint parameters: {name}"
      unless ← Lean.Meta.isProp info.type do throwError "Nonpropositional endpoint: {name}"
      pure (← Lean.Meta.ppExpr info.type).pretty
    let record := Json.mkObj [
      ("name",toJson name.toString),("safe",toJson true),
      ("closed",toJson true),("type",toJson typeText),
      ("axioms",toJson (axioms.map Name.toString))]
    logInfo m!"EXPOSITORY_ENDPOINT {record.compress}"
  let summary := Json.mkObj [
    ("safe_declaration_count",toJson count),
    ("modules",toJson (modules.map Name.toString)),
    ("axioms",toJson (state.axioms.map Name.toString))]
  logInfo m!"EXPOSITORY_AUDIT_PASSED {summary.compress}"

open Hedetniemi Hedetniemi.Round4 Hedetniemi.Expository in
example :
    (categoricalProduct (cliqueBlowup baseGraph : SimpleGraph (Fin 788 × Fin 394))
      smallH).Colorable 1184 ∧
    min (quantumChromaticNumber
      (cliqueBlowup baseGraph : SimpleGraph (Fin 788 × Fin 394)))
      (quantumChromaticNumber smallH) = 1185 := uniform_quantum_counterexample

open Hedetniemi Hedetniemi.Round4 Hedetniemi.Expository in
example :
    cstarChromaticNumber
      (categoricalProduct (cliqueBlowup baseGraph : SimpleGraph (Fin 788 × Fin 394)) smallH) <
    min (cstarChromaticNumber
      (cliqueBlowup baseGraph : SimpleGraph (Fin 788 × Fin 394)))
      (cstarChromaticNumber smallH) := uniform_cstar_hedetniemi_fails

open Hedetniemi.Round4 Hedetniemi.Expository in
example : Fintype.card (Fin 788 × Fin 394) = 310472 ∧
    Fintype.card SmallHVertex = 934177 := ⟨uniformG_card,smallH_card⟩

#audit_expository
