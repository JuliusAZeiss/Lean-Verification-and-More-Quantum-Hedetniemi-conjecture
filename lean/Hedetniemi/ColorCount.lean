import Hedetniemi.ModelBridge

namespace Hedetniemi
open scoped BigOperators ComplexOrder
noncomputable section

variable {C D A : Type*} [Fintype C] [Fintype D] [CStarAlgebra A]

/-- Insert zero projections in the unused color labels. -/
def extendMeasurement (P : C → A) (e : C ↪ D) (d : D) : A := by
  classical
  exact ∑ a : C, if e a = d then P a else 0

omit [Fintype D] in
theorem extendMeasurement_apply (P : C → A) (e : C ↪ D) (a : C) :
    extendMeasurement P e (e a) = P a := by
  classical
  simp [extendMeasurement, e.injective.eq_iff]

omit [Fintype D] in
theorem extendMeasurement_zero (P : C → A) (e : C ↪ D) (d : D)
    (hd : ¬ ∃ a, e a = d) : extendMeasurement P e d = 0 := by
  classical
  simp [extendMeasurement, show ∀ a, e a ≠ d by simpa using hd]

theorem extendMeasurement_pvm (P : C → A) (hP : PVM P) (e : C ↪ D) :
    PVM (extendMeasurement P e) := by
  classical
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro d
    by_cases h : ∃ a, e a = d
    · obtain ⟨a, rfl⟩ := h
      rw [extendMeasurement_apply]
      exact hP.sa a
    · rw [extendMeasurement_zero P e d h, star_zero]
  · intro d
    by_cases h : ∃ a, e a = d
    · obtain ⟨a, rfl⟩ := h
      rw [extendMeasurement_apply]
      exact hP.idem a
    · rw [extendMeasurement_zero P e d h, zero_mul]
  · intro d d' hdd
    by_cases h : ∃ a, e a = d
    · obtain ⟨a, rfl⟩ := h
      by_cases h' : ∃ b, e b = d'
      · obtain ⟨b, rfl⟩ := h'
        rw [extendMeasurement_apply, extendMeasurement_apply]
        exact hP.orth a b (fun heq => hdd (congrArg e heq))
      · rw [extendMeasurement_zero P e d' h', mul_zero]
    · rw [extendMeasurement_zero P e d h, zero_mul]
  · dsimp [extendMeasurement]
    rw [Finset.sum_comm]
    simpa using hP.sum_eq_one

def ProjectiveColoring.extendColors {V : Type*} {G : SimpleGraph V}
    (Q : ProjectiveColoring G C A) (e : C ↪ D) : ProjectiveColoring G D A where
  P v := extendMeasurement (Q.P v) e
  pvm v := extendMeasurement_pvm (Q.P v) (Q.pvm v) e
  edge u v huv d := by
    classical
    by_cases h : ∃ a, e a = d
    · obtain ⟨a, rfl⟩ := h
      rw [extendMeasurement_apply, extendMeasurement_apply]
      exact Q.edge u v huv a
    · rw [extendMeasurement_zero (Q.P u) e d h, zero_mul]

theorem quantumColorable_mono {V : Type*} {G : SimpleGraph V} {c d : ℕ}
    (hcd : c ≤ d) (h : QuantumColorable G c) : QuantumColorable G d := by
  rcases h with ⟨k, hk, ⟨Q⟩⟩
  exact ⟨k, hk, ⟨Q.extendColors (Fin.castLEEmb hcd)⟩⟩

theorem exists_quantumColorable {V : Type*} [Fintype V] (G : SimpleGraph V) :
    ∃ c : ℕ, QuantumColorable G c := by
  have hc : G.Colorable (Fintype.card V) :=
    (SimpleGraph.Coloring.mk (fun v : V => v) (fun h => G.ne_of_adj h)).colorable
  exact ⟨Fintype.card V, colorable_quantumColorable hc⟩

/-- The least number of outputs admitting an actual finite-dimensional quantum coloring. -/
def quantumChromaticNumber {V : Type*} [Fintype V] (G : SimpleGraph V) : ℕ := by
  classical
  exact Nat.find (exists_quantumColorable G)

theorem quantumChromaticNumber_le_iff {V : Type*} [Fintype V]
    (G : SimpleGraph V) (c : ℕ) :
    quantumChromaticNumber G ≤ c ↔ QuantumColorable G c := by
  classical
  constructor
  · intro h
    exact quantumColorable_mono h (Nat.find_spec (exists_quantumColorable G))
  · intro h
    exact Nat.find_min' (exists_quantumColorable G) h

/-- The threshold counterexample entails the exact strict inequality in the conjecture. -/
theorem quantum_chromatic_product_strict {V W : Type*} [Fintype V] [Fintype W]
    (G : SimpleGraph V) (H : SimpleGraph W) (c : ℕ)
    (hprod : QuantumColorable (categoricalProduct G H) c)
    (hG : ¬ QuantumColorable G c) (hH : ¬ QuantumColorable H c) :
    quantumChromaticNumber (categoricalProduct G H) <
      min (quantumChromaticNumber G) (quantumChromaticNumber H) := by
  have hp := (quantumChromaticNumber_le_iff (categoricalProduct G H) c).mpr hprod
  have hg : c < quantumChromaticNumber G := by
    by_contra! h
    exact hG ((quantumChromaticNumber_le_iff G c).mp h)
  have hh : c < quantumChromaticNumber H := by
    by_contra! h
    exact hH ((quantumChromaticNumber_le_iff H c).mp h)
  exact lt_min (hp.trans_lt hg) (hp.trans_lt hh)

end
end Hedetniemi
