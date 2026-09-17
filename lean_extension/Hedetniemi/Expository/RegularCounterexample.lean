import Hedetniemi.Expository.RegularPSD
import Hedetniemi.Round4.ProductColoring
import Hedetniemi.Round4.GeneralGadgetConsequences
import Hedetniemi.Round4.CStarModel

namespace Hedetniemi.Expository
open Hedetniemi.Round4
open scoped BigOperators ComplexOrder
set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- Replace the center label by the single spare anchor 1024. -/
def regularReplaceCenter (i r : Fin 1024) : Fin 1538 :=
  ⟨if r = i then 1024 else r.val, by split <;> omega⟩

theorem regularReplaceCenter_injective (i : Fin 1024) : Function.Injective (regularReplaceCenter i) := by
  intro r s h
  have hv := congrArg Fin.val h
  simp only [regularReplaceCenter] at hv
  by_cases hr : r = i <;> by_cases hs : s = i
  · exact hr.trans hs.symm
  · simp only [if_pos hr,if_neg hs] at hv
    omega
  · simp only [if_neg hr,if_pos hs] at hv
    omega
  · apply Fin.ext
    simpa only [if_neg hr,if_neg hs] using hv

def regularPalette : GeneralPalette (Fin 1538) (Fin 1024) (Fin 512) (Fin 512) (Fin 513) where
  center := ⟨fun i => ⟨i.val,by omega⟩, by
    intro i j h
    exact Fin.ext (congrArg (fun x : Fin 1538 => x.val) h)⟩
  residual := fun i => ⟨fun r => regularReplaceCenter i (finSumFinEquiv r),
    fun _ _ h => finSumFinEquiv.injective (regularReplaceCenter_injective i h)⟩
  privateLabel := fun _ => ⟨fun b => ⟨1025+b.val,by omega⟩, by
    intro b d h
    apply Fin.ext
    have := congrArg Fin.val h
    change 1025+b.val=1025+d.val at this
    omega⟩
  residual_ne_center := by
    intro i r h
    have hv := congrArg Fin.val h
    change (if finSumFinEquiv r = i then 1024 else (finSumFinEquiv r).val) = i.val at hv
    by_cases hr : finSumFinEquiv r = i
    · simp only [if_pos hr] at hv
      omega
    · simp only [if_neg hr] at hv
      exact hr (Fin.ext hv)
  private_ne_center := by
    intro i b j h
    have hv := congrArg Fin.val h
    change 1025+b.val=j.val at hv
    omega
  residual_ne_private := by
    intro i r b h
    have hv := congrArg Fin.val h
    change (if finSumFinEquiv r = i then 1024 else (finSumFinEquiv r).val) = 1025+b.val at hv
    have hr := (finSumFinEquiv r).isLt
    split_ifs at hv <;> omega
  private_card := by simp

abbrev RegularHVertex := GeneralGadgetVertex (Fin 1538) (Fin 1024) (Fin 512) (Fin 513)
def regularH : SimpleGraph RegularHVertex := generalGadgetGraph regularPalette

theorem regularH_card : Fintype.card RegularHVertex = 1576451 := by
  rw [generalGadgetVertex_card]
  norm_num

theorem regularH_colorable : regularH.Colorable 1539 := by
  simpa [regularH] using general_gadget_colorable regularPalette

def regularG : SimpleGraph (Fin 1024 × Fin 512) := cliqueBlowup regularBase

theorem regularG_card : Fintype.card (Fin 1024 × Fin 512) = 524288 := by
  simp only [Fintype.card_prod,Fintype.card_fin]

theorem regular_product_colorable :
    (categoricalProduct regularG regularH).Colorable 1538 := by
  simpa only [regularG,regularH] using
    (generalProductColoring regularBase regularPalette regularBase_noClosedWalkFive).colorable

theorem regularG_projective_bound {C A : Type*} [Fintype C]
    [CStarAlgebra A] [Nontrivial A] (Q : ProjectiveColoring regularG C A) :
    (8192 : ℝ) ≤ 5 * Fintype.card C := by
  let N : Matrix (Fin 1024 × Fin 512) (Fin 1024 × Fin 512) ℝ :=
    regularMatrix.submatrix Prod.fst Prod.fst
  have hN : N.PosSemidef := regularMatrix_posSemidef.submatrix Prod.fst
  have hsupport (u v : Fin 1024 × Fin 512) (hne : u ≠ v)
      (hnot : ¬ regularG.Adj u v) : N u v = 0 := by
    have hbase : u.1 ≠ v.1 := by
      intro heq
      apply hnot
      refine Or.inr ⟨heq,?_⟩
      intro hsec
      exact hne (Prod.ext heq hsec)
    have hadj : ¬ regularBase.Adj u.1 v.1 := fun h => hnot (Or.inl h)
    simp only [N,Matrix.submatrix_apply,regularMatrix,
      regularMatrixInt_support u.1 v.1 hbase hadj,Int.cast_zero]
  have hb := Q.supported_psd_bound N hN hsupport
  simp only [N,Matrix.submatrix_apply,Fintype.sum_prod_type,Finset.sum_const,
    Finset.card_univ,Fintype.card_fin,nsmul_eq_mul,Nat.cast_ofNat] at hb
  simp only [← Finset.mul_sum] at hb
  rw [regularMatrix_entry_sum,regularMatrix_trace] at hb
  nlinarith

theorem regularG_no_projective_coloring {A : Type*} [CStarAlgebra A] [Nontrivial A]
    (Q : ProjectiveColoring regularG (Fin 1538) A) : False := by
  have h := regularG_projective_bound Q
  norm_num at h

theorem regularH_no_projective_coloring {A : Type*} [CStarAlgebra A] [Nontrivial A]
    (Q : ProjectiveColoring regularH (Fin 1538) A) : False :=
  general_gadget_no_projective_coloring regularPalette Q

theorem regularG_quantum_bound {c : ℕ} (h : QuantumColorable regularG c) :
    (8192 : ℝ) ≤ 5 * c := by
  rcases h with ⟨d,hd,⟨Q⟩⟩
  letI := complexMatrix_nontrivial hd
  simpa only [Fintype.card_fin] using regularG_projective_bound Q

theorem regularG_not_quantumColorable : ¬ QuantumColorable regularG 1538 := by
  intro h
  have hb := regularG_quantum_bound h
  norm_num at hb

theorem regularG_quantumChromaticNumber_lower :
    1639 ≤ quantumChromaticNumber regularG := by
  have h := regularG_quantum_bound
    ((quantumChromaticNumber_le_iff regularG _).mp le_rfl)
  have hg : (1638 : ℝ) < quantumChromaticNumber regularG := by linarith
  exact_mod_cast hg

theorem regularH_not_quantumColorable : ¬ QuantumColorable regularH 1538 := by
  simpa only [regularH,Fintype.card_fin] using
    general_gadget_not_quantumColorable regularPalette

theorem regularH_quantumChromaticNumber : quantumChromaticNumber regularH = 1539 := by
  simpa only [regularH,Fintype.card_fin] using
    general_gadget_quantumChromaticNumber regularPalette

theorem regular_quantum_counterexample :
    (categoricalProduct regularG regularH).Colorable 1538 ∧
      min (quantumChromaticNumber regularG) (quantumChromaticNumber regularH) = 1539 := by
  refine ⟨regular_product_colorable,?_⟩
  rw [regularH_quantumChromaticNumber]
  exact min_eq_right (by have h := regularG_quantumChromaticNumber_lower; omega)

theorem regular_quantum_hedetniemi_fails :
    quantumChromaticNumber (categoricalProduct regularG regularH) <
      min (quantumChromaticNumber regularG) (quantumChromaticNumber regularH) :=
  quantum_chromatic_product_strict regularG regularH 1538
    (colorable_quantumColorable regular_product_colorable)
    regularG_not_quantumColorable regularH_not_quantumColorable

theorem regular_cstar_counterexample :
    CStarColorable (categoricalProduct regularG regularH) 1538 ∧
      ¬ CStarColorable regularG 1538 ∧ ¬ CStarColorable regularH 1538 := by
  refine ⟨quantumColorable_cstarColorable
    (colorable_quantumColorable regular_product_colorable),?_,?_⟩
  · rintro ⟨A,inst,hA,⟨Q⟩⟩
    letI := inst
    letI := hA
    exact regularG_no_projective_coloring Q
  · rintro ⟨A,inst,hA,⟨Q⟩⟩
    letI := inst
    letI := hA
    exact regularH_no_projective_coloring Q

theorem regular_cstar_hedetniemi_fails :
    cstarChromaticNumber (categoricalProduct regularG regularH) <
      min (cstarChromaticNumber regularG) (cstarChromaticNumber regularH) :=
  cstar_chromatic_product_strict regularG regularH 1538
    regular_cstar_counterexample.1 regular_cstar_counterexample.2.1
    regular_cstar_counterexample.2.2

end Hedetniemi.Expository
