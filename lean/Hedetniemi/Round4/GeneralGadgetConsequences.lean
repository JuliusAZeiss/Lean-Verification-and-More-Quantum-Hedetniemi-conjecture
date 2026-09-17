import Hedetniemi.Round4.GeneralGadgetOperator
import Hedetniemi.ColorCount

namespace Hedetniemi.Round4

variable {C I E L B : Type*} [Fintype C] [Fintype I]
  [Fintype E] [Fintype L] [Fintype B]

/-- Exact quantum chromatic number, from the ordinary upper coloring and
the arbitrary-C*-algebra obstruction. -/
theorem general_gadget_quantumChromaticNumber (pal : GeneralPalette C I E L B) :
    quantumChromaticNumber (generalGadgetGraph pal) = Fintype.card C + 1 := by
  classical
  have hup := (quantumChromaticNumber_le_iff (generalGadgetGraph pal)
    (Fintype.card C + 1)).mpr
    (colorable_quantumColorable (general_gadget_colorable pal))
  have hnot : ¬ quantumChromaticNumber (generalGadgetGraph pal) ≤ Fintype.card C := by
    intro h
    exact general_gadget_not_quantumColorable pal
      ((quantumChromaticNumber_le_iff _ _).mp h)
  omega

/-- The literal final second-factor vertex type has 934177 vertices. -/
theorem finalGadgetVertex_card :
    Fintype.card (GeneralGadgetVertex (Fin 1184) (Fin 788) (Fin 394) (Fin 395)) =
      934177 := by
  rw [generalGadgetVertex_card]
  norm_num

end Hedetniemi.Round4
