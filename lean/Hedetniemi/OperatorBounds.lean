import Mathlib

namespace Hedetniemi
open scoped BigOperators

variable {A : Type*} [CStarAlgebra A] [PartialOrder A] [StarOrderedRing A]
variable {I : Type*} [Fintype I]

/-- A self-adjoint idempotent, expressed without extra model assumptions. -/
def IsProjection (p : A) : Prop := star p = p ∧ p * p = p

theorem projection_nonneg {p : A} (hp : IsProjection p) : 0 ≤ p := by
  simpa only [hp.1, hp.2] using star_mul_self_nonneg p

omit [PartialOrder A] [StarOrderedRing A] in
theorem projection_one_sub {p : A} (hp : IsProjection p) : IsProjection (1-p) := by
  constructor
  · simp [star_sub, hp.1]
  · simp only [mul_sub, sub_mul, one_mul, mul_one, hp.2]
    abel

theorem projection_le_one {p : A} (hp : IsProjection p) : p ≤ 1 := by
  exact sub_nonneg.mp (projection_nonneg (projection_one_sub hp))

omit [PartialOrder A] [StarOrderedRing A] [Fintype I] in
theorem orthogonal_sum_projection (p : I → A) (s : Finset I)
    (hp : ∀ i ∈ s, IsProjection (p i))
    (ho : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → p i * p j = 0) :
    IsProjection (∑ i ∈ s, p i) := by
  classical
  constructor
  · simp only [star_sum]
    exact Finset.sum_congr rfl (fun i hi => (hp i hi).1)
  · rw [Finset.sum_mul_sum]
    apply Finset.sum_congr rfl
    intro i hi
    rw [Finset.sum_eq_single i]
    · exact (hp i hi).2
    · intro j hj hji
      exact ho i hi j hj (Ne.symm hji)
    · intro hnot
      exact False.elim (hnot hi)

omit [Fintype I] in
theorem orthogonal_sum_le_one (p : I → A) (s : Finset I)
    (hp : ∀ i ∈ s, IsProjection (p i))
    (ho : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → p i * p j = 0) :
    (∑ i ∈ s, p i) ≤ 1 := projection_le_one (orthogonal_sum_projection p s hp ho)

/-- Zero sum of positive squares forces each operator to vanish. -/
theorem zero_sum_squares (x : I → A) (h : ∑ i, star (x i) * x i = 0) :
    ∀ i, x i = 0 := by
  intro i
  have hi := (Finset.sum_eq_zero_iff_of_nonneg
    (fun j (_ : j ∈ (Finset.univ : Finset I)) => star_mul_self_nonneg (x j))).mp h
  exact (CStarRing.star_mul_self_eq_zero_iff _).mp (hi i (Finset.mem_univ i))

/-- A sum of orthogonal positive projections can be compressed in any direction. -/
theorem compressed_clique_bound (p : I → A) (hp : ∀ i, IsProjection (p i))
    (ho : ∀ i j, i ≠ j → p i * p j = 0) (x : A) :
    (∑ i, star x * p i * x) ≤ star x * x := by
  have h := conjugate_le_conjugate
    (orthogonal_sum_le_one p Finset.univ (fun i _ => hp i) (fun i _ j _ => ho i j)) x
  simpa only [Finset.mul_sum, Finset.sum_mul, mul_one] using h

end Hedetniemi
