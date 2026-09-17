import Hedetniemi.Round4.CertificatePSD
import Hedetniemi.Round4.CertificateWeights
import Hedetniemi.Round4.DimensionFree

namespace Hedetniemi.Round4
open scoped BigOperators ComplexOrder

theorem weightedMatrix_posSemidef : weightedMatrix.PosSemidef := by
  have hp := signed_pullback_posSemidef sourceMatrix sourceMatrixInt_posSemidef
    (fun v : Fin 788 => v) (fun v => (integerWeight v : ℝ))
  convert hp using 1
  ext u v
  dsimp [weightedMatrix]
  ring

/-- A concrete exact integer gap rules out 1184 colors in every nonzero
unital C*-algebra, with no restriction on its dimension or existence of a trace. -/
theorem smallG_no_projective_coloring {A : Type*} [CStarAlgebra A] [Nontrivial A]
    (Q : ProjectiveColoring smallG (Fin 1184) A) : False := by
  have hb := Q.variable_fiber_supported_psd_bound baseGraph fiberSize fiberSize_pos
    weightedMatrix weightedMatrix_posSemidef weightedMatrix_support
  rw [weighted_numerator, weighted_denominator] at hb
  norm_num at hb

theorem smallG_not_quantumColorable : ¬ QuantumColorable smallG 1184 := by
  rintro ⟨d, hd, ⟨Q⟩⟩
  letI := complexMatrix_nontrivial hd
  exact smallG_no_projective_coloring Q

theorem smallG_quantumChromaticNumber_lower : 1185 ≤ quantumChromaticNumber smallG := by
  have hn : ¬ quantumChromaticNumber smallG ≤ 1184 := by
    intro h
    exact smallG_not_quantumColorable ((quantumChromaticNumber_le_iff _ _).mp h)
  omega

theorem smallG_no_faithful_tracial_coloring {A : Type*} [CStarAlgebra A] [Nontrivial A]
    (τ : FaithfulTracialState A) (P : (Σ v : Fin 788, Fin (fiberSize v)) → Fin 1184 → A)
    (hP : ∀ v, PVM (P v))
    (hedge : ∀ u v, smallG.Adj u v → ∀ a, τ.τ (P u a * P v a) = 0) : False :=
  smallG_no_projective_coloring (tracialProjectiveColoring τ P hP hedge)

end Hedetniemi.Round4
