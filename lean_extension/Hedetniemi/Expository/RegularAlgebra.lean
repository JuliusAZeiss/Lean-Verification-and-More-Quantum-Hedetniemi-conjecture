import Hedetniemi.Expository.RegularIdentityDefinition

namespace Hedetniemi.Expository
open scoped BigOperators Matrix
set_option maxRecDepth 100000
set_option maxHeartbeats 0
noncomputable section

def regularGramMatrix : Matrix (Fin 1024) (Fin 1024) ℝ :=
  fun u v => (regularGramMatrixInt u v : ℝ)

private theorem xor_pair_cancel (u w v : ℕ) :
    (u ^^^ w) ^^^ (u ^^^ v) = w ^^^ v := by
  rw [Nat.xor_comm u w, Nat.xor_assoc, ← Nat.xor_assoc u u v,
    Nat.xor_self, Nat.zero_xor]

theorem regular_sos_entry
    (hcheck : ∀ x : Fin 1024, regularConvolution x.val = 4096 * regularKernel x.val)
    (u v : Fin 1024) :
    (∑ w : Fin 1024,
      (regularGramMatrixInt w u * regularGramMatrixInt w v +
      112 * (regularMatrixInt w u * regularMatrixInt w v))) =
        4096 * regularMatrixInt u v := by
  have he := (regularXorEquiv u).sum_comp (fun x : Fin 1024 =>
    regularGramKernel x.val * regularGramKernel (x.val ^^^ (u.val ^^^ v.val)) +
      112 * (regularKernel x.val * regularKernel (x.val ^^^ (u.val ^^^ v.val))))
  have hc := hcheck (regularXor u v)
  have hleft :
      (∑ w : Fin 1024,
        (regularGramMatrixInt w u * regularGramMatrixInt w v +
          112 * (regularMatrixInt w u * regularMatrixInt w v))) =
        regularConvolution (u.val ^^^ v.val) := by
    convert he using 1
    apply Finset.sum_congr rfl
    intro w _
    simp only [regularXorEquiv, regularXor, Equiv.coe_fn_mk,
      regularGramMatrixInt, regularMatrixInt, xor_pair_cancel]
    rw [Nat.xor_comm u.val w.val]
  exact hleft.trans hc

theorem regular_matrix_sos_of_convolution
    (hcheck : ∀ x : Fin 1024, regularConvolution x.val = 4096 * regularKernel x.val) :
    (4096 : ℝ) • regularMatrix =
      regularGramMatrixᴴ * regularGramMatrix +
        (112 : ℝ) • (regularMatrixᴴ * regularMatrix) := by
  ext u v
  have h := regular_sos_entry hcheck u v
  have hr :
      (∑ w : Fin 1024,
        ((regularGramMatrixInt w u : ℝ) * (regularGramMatrixInt w v : ℝ) +
          112 * ((regularMatrixInt w u : ℝ) * (regularMatrixInt w v : ℝ)))) =
        4096 * (regularMatrixInt u v : ℝ) := by
    exact_mod_cast h
  simp only [Finset.sum_add_distrib, ← Finset.mul_sum] at hr
  simpa only [Matrix.smul_apply, smul_eq_mul, Matrix.add_apply, Matrix.mul_apply,
    Matrix.conjTranspose_apply, star_trivial, regularGramMatrix, regularMatrix]
    using hr.symm

theorem real_matrix_posSemidef_smul {V : Type*} [Fintype V]
    {M : Matrix V V ℝ} (hM : M.PosSemidef) {r : ℝ} (hr : 0 ≤ r) :
    (r • M).PosSemidef := by
  refine ⟨?_, ?_⟩
  · ext u v
    have hs := congrFun (congrFun hM.1 u) v
    simpa only [Matrix.conjTranspose_apply, Matrix.smul_apply, smul_eq_mul,
      star_trivial] using congrArg (fun x : ℝ => r*x) hs
  · intro x
    have h := mul_nonneg hr (hM.2 x)
    convert h using 1
    simp only [dotProduct, Matrix.mulVec, Matrix.smul_apply, smul_eq_mul,
      Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro u _
    apply Finset.sum_congr rfl
    intro v _
    ring

theorem regularMatrix_posSemidef_of_convolution
    (hcheck : ∀ x : Fin 1024, regularConvolution x.val = 4096 * regularKernel x.val) :
    regularMatrix.PosSemidef := by
  have hR := Matrix.posSemidef_conjTranspose_mul_self regularGramMatrix
  have hT := Matrix.posSemidef_conjTranspose_mul_self regularMatrix
  have hS := hR.add (real_matrix_posSemidef_smul hT (by norm_num : (0 : ℝ) ≤ 112))
  rw [← regular_matrix_sos_of_convolution hcheck] at hS
  have h := real_matrix_posSemidef_smul hS (by norm_num : (0 : ℝ) ≤ 1/4096)
  simpa only [smul_smul, show (1/4096 : ℝ)*4096=1 by norm_num, one_smul] using h

end
end Hedetniemi.Expository
