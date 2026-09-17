import Hedetniemi.ColorCount

namespace Hedetniemi.Round4
open scoped ComplexOrder

/-- Existence of a coloring in any nonzero unital C*-algebra. The algebra is
arbitrary; no matrix dimension, trace, or finite-dimensionality is required. -/
def CStarColorable {V : Type*} (G : SimpleGraph V) (c : ℕ) : Prop :=
  ∃ (A : Type) (inst : CStarAlgebra A),
    letI := inst
    Nontrivial A ∧ Nonempty (ProjectiveColoring G (Fin c) A)

theorem quantumColorable_cstarColorable {V : Type*} {G : SimpleGraph V} {c : ℕ}
    (h : QuantumColorable G c) : CStarColorable G c := by
  rcases h with ⟨d, hd, hQ⟩
  exact ⟨CStarMatrix (Fin d) (Fin d) ℂ, inferInstance,
    complexMatrix_nontrivial hd, hQ⟩

theorem cstarColorable_mono {V : Type*} {G : SimpleGraph V} {c d : ℕ}
    (hcd : c ≤ d) (h : CStarColorable G c) : CStarColorable G d := by
  rcases h with ⟨A, inst, hA, ⟨Q⟩⟩
  letI := inst
  exact ⟨A, inst, hA, ⟨Q.extendColors (Fin.castLEEmb hcd)⟩⟩

theorem exists_cstarColorable {V : Type*} [Fintype V] (G : SimpleGraph V) :
    ∃ c : ℕ, CStarColorable G c := by
  obtain ⟨c, hc⟩ := exists_quantumColorable G
  exact ⟨c, quantumColorable_cstarColorable hc⟩

/-- The chromatic parameter for arbitrary nonzero unital C*-algebra colorings. -/
noncomputable def cstarChromaticNumber {V : Type*} [Fintype V] (G : SimpleGraph V) : ℕ := by
  classical
  exact Nat.find (exists_cstarColorable G)

theorem cstarChromaticNumber_le_iff {V : Type*} [Fintype V]
    (G : SimpleGraph V) (c : ℕ) : cstarChromaticNumber G ≤ c ↔ CStarColorable G c := by
  classical
  constructor
  · intro h
    exact cstarColorable_mono h (Nat.find_spec (exists_cstarColorable G))
  · intro h
    exact Nat.find_min' (exists_cstarColorable G) h

theorem cstar_chromatic_product_strict {V W : Type*} [Fintype V] [Fintype W]
    (G : SimpleGraph V) (H : SimpleGraph W) (c : ℕ)
    (hprod : CStarColorable (categoricalProduct G H) c)
    (hG : ¬ CStarColorable G c) (hH : ¬ CStarColorable H c) :
    cstarChromaticNumber (categoricalProduct G H) <
      min (cstarChromaticNumber G) (cstarChromaticNumber H) := by
  have hp := (cstarChromaticNumber_le_iff (categoricalProduct G H) c).mpr hprod
  have hg : c < cstarChromaticNumber G := by
    by_contra! h
    exact hG ((cstarChromaticNumber_le_iff G c).mp h)
  have hh : c < cstarChromaticNumber H := by
    by_contra! h
    exact hH ((cstarChromaticNumber_le_iff H c).mp h)
  exact lt_min (hp.trans_lt hg) (hp.trans_lt hh)

end Hedetniemi.Round4
