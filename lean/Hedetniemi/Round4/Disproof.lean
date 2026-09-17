import Hedetniemi.Round4.WeightedBounds
import Hedetniemi.Round4.SmallGadgetCritical
import Hedetniemi.Round4.CStarModel

namespace Hedetniemi.Round4

/-- All three claims refer to the fixed explicit graphs, with no unresolved
graph, matrix, or coloring hypotheses. -/
theorem unconditional_quantum_product_counterexample :
    QuantumColorable (categoricalProduct smallG smallH) 1184 ∧
      ¬ QuantumColorable smallG 1184 ∧ ¬ QuantumColorable smallH 1184 :=
  ⟨colorable_quantumColorable small_product_colorable,
    smallG_not_quantumColorable, smallH_not_quantumColorable⟩

/-- Strict failure of quantum Hedetniemi for the concrete 310317/934177-vertex pair. -/
theorem quantum_hedetniemi_counterexample :
    quantumChromaticNumber (categoricalProduct smallG smallH) <
      min (quantumChromaticNumber smallG) (quantumChromaticNumber smallH) := by
  obtain ⟨hp, hg, hh⟩ := unconditional_quantum_product_counterexample
  exact quantum_chromatic_product_strict smallG smallH 1184 hp hg hh

theorem small_product_quantumChromaticNumber_le :
    quantumChromaticNumber (categoricalProduct smallG smallH) ≤ 1184 :=
  (quantumChromaticNumber_le_iff _ _).mpr unconditional_quantum_product_counterexample.1

theorem factors_min_quantumChromaticNumber :
    min (quantumChromaticNumber smallG) (quantumChromaticNumber smallH) = 1185 := by
  rw [smallH_quantumChromaticNumber]
  exact min_eq_right smallG_quantumChromaticNumber_lower

theorem quantum_hedetniemi_equality_fails :
    quantumChromaticNumber (categoricalProduct smallG smallH) ≠
      min (quantumChromaticNumber smallG) (quantumChromaticNumber smallH) :=
  ne_of_lt quantum_hedetniemi_counterexample

/-- The same concrete pair separates product coloring from both factors even
when the algebra carrying a coloring is arbitrary and may be infinite-dimensional. -/
theorem unconditional_cstar_product_counterexample :
    CStarColorable (categoricalProduct smallG smallH) 1184 ∧
      ¬ CStarColorable smallG 1184 ∧ ¬ CStarColorable smallH 1184 := by
  refine ⟨quantumColorable_cstarColorable
    unconditional_quantum_product_counterexample.1, ?_, ?_⟩
  · rintro ⟨A, inst, hA, ⟨Q⟩⟩
    letI := inst
    letI := hA
    exact smallG_no_projective_coloring Q
  · rintro ⟨A, inst, hA, ⟨Q⟩⟩
    letI := inst
    letI := hA
    exact smallH_no_projective_coloring Q

theorem cstar_hedetniemi_counterexample :
    cstarChromaticNumber (categoricalProduct smallG smallH) <
      min (cstarChromaticNumber smallG) (cstarChromaticNumber smallH) := by
  obtain ⟨hp, hg, hh⟩ := unconditional_cstar_product_counterexample
  exact cstar_chromatic_product_strict smallG smallH 1184 hp hg hh

end Hedetniemi.Round4
