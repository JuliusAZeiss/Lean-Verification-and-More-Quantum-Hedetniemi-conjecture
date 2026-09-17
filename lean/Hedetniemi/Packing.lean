import Hedetniemi.BinaryPVM
import Hedetniemi.OperatorBounds

namespace Hedetniemi
open scoped BigOperators
variable {A : Type*} [CStarAlgebra A] [PartialOrder A] [StarOrderedRing A]
variable {J C : Type*} [Fintype J] [Fintype C]

/-- The actual operator capacity inequality at the heart of the obstruction.
The hypotheses are projection relations and a support identity, not a trace bound. -/
theorem clique_capacity
    (P : J → C → A) (hP : ∀ j, PVM (P j))
    (orth : ∀ a j j', j ≠ j' → P j a * P j' a = 0)
    (Q : C → A) (hQ : ∀ a, IsProjection (Q a))
    (k : ℕ) (sumQ : ∑ a, Q a = k • (1 : A))
    (F : A) (hF : star F = F)
    (support : ∀ j a, P j a * F = P j a * Q a * F) :
    Fintype.card J • (F * F) ≤ k • (F * F) := by
  classical
  have fixed (a : C) : (∑ j, F * P j a * F) ≤ F * Q a * F := by
    have eqterm (j : J) : F * P j a * F = star (Q a * F) * P j a * (Q a * F) := by
      calc
        _ = star (P j a * F) * (P j a * F) := by
          simp only [star_mul, hF, (hP j).sa]
          calc
            _ = F * (P j a * P j a) * F := by rw [(hP j).idem]
            _ = _ := by noncomm_ring
        _ = star (P j a * Q a * F) * (P j a * Q a * F) := by rw [support j a]
        _ = star (Q a * F) * P j a * (Q a * F) := by
          simp only [star_mul, (hP j).sa, hF, (hQ a).1]
          calc
            _ = F * Q a * (P j a * P j a) * Q a * F := by noncomm_ring
            _ = _ := by rw [(hP j).idem]; noncomm_ring
    simp_rw [eqterm]
    have hc := compressed_clique_bound (fun j => P j a)
      (fun j => ⟨(hP j).sa a, (hP j).idem a⟩) (orth a) (Q a * F)
    have hr : star (Q a * F) * (Q a * F) = F * Q a * F := by
      simp only [star_mul, hF, (hQ a).1]
      calc
        _ = F * (Q a * Q a) * F := by noncomm_ring
        _ = _ := by rw [(hQ a).2]
    exact hr ▸ hc
  have hs := Finset.sum_le_sum (fun a (_ : a ∈ (Finset.univ : Finset C)) => fixed a)
  have hleft : (∑ a, ∑ j, F * P j a * F) = Fintype.card J • (F * F) := by
    rw [Finset.sum_comm]
    have heach (j : J) : (∑ a, F * P j a * F) = F * F := by
      rw [← Finset.sum_mul, ← Finset.mul_sum, (hP j).sum_eq_one, mul_one]
    simp_rw [heach]
    simp
  have hright : (∑ a, F * Q a * F) = k • (F * F) := by
    rw [← Finset.sum_mul, ← Finset.mul_sum, sumQ]
    have hmul (m : ℕ) : F * (m • (1 : A)) * F = m • (F*F) := by
      induction m with
      | zero => simp
      | succ m ih => simp only [succ_nsmul, mul_add, add_mul, mul_one, ih]
    exact hmul k
  simpa only [hleft, hright] using hs

/-- One more clique vertex than residual colors forces the support effect to vanish. -/
theorem clique_capacity_zero
    (P : J → C → A) (hP : ∀ j, PVM (P j))
    (orth : ∀ a j j', j ≠ j' → P j a * P j' a = 0)
    (Q : C → A) (hQ : ∀ a, IsProjection (Q a))
    (k : ℕ) (sumQ : ∑ a, Q a = k • (1 : A))
    (cardJ : Fintype.card J = k+1)
    (F : A) (hF : star F = F)
    (support : ∀ j a, P j a * F = P j a * Q a * F) : F = 0 := by
  have h := clique_capacity P hP orth Q hQ k sumQ F hF support
  rw [cardJ, add_nsmul, one_nsmul] at h
  have hle : F * F ≤ 0 := (add_le_add_iff_left (k • (F*F))).mp (by simpa using h)
  have hpos : 0 ≤ F*F := by simpa only [hF] using star_mul_self_nonneg F
  exact (CStarRing.star_mul_self_eq_zero_iff F).mp (by simpa only [hF] using le_antisymm hle hpos)

/-- A dephased positive effect annihilating F forces every original summand to annihilate F. -/
theorem dephased_annihilates
    (Q P : C → A) (hQ : ∀ a, star (Q a) = Q a) (hP : PVM P)
    (F : A) (hz : (∑ a, Q a * P a * Q a) * F = 0) :
    ∀ a, P a * Q a * F = 0 := by
  apply zero_sum_squares (fun a => P a * Q a * F)
  have heq (a : C) : star (P a * Q a * F) * (P a * Q a * F) =
      star F * (Q a * P a * Q a) * F := by
    simp only [star_mul, hQ a, hP.sa a]
    calc
      _ = star F * Q a * (P a * P a) * Q a * F := by noncomm_ring
      _ = _ := by rw [hP.idem a]; noncomm_ring
  simp_rw [heq]
  rw [← Finset.sum_mul, ← Finset.mul_sum, mul_assoc, hz, mul_zero]

end Hedetniemi
