import Hedetniemi.Round4.Disproof
import Hedetniemi.Expository.SourceTotals

namespace Hedetniemi.Expository
open Hedetniemi.Round4
open scoped BigOperators ComplexOrder
set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- The uniform 394-clique blowup of the already certified 788-vertex base. -/
def uniformG : SimpleGraph (Fin 788 × Fin 394) := cliqueBlowup baseGraph

theorem uniformG_card : Fintype.card (Fin 788 × Fin 394) = 310472 := by
  simp only [Fintype.card_prod, Fintype.card_fin]

theorem uniform_product_colorable :
    (categoricalProduct uniformG smallH).Colorable 1184 := by
  simpa only [uniformG, smallH] using
    (generalProductColoring baseGraph smallPalette baseGraph_noClosedWalkFive).colorable

/-- Restricting a coloring to the certified shorter fibers gives a contradiction. -/
theorem uniformG_no_projective_coloring_via_embedding {A : Type*} [CStarAlgebra A] [Nontrivial A]
    (Q : ProjectiveColoring uniformG (Fin 1184) A) : False := by
  apply smallG_no_projective_coloring (A := A)
  exact {
    P := fun v a => Q.P (smallGMap v) a
    pvm := fun v => Q.pvm (smallGMap v)
    edge := fun u v h a => Q.edge (smallGMap u) (smallGMap v) (smallGMap_edge h) a }

/-- The simpler main-paper proof uses the original matrix with no diagonal weights. -/
theorem uniformG_no_projective_coloring {A : Type*} [CStarAlgebra A] [Nontrivial A]
    (Q : ProjectiveColoring uniformG (Fin 1184) A) : False := by
  let N : Matrix (Fin 788 × Fin 394) (Fin 788 × Fin 394) ℝ :=
    sourceMatrix.submatrix Prod.fst Prod.fst
  have hN : N.PosSemidef := sourceMatrixInt_posSemidef.submatrix Prod.fst
  have hsupport (u v : Fin 788 × Fin 394) (hne : u ≠ v)
      (hnot : ¬ uniformG.Adj u v) : N u v = 0 := by
    have hbase : u.1 ≠ v.1 := by
      intro heq
      apply hnot
      refine Or.inr ⟨heq,?_⟩
      intro hsec
      exact hne (Prod.ext heq hsec)
    have hadj : ¬ baseGraph.Adj u.1 v.1 := fun h => hnot (Or.inl h)
    simp only [N,Matrix.submatrix_apply,sourceMatrix,
      sourceMatrixInt_support u.1 v.1 hbase hadj,Int.cast_zero]
  have hb := Q.supported_psd_bound N hN hsupport
  simp only [N,Matrix.submatrix_apply,Fintype.sum_prod_type,Finset.sum_const,
    Finset.card_univ,Fintype.card_fin,nsmul_eq_mul,Nat.cast_ofNat] at hb
  simp only [← Finset.mul_sum] at hb
  rw [sourceMatrix_entry_sum,sourceMatrix_trace] at hb
  norm_num at hb

theorem uniformG_not_quantumColorable : ¬ QuantumColorable uniformG 1184 := by
  rintro ⟨d, hd, ⟨Q⟩⟩
  letI := complexMatrix_nontrivial hd
  exact uniformG_no_projective_coloring Q

theorem uniformG_quantumChromaticNumber_lower :
    1185 ≤ quantumChromaticNumber uniformG := by
  by_contra! h
  have hle : quantumChromaticNumber uniformG ≤ 1184 := by omega
  exact uniformG_not_quantumColorable ((quantumChromaticNumber_le_iff _ _).mp hle)

theorem uniform_quantum_counterexample :
    (categoricalProduct uniformG smallH).Colorable 1184 ∧
    min (quantumChromaticNumber uniformG) (quantumChromaticNumber smallH) = 1185 := by
  refine ⟨uniform_product_colorable, ?_⟩
  rw [smallH_quantumChromaticNumber]
  exact min_eq_right uniformG_quantumChromaticNumber_lower

theorem uniform_quantum_hedetniemi_fails :
    quantumChromaticNumber (categoricalProduct uniformG smallH) <
      min (quantumChromaticNumber uniformG) (quantumChromaticNumber smallH) :=
  quantum_chromatic_product_strict uniformG smallH 1184
    (colorable_quantumColorable uniform_product_colorable)
    uniformG_not_quantumColorable smallH_not_quantumColorable

theorem uniform_cstar_counterexample :
    CStarColorable (categoricalProduct uniformG smallH) 1184 ∧
      ¬ CStarColorable uniformG 1184 ∧ ¬ CStarColorable smallH 1184 := by
  refine ⟨quantumColorable_cstarColorable
    (colorable_quantumColorable uniform_product_colorable), ?_,
    unconditional_cstar_product_counterexample.2.2⟩
  rintro ⟨A, inst, hA, ⟨Q⟩⟩
  letI := inst
  letI := hA
  exact uniformG_no_projective_coloring Q

theorem uniform_cstar_hedetniemi_fails :
    cstarChromaticNumber (categoricalProduct uniformG smallH) <
      min (cstarChromaticNumber uniformG) (cstarChromaticNumber smallH) :=
  cstar_chromatic_product_strict uniformG smallH 1184
    uniform_cstar_counterexample.1 uniform_cstar_counterexample.2.1
    uniform_cstar_counterexample.2.2

end Hedetniemi.Expository
