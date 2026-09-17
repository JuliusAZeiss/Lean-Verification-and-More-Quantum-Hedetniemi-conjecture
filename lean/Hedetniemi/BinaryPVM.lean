import Mathlib

/-! Genuine C*-algebra proofs of the binary-list and singleton-intersection identities. -/

namespace Hedetniemi

open scoped BigOperators

variable {A : Type*} [CStarAlgebra A]
variable {ι : Type*} [Fintype ι]

/-- A projection-valued measurement, with its actual C*-algebra relations. -/
structure PVM (P : ι → A) : Prop where
  sa : ∀ a, star (P a) = P a
  idem : ∀ a, P a * P a = P a
  orth : ∀ a b, a ≠ b → P a * P b = 0
  sum_eq_one : ∑ a, P a = 1

/-- A finite family of self-adjoint projections summing to one is orthogonal.
The proof derives orthogonality using the canonical C*-algebra order. -/
theorem orthogonal_of_projection_sum
    (S : ι → A) (hsa : ∀ a, star (S a) = S a)
    (hid : ∀ a, S a * S a = S a) (hsum : ∑ a, S a = 1) :
    ∀ i j, i ≠ j → S i * S j = 0 := by
  classical
  letI : PartialOrder A := CStarAlgebra.spectralOrder A
  letI : StarOrderedRing A := CStarAlgebra.spectralOrderedRing A
  intro i j hij
  have hsumErase : ∑ a ∈ Finset.univ.erase j, S a = 1 - S j := by
    have h := Finset.sum_erase_add (s := Finset.univ) (f := S) (Finset.mem_univ j)
    rw [hsum] at h
    exact eq_sub_iff_add_eq.mpr h
  have hterm (a : ι) : star (S a * S j) * (S a * S j) = S j * S a * S j := by
    rw [star_mul, hsa j, hsa a]
    calc
      S j * S a * (S a * S j) = S j * (S a * S a) * S j := by noncomm_ring
      _ = S j * S a * S j := by rw [hid a]
  have hzero : ∑ a ∈ Finset.univ.erase j, star (S a * S j) * (S a * S j) = 0 := by
    simp_rw [hterm]
    rw [← Finset.sum_mul, ← Finset.mul_sum, hsumErase]
    simp [mul_sub, sub_mul, hid j]
  have hall := (Finset.sum_eq_zero_iff_of_nonneg
    (fun a (_ : a ∈ Finset.univ.erase j) => star_mul_self_nonneg (S a * S j))).mp hzero
  exact (CStarRing.star_mul_self_eq_zero_iff _).mp
    (hall i (Finset.mem_erase.mpr ⟨hij, Finset.mem_univ i⟩))

/-- The complement inside the two allowed anchor rows is itself a PVM. -/
theorem complementary_pvm (Q R P : ι → A) (hQ : PVM Q) (hR : PVM R) (hP : PVM P)
    (hQR : ∀ a, Q a * R a = 0)
    (hsupport : ∀ a, (Q a + R a) * P a = P a) :
    PVM (fun a => Q a + R a - P a) := by
  classical
  have hRQ (a : ι) : R a * Q a = 0 := by
    have h := congrArg star (hQR a)
    simpa [star_mul, hQ.sa a, hR.sa a] using h
  have hright (a : ι) : P a * (Q a + R a) = P a := by
    have h := congrArg star (hsupport a)
    simpa [star_mul, star_add, hQ.sa a, hR.sa a, hP.sa a] using h
  have heid (a : ι) : (Q a + R a) * (Q a + R a) = Q a + R a := by
    simp [add_mul, mul_add, hQ.idem a, hR.idem a, hQR a, hRQ a]
  have hsa (a : ι) : star (Q a + R a - P a) = Q a + R a - P a := by
    simp [star_sub, star_add, hQ.sa a, hR.sa a, hP.sa a]
  have hid (a : ι) : (Q a + R a - P a) * (Q a + R a - P a) = Q a + R a - P a := by
    calc
      _ = (Q a + R a) * (Q a + R a) - (Q a + R a) * P a
          - P a * (Q a + R a) + P a * P a := by noncomm_ring
      _ = Q a + R a - P a := by
        rw [heid a, hsupport a, hright a, hP.idem a]
        abel
  have hsum : ∑ a, (Q a + R a - P a) = 1 := by
    rw [Finset.sum_sub_distrib, Finset.sum_add_distrib, hQ.sum_eq_one,
      hR.sum_eq_one, hP.sum_eq_one]
    simp
  exact ⟨hsa, hid, orthogonal_of_projection_sum _ hsa hid hsum, hsum⟩

/-- Squaring a sum whose middle factors form a PVM removes all cross terms. -/
theorem pvm_sum_mul_star (L P : ι → A) (hL : ∀ a, star (L a) = L a)
    (hP : PVM P) :
    (∑ a, L a * P a) * star (∑ a, L a * P a) = ∑ a, L a * P a * L a := by
  classical
  have hterm (a b : ι) : L a * P a * (star (P b) * star (L b)) =
      if a = b then L a * P a * L a else 0 := by
    rw [hP.sa b, hL b]
    by_cases h : a = b
    · subst b
      simp only [ite_true]
      calc
        _ = L a * (P a * P a) * L a := by noncomm_ring
        _ = _ := by rw [hP.idem a]
    · simp only [h, ite_false]
      calc
        _ = L a * (P a * P b) * L b := by noncomm_ring
        _ = 0 := by rw [hP.orth a b h]; simp
  simp only [star_sum, star_mul, Finset.sum_mul, Finset.mul_sum]
  simp_rw [hterm]
  simp

/-- The binary-list identity, proved from genuine PVM and support relations. -/
theorem binary_relative_identity (Q R P : ι → A)
    (hQ : PVM Q) (hR : PVM R) (hP : PVM P)
    (hQR : ∀ a, Q a * R a = 0)
    (hsupport : ∀ a, (Q a + R a) * P a = P a) :
    (∑ a, Q a * P a * Q a) + (∑ a, R a * P a * R a) = 1 := by
  classical
  let S : ι → A := fun a => Q a + R a - P a
  have hS : PVM S := complementary_pvm Q R P hQ hR hP hQR hsupport
  have hAB : (∑ a, Q a * P a) + (∑ a, R a * P a) = 1 := by
    calc
      _ = ∑ a, (Q a + R a) * P a := by simp [add_mul, Finset.sum_add_distrib]
      _ = ∑ a, P a := Finset.sum_congr rfl (fun a _ => hsupport a)
      _ = 1 := hP.sum_eq_one
  have hB : (∑ a, R a * P a) = ∑ a, Q a * S a := by
    have hQS : (∑ a, Q a * S a) = 1 - ∑ a, Q a * P a := by
      simp only [S, mul_sub, mul_add, hQ.idem, hQR, add_zero]
      rw [Finset.sum_sub_distrib, hQ.sum_eq_one]
    rw [hQS]
    apply eq_sub_iff_add_eq.mpr
    simpa [add_comm] using hAB
  have hD : (∑ a, R a * P a * R a) = 1 - ∑ a, Q a * P a * Q a := by
    calc
      _ = (∑ a, R a * P a) * star (∑ a, R a * P a) :=
        (pvm_sum_mul_star R P hR.sa hP).symm
      _ = (∑ a, Q a * S a) * star (∑ a, Q a * S a) := by rw [hB]
      _ = ∑ a, Q a * S a * Q a := pvm_sum_mul_star Q S hQ.sa hS
      _ = ∑ a, (Q a - Q a * P a * Q a) := by
        apply Finset.sum_congr rfl
        intro a _
        dsimp [S]
        simp [mul_sub, mul_add, sub_mul, add_mul, hQ.idem a, hQR a]
      _ = 1 - ∑ a, Q a * P a * Q a := by
        rw [Finset.sum_sub_distrib, hQ.sum_eq_one]
  rw [hD]
  abel

/-- Orthogonality of dephased effects from a same-output singleton sandwich. -/
theorem relative_mul_eq_zero (Q P T : ι → A) (hQ : PVM Q)
    (hsandwich : ∀ a, P a * Q a * T a = 0) :
    (∑ a, Q a * P a * Q a) * (∑ a, Q a * T a * Q a) = 0 := by
  classical
  have hterm (a b : ι) : (Q a * P a * Q a) * (Q b * T b * Q b) = 0 := by
    by_cases h : a = b
    · subst b
      calc
        _ = Q a * P a * (Q a * Q a) * T a * Q a := by noncomm_ring
        _ = Q a * (P a * Q a * T a) * Q a := by rw [hQ.idem a]; noncomm_ring
        _ = 0 := by rw [hsandwich a]; simp
    · calc
        _ = Q a * P a * (Q a * Q b) * T b * Q b := by noncomm_ring
        _ = 0 := by rw [hQ.orth a b h]; simp
  simp only [Finset.sum_mul, Finset.mul_sum, hterm, Finset.sum_const_zero]

variable {κ : Type*} [Fintype κ] [DecidableEq κ]

/-- The product of two anchor masks with singleton intersection is that anchor. -/
theorem anchor_mask_mul_singleton (Q : κ → A) (hQ : PVM Q)
    (S T : Finset κ) (q : κ) (hinter : S ∩ T = {q}) :
    (∑ b ∈ S, Q b) * (∑ b ∈ T, Q b) = Q q := by
  classical
  have hq : q ∈ S ∩ T := by rw [hinter]; simp
  have hqS : q ∈ S := (Finset.mem_inter.mp hq).1
  have hqT : q ∈ T := (Finset.mem_inter.mp hq).2
  have hcommon (x : κ) (hxS : x ∈ S) (hxT : x ∈ T) : x = q := by
    have hx : x ∈ S ∩ T := Finset.mem_inter.mpr ⟨hxS, hxT⟩
    rw [hinter] at hx
    exact Finset.mem_singleton.mp hx
  calc
    _ = ∑ x ∈ S, ∑ y ∈ T, Q x * Q y := by
      rw [Finset.sum_mul]
      simp_rw [Finset.mul_sum]
    _ = ∑ y ∈ T, Q q * Q y := by
      apply Finset.sum_eq_single q
      · intro x hx hxq
        apply Finset.sum_eq_zero
        intro y hy
        apply hQ.orth x y
        intro hxy
        subst y
        exact hxq (hcommon x hx hy)
      · intro h
        exact (h hqS).elim
    _ = Q q := by
      rw [Finset.sum_eq_single q]
      · exact hQ.idem q
      · intro y hy hyq
        exact hQ.orth q y (Ne.symm hyq)
      · intro h
        exact (h hqT).elim

/-- The singleton-intersection identity directly from anchor PVMs and genuine list support. -/
theorem singleton_intersection_identity (Q : κ → ι → A)
    (hrow : ∀ b, PVM (Q b)) (hcol : ∀ a, PVM (fun b => Q b a))
    (P T : ι → A) (hP : PVM P) (_hT : PVM T)
    (S U : Finset κ) (q : κ) (hinter : S ∩ U = {q})
    (hsupportP : ∀ a, (∑ b ∈ S, Q b a) * P a = P a)
    (hsupportT : ∀ a, (∑ b ∈ U, Q b a) * T a = T a)
    (hedge : ∀ a, P a * T a = 0) :
    (∑ a, Q q a * P a * Q q a) * (∑ a, Q q a * T a * Q q a) = 0 := by
  classical
  apply relative_mul_eq_zero (Q q) P T (hrow q)
  intro a
  have hright : P a * (∑ b ∈ S, Q b a) = P a := by
    have h := congrArg star (hsupportP a)
    simpa only [star_mul, hP.sa a, star_sum, (hcol a).sa] using h
  have hmask := anchor_mask_mul_singleton (fun b => Q b a) (hcol a) S U q hinter
  calc
    P a * Q q a * T a = P a * ((∑ b ∈ S, Q b a) * (∑ b ∈ U, Q b a)) * T a := by
      rw [hmask]
    _ = (P a * (∑ b ∈ S, Q b a)) * ((∑ b ∈ U, Q b a) * T a) := by noncomm_ring
    _ = 0 := by rw [hright, hsupportT a, hedge a]

end Hedetniemi
