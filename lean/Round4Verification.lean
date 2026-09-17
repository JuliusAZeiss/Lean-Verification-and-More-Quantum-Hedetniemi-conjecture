import Hedetniemi.Round4.Disproof
import Lean.Util.CollectAxioms

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

/-!
Kernel-level transitive axiom audit for the concrete 310317/934177-vertex pair.
Every safe declaration from the imported local proof closure is checked by
module provenance, including private and generated declarations. Runtime-only
unsafe compiler declarations are inventoried separately, never trusted as proofs.
The only permitted axioms are propext, Classical.choice, and Quot.sound.

The typed uses below fix the actual graphs, vertex counts, and color threshold.
No graph-existence, spectral, or positivity hypothesis may remain in an endpoint.
-/

open Lean Elab Command in
elab "#audit_hedetniemi_axioms" : command => do
  let env ← getEnv
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  let localModules := env.allImportedModuleNames.filter fun m => (`Hedetniemi).isPrefixOf m
  unless localModules.contains `Hedetniemi.Round4.Disproof do
    throwError "The final unconditional counterexample module was not imported"
  let mut checked := 0
  let mut theorems := 0
  let mut runtime := 0
  let mut counts : Std.HashMap Name Nat := {}
  let mut runtimeCounts : Std.HashMap Name Nat := {}
  let mut axState : Lean.CollectAxioms.State := {}
  for (name, info) in env.constants.toList do
    if let some idx := env.getModuleIdxFor? name then
      let owner := env.allImportedModuleNames[idx.toNat]!
      if localModules.contains owner then
        let kind := match info with
          | .axiomInfo _ => "axiom"
          | .defnInfo _ => "definition"
          | .thmInfo _ => "theorem"
          | .opaqueInfo _ => "opaque"
          | .quotInfo _ => "quotient"
          | .inductInfo _ => "inductive"
          | .ctorInfo _ => "constructor"
          | .recInfo _ => "recursor"
        if info.isUnsafe then
          runtime := runtime + 1
          runtimeCounts := runtimeCounts.insert owner (runtimeCounts.getD owner 0 + 1)
          let record := Json.mkObj [
            ("name", toJson name.toString),
            ("module", toJson owner.toString),
            ("kind", toJson kind),
            ("unsafe", toJson true)]
          logInfo m!"HEDETNIEMI_UNSAFE_RUNTIME_DECL {record.compress}"
        else
          let (_, nextState) := ((Lean.CollectAxioms.collect name).run env).run axState
          axState := nextState
          for ax in axState.axioms do
            unless allowed.contains ax do
              throwError "Unapproved transitive axiom {ax} in {name}, defined in {owner}"
          checked := checked + 1
          if info.isTheorem then
            theorems := theorems + 1
          counts := counts.insert owner (counts.getD owner 0 + 1)
          let record := Json.mkObj [
            ("name", toJson name.toString),
            ("module", toJson owner.toString),
            ("kind", toJson kind),
            ("unsafe", toJson false),
            ("axiom_coverage", toJson "shared_transitive_union"),
            ("axioms_upper_bound", toJson (allowed.map Name.toString))]
          logInfo m!"HEDETNIEMI_AXIOM_DECL {record.compress}"
  if checked == 0 || theorems == 0 then
    throwError "Empty declaration audit"
  let moduleRecords := localModules.map fun m => Json.mkObj [
    ("module", toJson m.toString),
    ("declaration_count", toJson (counts.getD m 0)),
    ("unsafe_runtime_declaration_count", toJson (runtimeCounts.getD m 0))]
  let summary := Json.mkObj [
    ("declaration_count", toJson checked),
    ("theorem_count", toJson theorems),
    ("unsafe_runtime_declaration_count", toJson runtime),
    ("modules", toJson moduleRecords),
    ("actual_transitive_axiom_union", toJson (axState.axioms.map Name.toString)),
    ("allowed_axioms", toJson (allowed.map Name.toString))]
  logInfo m!"HEDETNIEMI_AXIOM_AUDIT_PASSED {summary.compress}"

open Lean Elab Command in
elab "#audit_unconditional_endpoints" : command => do
  let env ← getEnv
  let endpoints := #[`Hedetniemi.Round4.quantum_hedetniemi_counterexample,
    `Hedetniemi.Round4.unconditional_quantum_product_counterexample,
    `Hedetniemi.Round4.small_product_colorable,
    `Hedetniemi.Round4.smallG_card,
    `Hedetniemi.Round4.smallH_card,
    `Hedetniemi.Round4.smallG_quantumChromaticNumber_lower,
    `Hedetniemi.Round4.smallH_quantumChromaticNumber,
    `Hedetniemi.Round4.smallH_vertex_critical,
    `Hedetniemi.Round4.cstar_hedetniemi_counterexample,
    `Hedetniemi.Round4.unconditional_cstar_product_counterexample]
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for name in endpoints do
    let some info := env.find? name | throwError "Missing final endpoint {name}"
    unless info.isTheorem && !info.isUnsafe do
      throwError "Final endpoint {name} is not a safe theorem"
    unless info.levelParams.isEmpty do
      throwError "Final endpoint {name} has universe parameters"
    if info.type.isForall || info.type.hasFVar || info.type.hasMVar then
      throwError "Final endpoint {name} has parameters or unresolved variables"
    let axioms ← Lean.collectAxioms name
    for ax in axioms do
      unless allowed.contains ax do
        throwError "Unapproved transitive axiom {ax} in final endpoint {name}"
    let typeText ← liftTermElabM do
      let type ← Lean.Meta.whnf info.type
      if type.isForall then
        throwError "Final endpoint {name} has hidden parameters"
      unless ← Lean.Meta.isProp info.type do
        throwError "Final endpoint {name} is not a proposition"
      pure (← Lean.Meta.ppExpr info.type).pretty
    let record := Json.mkObj [
      ("name", toJson name.toString),
      ("kind", toJson "theorem"),
      ("unsafe", toJson false),
      ("no_parameters", toJson true),
      ("type", toJson typeText),
      ("axioms", toJson (axioms.map Name.toString))]
    logInfo m!"HEDETNIEMI_UNCONDITIONAL_ENDPOINT {record.compress}"

-- Independently fix the concrete graph definitions and numerical conclusions.
open Hedetniemi Hedetniemi.Round4 in
example :
    quantumChromaticNumber (categoricalProduct smallG smallH) <
      min (quantumChromaticNumber smallG) (quantumChromaticNumber smallH) :=
  Hedetniemi.Round4.quantum_hedetniemi_counterexample

open Hedetniemi Hedetniemi.Round4 in
example :
    QuantumColorable (categoricalProduct smallG smallH) 1184 ∧
    ¬ QuantumColorable smallG 1184 ∧ ¬ QuantumColorable smallH 1184 :=
  Hedetniemi.Round4.unconditional_quantum_product_counterexample

open Hedetniemi Hedetniemi.Round4 in
example : (categoricalProduct smallG smallH).Colorable 1184 :=
  small_product_colorable

open Hedetniemi.Round4 in
example : Fintype.card (Σ v : Fin 788, Fin (fiberSize v)) = 310317 := smallG_card

open Hedetniemi.Round4 in
example : Fintype.card SmallHVertex = 934177 := smallH_card

open Hedetniemi Hedetniemi.Round4 in
example : 1185 ≤ quantumChromaticNumber smallG := smallG_quantumChromaticNumber_lower

open Hedetniemi Hedetniemi.Round4 in
example : quantumChromaticNumber smallH = 1185 := smallH_quantumChromaticNumber

open Hedetniemi Hedetniemi.Round4 in
example : quantumChromaticNumber smallH = 1185 ∧
    ∀ v : SmallHVertex, quantumChromaticNumber (smallH.induce {w | w ≠ v}) = 1184 :=
  smallH_vertex_critical

open Hedetniemi.Round4 in
example (f : smallH →g smallH) : Function.Injective f := smallH_endomorphism_injective f

-- These types explicitly quantify over arbitrary C*-algebras, with no dimension bound.
open Hedetniemi Hedetniemi.Round4 in
example : cstarChromaticNumber (categoricalProduct smallG smallH) <
    min (cstarChromaticNumber smallG) (cstarChromaticNumber smallH) :=
  cstar_hedetniemi_counterexample

open Hedetniemi Hedetniemi.Round4 in
example : CStarColorable (categoricalProduct smallG smallH) 1184 ∧
    ¬ CStarColorable smallG 1184 ∧ ¬ CStarColorable smallH 1184 :=
  unconditional_cstar_product_counterexample

open Hedetniemi Hedetniemi.Round4 in
example {A : Type*} [CStarAlgebra A] [Nontrivial A]
    (Q : ProjectiveColoring smallG (Fin 1184) A) : False :=
  smallG_no_projective_coloring Q

open Hedetniemi Hedetniemi.Round4 in
example {A : Type*} [CStarAlgebra A] [Nontrivial A]
    (Q : ProjectiveColoring smallH (Fin 1184) A) : False :=
  smallH_no_projective_coloring Q

#audit_unconditional_endpoints
#audit_hedetniemi_axioms
