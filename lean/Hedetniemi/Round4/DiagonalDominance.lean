import Mathlib

namespace Hedetniemi.Round4
open scoped BigOperators Matrix
noncomputable section

private theorem signed_pair_bound (a x y : ℝ) :
    -(abs a * (x^2 + y^2)) ≤ 2 * (a*x*y) := by
  by_cases h : 0 ≤ a
  · rw [abs_of_nonneg h]
    nlinarith [mul_nonneg h (sq_nonneg (x+y))]
  · have h' : a < 0 := lt_of_not_ge h
    rw [abs_of_neg h']
    nlinarith [mul_nonneg (neg_nonneg.mpr h'.le) (sq_nonneg (x-y))]

/-- Symmetric real diagonal dominance with nonnegative residual diagonal is PSD. -/
theorem diagonally_dominant_posSemidef {I : Type*} [Fintype I] [DecidableEq I]
    (M : Matrix I I ℝ) (hsym : ∀ i j, M i j = M j i)
    (hdom : ∀ i, (∑ j : I, if i=j then 0 else |M i j|) ≤ M i i) :
    M.PosSemidef := by
  classical
  refine ⟨?_, ?_⟩
  · ext i j
    simpa only [Matrix.conjTranspose_apply, star_trivial] using hsym j i
  · intro x
    let A : I → I → ℝ := fun i j => if i=j then 0 else M i j
    have ha (i j : I) : A i j = A j i := by
      dsimp [A]
      by_cases h : i=j
      · subst j; simp
      · simp only [h, Ne.symm h, if_false, hsym i j]
    have habs (i j : I) : |A i j| = if i=j then 0 else |M i j| := by
      dsimp [A]
      split_ifs <;> simp
    have hd : 0 ≤ ∑ i : I, (M i i - ∑ j : I, |A i j|) * (x i)^2 := by
      apply Finset.sum_nonneg
      intro i _
      apply mul_nonneg _ (sq_nonneg _)
      apply sub_nonneg.mpr
      simpa only [habs] using hdom i
    have hp := Finset.sum_le_sum (s := Finset.univ) (fun i _ =>
      Finset.sum_le_sum (s := Finset.univ) (fun j _ =>
        signed_pair_bound (A i j) (x i) (x j)))
    have hswap : (∑ i : I, ∑ j : I, |A i j| * (x j)^2) =
        ∑ i : I, ∑ j : I, |A i j| * (x i)^2 := by
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro i _
      apply Finset.sum_congr rfl
      intro j _
      rw [ha j i]
    have hpair : -(2 * ∑ i : I, (∑ j : I, |A i j|) * (x i)^2) ≤
        2 * ∑ i : I, ∑ j : I, A i j * x i * x j := by
      simpa only [mul_add, Finset.sum_neg_distrib, Finset.sum_add_distrib,
        ← Finset.mul_sum, hswap, ← Finset.sum_mul, ← two_mul] using hp
    have hdecomp : dotProduct (star x) (M *ᵥ x) =
        (∑ i : I, M i i * (x i)^2) +
          ∑ i : I, ∑ j : I, A i j * x i * x j := by
      simp only [dotProduct, Matrix.mulVec, star_trivial, Finset.mul_sum,
        ← Finset.sum_add_distrib]
      apply Finset.sum_congr rfl
      intro i _
      have hs : (∑ j : I, x i * (M i j * x j)) =
          ∑ j : I, ((if i=j then M i i * (x i)^2 else 0) + A i j*x i*x j) := by
        apply Finset.sum_congr rfl
        intro j _
        dsimp [A]
        by_cases hij : i=j
        · subst j; simp; ring
        · simp only [hij, if_false, zero_add]; ring
      rw [hs, Finset.sum_add_distrib]
      simp
    have hd' : 0 ≤ (∑ i : I, M i i * (x i)^2) -
        ∑ i : I, (∑ j : I, |A i j|) * (x i)^2 := by
      simpa only [sub_mul, Finset.sum_sub_distrib] using hd
    rw [hdecomp]
    linarith

/-- An integer-proposable Gram factor and diagonally dominant residual certify PSD. -/
theorem gram_residual_posSemidef {I J : Type*} [Fintype I] [Fintype J] [DecidableEq I]
    (B : Matrix I I ℝ) (C : Matrix I J ℝ) (s : ℝ) (hs : 0 < s)
    (hB : ∀ i j, B i j = B j i)
    (hdom : ∀ i, (∑ j : I, if i=j then 0 else
        |s^2*B i j - ∑ k : J, C i k*C j k|) ≤
      s^2*B i i - ∑ k : J, C i k*C i k) : B.PosSemidef := by
  let R : Matrix I I ℝ := fun i j => s^2*B i j - ∑ k : J, C i k*C j k
  have hR : R.PosSemidef := diagonally_dominant_posSemidef R (by
    intro i j
    simp only [R, hB i j]
    congr 1
    apply Finset.sum_congr rfl
    intro k _
    ring) hdom
  have hG : (C*C.conjTranspose).PosSemidef := Matrix.posSemidef_self_mul_conjTranspose C
  have hsum := hR.add hG
  have heq : R+C*C.conjTranspose = s^2 • B := by
    ext i j
    simp [R, Matrix.mul_apply, Matrix.conjTranspose_apply]
  rw [heq] at hsum
  refine ⟨?_, ?_⟩
  · ext i j
    simpa only [Matrix.conjTranspose_apply, star_trivial] using hB j i
  · intro x
    have hx := hsum.2 x
    have he : dotProduct (star x) ((s^2 • B) *ᵥ x) =
        s^2 * dotProduct (star x) (B *ᵥ x) := by
      simp only [dotProduct, Matrix.mulVec, Matrix.smul_apply, smul_eq_mul,
        Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro i _
      apply Finset.sum_congr rfl
      intro j _
      ring
    rw [he] at hx
    exact nonneg_of_mul_nonneg_right hx (sq_pos_of_pos hs)

#print axioms diagonally_dominant_posSemidef
#print axioms gram_residual_posSemidef
end
end Hedetniemi.Round4
