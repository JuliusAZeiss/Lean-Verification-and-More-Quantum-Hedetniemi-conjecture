import Hedetniemi.Round4.GeneralGadgetCritical

namespace Hedetniemi.Round4

variable {C I E L B : Type*} [Fintype C] [Fintype I]
  [Fintype E] [Fintype L] [Fintype B]
variable (pal : GeneralPalette C I E L B)

/-- Every endomorphism of the finite gadget is injective. Thus the gadget is
a core, in the standard finite-graph homomorphism sense. -/
theorem general_gadget_endomorphism_injective [Nonempty I]
    (f : generalGadgetGraph pal →g generalGadgetGraph pal) :
    Function.Injective f := by
  classical
  apply Finite.injective_iff_surjective.mpr
  intro x
  by_contra hx
  have hn : ∀ v, f v ≠ x := by
    intro v hv
    exact hx ⟨v, hv⟩
  obtain ⟨color⟩ := general_deleted_colorable pal x
  let pulled : (generalGadgetGraph pal).Coloring (Fin (Fintype.card C)) :=
    SimpleGraph.Coloring.mk (fun v => color ⟨f v, hn v⟩) (by
      intro v w hvw
      exact color.valid (f.map_rel hvw))
  exact general_gadget_not_quantumColorable pal
    (colorable_quantumColorable ⟨pulled⟩)

end Hedetniemi.Round4
