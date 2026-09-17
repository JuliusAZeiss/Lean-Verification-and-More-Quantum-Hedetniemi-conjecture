import Hedetniemi.BinaryPVM
import Hedetniemi.OperatorBounds

namespace Hedetniemi

open scoped BigOperators

variable {A : Type*} [CStarAlgebra A]
variable {C : Type*} [Fintype C]

/-- A square array with PVM rows and orthogonal columns has PVM columns.
Column normalization is derived by positivity of every column defect. -/
theorem anchor_columns (Q : C → C → A) (hrow : ∀ b, PVM (Q b))
    (horth : ∀ a b d, b ≠ d → Q b a * Q d a = 0) :
    ∀ a, PVM (fun b => Q b a) := by
  classical
  letI : PartialOrder A := CStarAlgebra.spectralOrder A
  letI : StarOrderedRing A := CStarAlgebra.spectralOrderedRing A
  have hle (a : C) : (∑ b, Q b a) ≤ 1 := by
    apply orthogonal_sum_le_one (fun b => Q b a) Finset.univ
    · intro b _
      exact ⟨(hrow b).sa a, (hrow b).idem a⟩
    · intro b _ d _ hbd
      exact horth a b d hbd
  have htotal : (∑ a, ∑ b, Q b a) = Fintype.card C • (1 : A) := by
    rw [Finset.sum_comm]
    simp_rw [(hrow _).sum_eq_one]
    simp
  have hsumdef : (∑ a, (1 - ∑ b, Q b a)) = 0 := by
    rw [Finset.sum_sub_distrib, htotal]
    simp
  have hdef := (Finset.sum_eq_zero_iff_of_nonneg
    (fun a (_ : a ∈ (Finset.univ : Finset C)) => sub_nonneg.mpr (hle a))).mp hsumdef
  intro a
  refine ⟨fun b => (hrow b).sa a, fun b => (hrow b).idem a, horth a, ?_⟩
  exact (sub_eq_zero.mp (hdef a (Finset.mem_univ a))).symm

variable {ι κ : Type*} [Fintype κ]

/-- Forbidden-anchor products imply right support on the allowed anchor mask. -/
theorem list_support_right (Q : κ → ι → A)
    (hcol : ∀ a, PVM (fun b => Q b a)) (P : ι → A) (L : Finset κ)
    (hforbidden : ∀ a b, b ∉ L → P a * Q b a = 0) :
    ∀ a, P a * (∑ b ∈ L, Q b a) = P a := by
  classical
  intro a
  calc
    _ = ∑ b ∈ L, P a * Q b a := by rw [Finset.mul_sum]
    _ = ∑ b, P a * Q b a := by
      apply Finset.sum_subset (Finset.subset_univ L)
      intro b _ hb
      exact hforbidden a b hb
    _ = P a * (∑ b, Q b a) := by rw [Finset.mul_sum]
    _ = P a := by rw [(hcol a).sum_eq_one, mul_one]

/-- Forbidden-anchor products imply left support, by self-adjointness. -/
theorem list_support_left [Fintype ι] (Q : κ → ι → A)
    (hcol : ∀ a, PVM (fun b => Q b a)) (P : ι → A) (hP : PVM P) (L : Finset κ)
    (hforbidden : ∀ a b, b ∉ L → P a * Q b a = 0) :
    ∀ a, (∑ b ∈ L, Q b a) * P a = P a := by
  intro a
  have h := congrArg star (list_support_right Q hcol P L hforbidden a)
  simpa only [star_mul, star_sum, (hcol a).sa, hP.sa a] using h

/-- Any mask of a column PVM is a genuine self-adjoint projection. -/
theorem anchor_mask_projection (Q : κ → ι → A)
    (hcol : ∀ a, PVM (fun b => Q b a)) (L : Finset κ) (a : ι) :
    IsProjection (∑ b ∈ L, Q b a) := by
  classical
  letI : PartialOrder A := CStarAlgebra.spectralOrder A
  letI : StarOrderedRing A := CStarAlgebra.spectralOrderedRing A
  apply orthogonal_sum_projection (fun b => Q b a) L
  · intro b _
    exact ⟨(hcol a).sa b, (hcol a).idem b⟩
  · intro b _ d _ hbd
    exact (hcol a).orth b d hbd

end Hedetniemi
