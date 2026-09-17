import Hedetniemi.Round4.ProductColoring
import Hedetniemi.Round4.GeneralGadgetConsequences
import Hedetniemi.Round4.OperatorModels

namespace Hedetniemi.Round4

/-- The concrete second factor has no projection coloring even in an arbitrary
nonzero unital C*-algebra. In particular, no dimension cutoff is used. -/
theorem smallH_no_projective_coloring {A : Type*} [CStarAlgebra A] [Nontrivial A]
    (Q : ProjectiveColoring smallH (Fin 1184) A) : False :=
  general_gadget_no_projective_coloring smallPalette Q

theorem smallH_not_quantumColorable : ¬ QuantumColorable smallH 1184 := by
  simpa only [smallH, Fintype.card_fin] using
    general_gadget_not_quantumColorable smallPalette

theorem smallH_quantumChromaticNumber : quantumChromaticNumber smallH = 1185 := by
  simpa only [smallH, Fintype.card_fin] using
    general_gadget_quantumChromaticNumber smallPalette

/-- This endpoint is explicitly the faithful tracial projection formulation.
No equivalence with an independently defined Alice/Bob game is assumed here. -/
theorem smallH_no_faithful_tracial_coloring {A : Type*} [CStarAlgebra A] [Nontrivial A]
    (τ : FaithfulTracialState A) (P : SmallHVertex → Fin 1184 → A)
    (hP : ∀ v, PVM (P v))
    (hedge : ∀ u v, smallH.Adj u v → ∀ a, τ.τ (P u a * P v a) = 0) : False :=
  smallH_no_projective_coloring (tracialProjectiveColoring τ P hP hedge)

end Hedetniemi.Round4
