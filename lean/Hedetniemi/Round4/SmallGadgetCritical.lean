import Hedetniemi.Round4.GeneralGadgetCore
import Hedetniemi.Round4.DimensionFree

namespace Hedetniemi.Round4

/-- An explicit ordinary 1184-coloring exists after deleting any vertex of
the concrete second factor. -/
theorem smallH_deleted_colorable (v : SmallHVertex) :
    (smallH.induce {w | w ≠ v}).Colorable 1184 := by
  simpa only [smallH, deletedGadget, Fintype.card_fin] using
    general_deleted_colorable smallPalette v

/-- The concrete second factor is quantum vertex-critical: its quantum
chromatic number is 1185 and every vertex deletion has quantum chromatic
number exactly 1184. -/
theorem smallH_vertex_critical :
    quantumChromaticNumber smallH = 1185 ∧
    ∀ v : SmallHVertex, quantumChromaticNumber (smallH.induce {w | w ≠ v}) = 1184 := by
  constructor
  · exact smallH_quantumChromaticNumber
  · intro v
    simpa only [smallH, deletedGadget, Fintype.card_fin] using
      general_deleted_quantumChromaticNumber smallPalette v

/-- Every graph endomorphism of the concrete second factor is injective;
this is the finite-graph core property. -/
theorem smallH_endomorphism_injective (f : smallH →g smallH) :
    Function.Injective f :=
  general_gadget_endomorphism_injective smallPalette f

end Hedetniemi.Round4
