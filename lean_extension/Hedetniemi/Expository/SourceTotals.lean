import Hedetniemi.Round4.CertificatePSD
import Hedetniemi.Round4.CertificateGraph

namespace Hedetniemi.Expository
open Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

def sourceIndexEquiv : Fin 197 × Fin 4 ≃ Fin 788 := finProdFinEquiv

theorem sourceIndexEquiv_apply (i : Fin 197) (h : Fin 4) :
    sourceIndexEquiv (i,h) = blockIndex i h := by
  apply Fin.ext
  change h.val + 4*i.val = 4*i.val+h.val
  omega

theorem sourceMatrixInt_block (i j : Fin 197) (h l : Fin 4) :
    sourceMatrixInt (blockIndex i h) (blockIndex j l) =
      kernelEntryN (Nat.xor h.val l.val) i.val j.val := by
  have hi : (4*i.val+h.val)/4=i.val := by omega
  have hj : (4*j.val+l.val)/4=j.val := by omega
  have hh : (4*i.val+h.val)%4=h.val := by omega
  have hl : (4*j.val+l.val)%4=l.val := by omega
  simp only [sourceMatrixInt,blockIndex,hi,hj,hh,hl]

theorem sum_four_xor (f : ℕ → ℤ) (h : Fin 4) :
    (∑ l : Fin 4, f (Nat.xor h.val l.val)) = ∑ s : Fin 4, f s.val := by
  have hx : ∀ h l : Fin 4, Nat.xor h.val l.val =
      (![![0,1,2,3],![1,0,3,2],![2,3,0,1],![3,2,1,0]] : Fin 4 → Fin 4 → ℕ) h l := by decide
  simp_rw [hx]
  fin_cases h <;> norm_num [Fin.sum_univ_succ] <;> ring

theorem block_zero_sum (i j : Fin 197) :
    (∑ s : Fin 4, kernelEntryN s.val i.val j.val) = blockEntry 0 i j := by
  have h := concrete_block_transform 0 i j
  simpa [walshInt,kernelEntry,Fin.sum_univ_succ] using h.symm

theorem source_row_sum_block (i : Fin 197) (h : Fin 4) :
    (∑ v : Fin 788, sourceMatrixInt (blockIndex i h) v) =
      ∑ j : Fin 197, blockEntry 0 i j := by
  rw [← sourceIndexEquiv.sum_comp (fun v => sourceMatrixInt (blockIndex i h) v)]
  rw [Fintype.sum_prod_type]
  simp_rw [sourceIndexEquiv_apply,sourceMatrixInt_block]
  apply Finset.sum_congr rfl
  intro j _
  rw [sum_four_xor (fun s => kernelEntryN s i.val j.val) h]
  exact block_zero_sum i j

theorem source_entry_sum_blocks :
    (∑ u : Fin 788, ∑ v : Fin 788, sourceMatrixInt u v) =
      4 * ∑ i : Fin 197, ∑ j : Fin 197, blockEntry 0 i j := by
  rw [← sourceIndexEquiv.sum_comp (fun u => ∑ v : Fin 788, sourceMatrixInt u v)]
  rw [Fintype.sum_prod_type]
  simp_rw [sourceIndexEquiv_apply,source_row_sum_block]
  simp only [Finset.sum_const,Finset.card_univ,Fintype.card_fin,nsmul_eq_mul,Nat.cast_ofNat]
  rw [Finset.mul_sum]

theorem source_trace_blocks :
    (∑ u : Fin 788, sourceMatrixInt u u) =
      4 * ∑ i : Fin 197, kernelEntryN 0 i.val i.val := by
  rw [← sourceIndexEquiv.sum_comp (fun u => sourceMatrixInt u u)]
  rw [Fintype.sum_prod_type]
  simp_rw [sourceIndexEquiv_apply,sourceMatrixInt_block]
  have hx (h : Fin 4) : Nat.xor h.val h.val = 0 := Nat.xor_self h.val
  simp_rw [hx]
  simp only [Finset.sum_const,Finset.card_univ,Fintype.card_fin,nsmul_eq_mul,Nat.cast_ofNat]
  rw [Finset.mul_sum]

theorem source_diagonal_reduced :
    (∑ i : Fin 197, kernelEntryN 0 i.val i.val) = 100006298 := by decide +kernel

theorem source_entry_sum_reduced :
    (∑ i : Fin 197, ∑ j : Fin 197, blockEntry 0 i j) = 300625448 := by decide +kernel

theorem sourceMatrix_trace_int :
    (∑ u : Fin 788, sourceMatrixInt u u) = 400025192 := by
  rw [source_trace_blocks,source_diagonal_reduced]
  norm_num

theorem sourceMatrix_entry_sum_int :
    (∑ u : Fin 788, ∑ v : Fin 788, sourceMatrixInt u v) = 1202501792 := by
  rw [source_entry_sum_blocks,source_entry_sum_reduced]
  norm_num

theorem sourceMatrix_trace :
    (∑ u : Fin 788, sourceMatrix u u) = 400025192 := by
  have h := congrArg (fun z : ℤ => (z : ℝ)) sourceMatrix_trace_int
  simpa only [sourceMatrix,Int.cast_sum,Int.cast_ofNat] using h

theorem sourceMatrix_entry_sum :
    (∑ u : Fin 788, ∑ v : Fin 788, sourceMatrix u v) = 1202501792 := by
  have h := congrArg (fun z : ℤ => (z : ℝ)) sourceMatrix_entry_sum_int
  simpa only [sourceMatrix,Int.cast_sum,Int.cast_ofNat] using h

theorem source_uniform_gap :
    (394 : ℝ) * (∑ u : Fin 788, ∑ v : Fin 788, sourceMatrix u v) -
      1184 * (∑ u : Fin 788, sourceMatrix u u) = 155878720 := by
  rw [sourceMatrix_entry_sum,sourceMatrix_trace]
  norm_num

end Hedetniemi.Expository
