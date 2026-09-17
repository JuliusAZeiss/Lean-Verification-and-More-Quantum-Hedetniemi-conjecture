import Hedetniemi.Expository.RegularKernelPolynomial

namespace Hedetniemi.Expository
open scoped BigOperators Matrix
set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- A sparse cubic identity, checked using only 22 summands at each of 1024 inputs. -/
theorem regular_sparse_kernel_identity : ∀ x : Fin 1024,
    (∑ i : Fin 22, regularGramKernel ((regularStep i).val ^^^ x.val)) +
      14 * regularGramKernel x.val + 240 * regularKernel x.val = 12 := by
  decide +kernel

theorem regular_kernel_mul_gram (x : Fin 1024) :
    (∑ w : Fin 1024, regularKernel w.val * regularGramKernel (w.val ^^^ x.val)) +
      4 * regularGramKernel x.val + 240 * regularKernel x.val = 12 := by
  have hsum :
      (∑ w : Fin 1024, regularKernel w.val * regularGramKernel (w.val ^^^ x.val)) =
        10 * regularGramKernel x.val +
          ∑ i : Fin 22, regularGramKernel ((regularStep i).val ^^^ x.val) := by
    calc
      _ = ∑ w : Fin 1024,
          (((if w = 0 then 10 else 0) +
            ∑ i : Fin 22, (if w = regularStep i then 1 else 0)) *
              regularGramKernel (w.val ^^^ x.val)) := by
        apply Finset.sum_congr rfl
        intro w _
        rw [← regularKernel_decompose w]
      _ = _ := by
        simp only [add_mul, Finset.sum_add_distrib, Finset.sum_mul]
        rw [Finset.sum_comm]
        simp [ite_mul]
  rw [hsum]
  linarith [regular_sparse_kernel_identity x]

private theorem xor_pair_cancel (u w v : ℕ) :
    (u ^^^ w) ^^^ (u ^^^ v) = w ^^^ v := by
  rw [Nat.xor_comm u w, Nat.xor_assoc, ← Nat.xor_assoc u u v,
    Nat.xor_self, Nat.zero_xor]

theorem regular_sparse_entry (u v : Fin 1024) :
    (∑ w : Fin 1024, regularMatrixInt u w * regularGramMatrixInt w v) +
      4 * regularGramMatrixInt u v + 240 * regularMatrixInt u v = 12 := by
  have he := (regularXorEquiv u).sum_comp (fun x : Fin 1024 =>
    regularKernel x.val * regularGramKernel (x.val ^^^ (u.val ^^^ v.val)))
  have hleft :
      (∑ w : Fin 1024, regularMatrixInt u w * regularGramMatrixInt w v) =
        ∑ x : Fin 1024,
          regularKernel x.val * regularGramKernel (x.val ^^^ (u.val ^^^ v.val)) := by
    convert he using 1
    apply Finset.sum_congr rfl
    intro w _
    simp only [regularXorEquiv,regularXor,Equiv.coe_fn_mk,
      regularMatrixInt,regularGramMatrixInt,xor_pair_cancel]
  rw [hleft]
  exact regular_kernel_mul_gram (regularXor u v)

def regularOnes : Matrix (Fin 1024) (Fin 1024) ℝ := fun _ _ => 1

theorem regular_sparse_matrix_identity :
    regularMatrix * regularGramMatrix + (4 : ℝ) • regularGramMatrix +
      (240 : ℝ) • regularMatrix = (12 : ℝ) • regularOnes := by
  ext u v
  have h := regular_sparse_entry u v
  have hr :
      (∑ w : Fin 1024, (regularMatrixInt u w : ℝ) * (regularGramMatrixInt w v : ℝ)) +
        4 * (regularGramMatrixInt u v : ℝ) + 240 * (regularMatrixInt u v : ℝ) = 12 := by
    exact_mod_cast h
  simpa only [regularMatrix,regularGramMatrix,regularOnes,Matrix.mul_apply,
    Matrix.add_apply,Matrix.smul_apply,smul_eq_mul,mul_one] using hr

theorem regularMatrix_mul_ones :
    regularMatrix * regularOnes = (32 : ℝ) • regularOnes := by
  ext u v
  simpa only [Matrix.mul_apply,regularOnes,mul_one,Matrix.smul_apply,
    smul_eq_mul] using regularMatrix_row_sum u

theorem regularMatrix_hermitian : regularMatrixᴴ = regularMatrix := by
  ext u v
  simp only [Matrix.conjTranspose_apply,star_trivial,regularMatrix,
    regularMatrixInt,Nat.xor_comm]

theorem regularGramMatrix_hermitian : regularGramMatrixᴴ = regularGramMatrix := by
  ext u v
  simp only [Matrix.conjTranspose_apply,star_trivial,regularGramMatrix,
    regularGramMatrixInt,Nat.xor_comm]

theorem regularMatrix_sos_sparse :
    (4096 : ℝ) • regularMatrix =
      regularGramMatrixᴴ * regularGramMatrix +
        (112 : ℝ) • (regularMatrixᴴ * regularMatrix) := by
  have hzero :
      (regularMatrix - (32 : ℝ) • (1 : Matrix (Fin 1024) (Fin 1024) ℝ)) *
        (regularMatrix * regularGramMatrix + (4 : ℝ) • regularGramMatrix +
          (240 : ℝ) • regularMatrix) = 0 := by
    rw [regular_sparse_matrix_identity]
    simp only [Matrix.mul_smul,sub_mul,Matrix.smul_mul,one_mul,regularMatrix_mul_ones,
      sub_self,smul_zero]
  rw [regularMatrix_hermitian,regularGramMatrix_hermitian]
  simp only [regularGramMatrix_polynomial,add_mul,mul_add,sub_mul,mul_sub,
    Matrix.mul_smul,Matrix.smul_mul,smul_smul,mul_assoc,mul_one,one_mul] at hzero ⊢
  linear_combination (norm := module) -hzero

end Hedetniemi.Expository
