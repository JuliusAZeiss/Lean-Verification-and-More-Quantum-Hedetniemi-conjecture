import Hedetniemi.Expository.RegularCounterexample
import Lean.Util.CollectAxioms

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

open Lean Elab Command in
elab "#audit_regular" : command => do
  let env ← getEnv
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  let modules := env.allImportedModuleNames.filter fun m =>
    m.toString.startsWith "Hedetniemi.Expository.Regular"
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
    `Hedetniemi.Expository.regularMatrix_eq_adjacency_add,
    `Hedetniemi.Expository.regularGramMatrix_adjacency_polynomial,
    `Hedetniemi.Expository.regular_sparse_matrix_identity,
    `Hedetniemi.Expository.regularMatrix_sos,
    `Hedetniemi.Expository.regularMatrix_entry_sum,
    `Hedetniemi.Expository.regularMatrix_trace,
    `Hedetniemi.Expository.regularMatrix_posSemidef,
    `Hedetniemi.Expository.regularG_card,
    `Hedetniemi.Expository.regularH_card,
    `Hedetniemi.Expository.regularH_colorable,
    `Hedetniemi.Expository.regular_product_colorable,
    `Hedetniemi.Expository.regularG_quantumChromaticNumber_lower,
    `Hedetniemi.Expository.regularH_quantumChromaticNumber,
    `Hedetniemi.Expository.regular_quantum_counterexample,
    `Hedetniemi.Expository.regular_quantum_hedetniemi_fails,
    `Hedetniemi.Expository.regular_cstar_counterexample,
    `Hedetniemi.Expository.regular_cstar_hedetniemi_fails]
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
    logInfo m!"REGULAR_ENDPOINT {record.compress}"
  let summary := Json.mkObj [
    ("safe_declaration_count",toJson count),
    ("modules",toJson (modules.map Name.toString)),
    ("axioms",toJson (state.axioms.map Name.toString))]
  logInfo m!"REGULAR_AUDIT_PASSED {summary.compress}"

open Hedetniemi Hedetniemi.Expository in
example :
    (categoricalProduct (cliqueBlowup regularBase : SimpleGraph (Fin 1024 × Fin 512))
      regularH).Colorable 1538 ∧
    min (quantumChromaticNumber
      (cliqueBlowup regularBase : SimpleGraph (Fin 1024 × Fin 512)))
      (quantumChromaticNumber regularH) = 1539 := regular_quantum_counterexample

open Hedetniemi Hedetniemi.Round4 Hedetniemi.Expository in
example :
    cstarChromaticNumber
      (categoricalProduct (cliqueBlowup regularBase : SimpleGraph (Fin 1024 × Fin 512)) regularH) <
    min (cstarChromaticNumber
      (cliqueBlowup regularBase : SimpleGraph (Fin 1024 × Fin 512)))
      (cstarChromaticNumber regularH) := regular_cstar_hedetniemi_fails

open Hedetniemi.Expository in
example : Fintype.card (Fin 1024 × Fin 512) = 524288 ∧
    Fintype.card RegularHVertex = 1576451 := ⟨regularG_card,regularH_card⟩

open Hedetniemi Hedetniemi.Expository in
example : 1639 ≤ quantumChromaticNumber regularG := regularG_quantumChromaticNumber_lower

#audit_regular
