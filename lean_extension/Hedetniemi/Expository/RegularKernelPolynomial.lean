import Hedetniemi.Expository.RegularAlgebra

namespace Hedetniemi.Expository
open Hedetniemi.Round4
open scoped BigOperators Matrix
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem regularStep_lt : ∀ i : Fin 22, step i < 1024 := by decide +kernel

def regularStep (i : Fin 22) : Fin 1024 := ⟨step i, regularStep_lt i⟩

theorem regularKernel_decompose : ∀ x : Fin 1024,
    regularKernel x.val = (if x = 0 then 10 else 0) +
      ∑ i : Fin 22, (if x = regularStep i then 1 else 0) := by
  decide +kernel

theorem regularGramKernel_shift_sum : ∀ x : Fin 1024,
    regularGramKernel x.val =
      (∑ i : Fin 22, regularKernel ((regularStep i).val ^^^ x.val)) -
        18 * regularKernel x.val := by
  decide +kernel

theorem regular_kernel_square (x : Fin 1024) :
    (∑ w : Fin 1024, regularKernel w.val * regularKernel (w.val ^^^ x.val)) =
      regularGramKernel x.val + 28 * regularKernel x.val := by
  have hsum :
      (∑ w : Fin 1024, regularKernel w.val * regularKernel (w.val ^^^ x.val)) =
        10 * regularKernel x.val +
          ∑ i : Fin 22, regularKernel ((regularStep i).val ^^^ x.val) := by
    calc
      _ = ∑ w : Fin 1024,
          (((if w = 0 then 10 else 0) +
            ∑ i : Fin 22, (if w = regularStep i then 1 else 0)) *
              regularKernel (w.val ^^^ x.val)) := by
        apply Finset.sum_congr rfl
        intro w _
        rw [← regularKernel_decompose w]
      _ = _ := by
        simp only [add_mul, Finset.sum_add_distrib, Finset.sum_mul]
        rw [Finset.sum_comm]
        simp [ite_mul]
  rw [hsum, regularGramKernel_shift_sum x]
  ring

private theorem xor_pair_cancel (u w v : ℕ) :
    (u ^^^ w) ^^^ (u ^^^ v) = w ^^^ v := by
  rw [Nat.xor_comm u w, Nat.xor_assoc, ← Nat.xor_assoc u u v,
    Nat.xor_self, Nat.zero_xor]

theorem regular_matrix_square_entry (u v : Fin 1024) :
    (∑ w : Fin 1024, regularMatrixInt u w * regularMatrixInt w v) =
      regularGramMatrixInt u v + 28 * regularMatrixInt u v := by
  have he := (regularXorEquiv u).sum_comp (fun x : Fin 1024 =>
    regularKernel x.val * regularKernel (x.val ^^^ (u.val ^^^ v.val)))
  have hleft :
      (∑ w : Fin 1024, regularMatrixInt u w * regularMatrixInt w v) =
        ∑ x : Fin 1024,
          regularKernel x.val * regularKernel (x.val ^^^ (u.val ^^^ v.val)) := by
    convert he using 1
    apply Finset.sum_congr rfl
    intro w _
    simp only [regularXorEquiv,regularXor,Equiv.coe_fn_mk,
      regularMatrixInt,xor_pair_cancel]
  exact hleft.trans (regular_kernel_square (regularXor u v))

theorem regularGramMatrix_polynomial :
    regularGramMatrix = regularMatrix * regularMatrix - (28 : ℝ) • regularMatrix := by
  ext u v
  have h := regular_matrix_square_entry u v
  have hr :
      (∑ w : Fin 1024, (regularMatrixInt u w : ℝ) * (regularMatrixInt w v : ℝ)) =
        (regularGramMatrixInt u v : ℝ) + 28 * (regularMatrixInt u v : ℝ) := by
    exact_mod_cast h
  simp only [regularGramMatrix,regularMatrix,Matrix.sub_apply,Matrix.mul_apply,
    Matrix.smul_apply,smul_eq_mul]
  linarith

theorem regularMatrix_eq_adjacency_add :
    regularMatrix = regularBase.adjMatrix ℝ + (10 : ℝ) • (1 : Matrix _ _ ℝ) := by
  ext u v
  simp only [regularMatrix,regularMatrixInt,regularKernel,Matrix.add_apply,
    Matrix.smul_apply,smul_eq_mul,Matrix.one_apply,SimpleGraph.adjMatrix_apply]
  by_cases huv : u = v
  · subst v
    simp [regularBase.loopless]
  · have hx : u.val ^^^ v.val ≠ 0 := by
      intro h
      exact huv (Fin.ext (Nat.xor_eq_zero.mp h))
    have hs := regularStepBool_iff (regularXor u v)
    change (regularStepBool (u.val ^^^ v.val) = true ↔ regularBase.Adj u v) at hs
    by_cases he : regularBase.Adj u v
    · simp [hx,huv,he,hs.mpr he]
    · have hn : regularStepBool (u.val ^^^ v.val) ≠ true := fun h => he (hs.mp h)
      simp [hx,huv,he,hn]

theorem regularGramMatrix_adjacency_polynomial :
    regularGramMatrix =
      regularBase.adjMatrix ℝ * regularBase.adjMatrix ℝ -
        (8 : ℝ) • regularBase.adjMatrix ℝ -
          (180 : ℝ) • (1 : Matrix (Fin 1024) (Fin 1024) ℝ) := by
  rw [regularGramMatrix_polynomial, regularMatrix_eq_adjacency_add]
  simp only [add_mul,mul_add,Matrix.smul_mul,Matrix.mul_smul,
    one_mul,mul_one,smul_smul]
  module

end Hedetniemi.Expository
