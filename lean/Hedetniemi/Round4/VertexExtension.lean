import Hedetniemi.ColorCount

namespace Hedetniemi.Round4
open scoped BigOperators ComplexOrder

variable {V C A : Type*} [Fintype C] [CStarAlgebra A]
variable {G : SimpleGraph V} (x : V)

noncomputable def vertexExtendedP
    (Q : ProjectiveColoring (G.induce {v | v ≠ x}) C A) (v : V) : Option C → A := by
  classical
  exact fun a => match a with
    | none => if v = x then 1 else 0
    | some b => if h : v = x then 0 else Q.P ⟨v,h⟩ b

theorem vertexExtendedP_pvm
    (Q : ProjectiveColoring (G.induce {v | v ≠ x}) C A) (v : V) :
    PVM (vertexExtendedP x Q v) := by
  classical
  by_cases hv : v = x
  · refine ⟨?_, ?_, ?_, ?_⟩
    · intro a; cases a <;> simp [vertexExtendedP, hv]
    · intro a; cases a <;> simp [vertexExtendedP, hv]
    · intro a b hab; cases a <;> cases b <;> simp_all [vertexExtendedP]
    · simp [vertexExtendedP, hv]
  · refine ⟨?_, ?_, ?_, ?_⟩
    · intro a; cases a <;> simp [vertexExtendedP, hv, (Q.pvm ⟨v,hv⟩).sa]
    · intro a; cases a <;> simp [vertexExtendedP, hv, (Q.pvm ⟨v,hv⟩).idem]
    · intro a b hab
      cases a with
      | none => simp [vertexExtendedP, hv]
      | some a =>
        cases b with
        | none => simp [vertexExtendedP, hv]
        | some b =>
          simpa [vertexExtendedP, hv] using
            (Q.pvm ⟨v,hv⟩).orth a b (fun h => hab (congrArg some h))
    · simpa [vertexExtendedP, hv] using (Q.pvm ⟨v,hv⟩).sum_eq_one

noncomputable def extendDeletedColoring
    (Q : ProjectiveColoring (G.induce {v | v ≠ x}) C A) :
    ProjectiveColoring G (Option C) A where
  P := vertexExtendedP x Q
  pvm := vertexExtendedP_pvm x Q
  edge u v huv a := by
    classical
    have hne := G.ne_of_adj huv
    cases a with
    | none =>
      by_cases hu : u = x <;> by_cases hv : v = x <;>
        simp_all [vertexExtendedP]
    | some a =>
      by_cases hu : u = x <;> by_cases hv : v = x
      · simp [vertexExtendedP, hu]
      · simp [vertexExtendedP, hu]
      · simp [vertexExtendedP, hv]
      · simpa [vertexExtendedP, hu, hv] using Q.edge ⟨u,hu⟩ ⟨v,hv⟩ huv a

theorem quantumColorable_extend_deleted {c : ℕ}
    (h : QuantumColorable (G.induce {v | v ≠ x}) c) :
    QuantumColorable G (c+1) := by
  classical
  obtain ⟨d,hd,⟨Q⟩⟩ := h
  let e : Fin (c+1) ≃ Option (Fin c) := Fintype.equivOfCardEq (by simp)
  exact ⟨d,hd,⟨(extendDeletedColoring x Q).relabel e⟩⟩

end Hedetniemi.Round4
