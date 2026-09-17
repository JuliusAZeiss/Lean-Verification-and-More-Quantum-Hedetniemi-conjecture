import Hedetniemi.Round4.GeneralGadget

namespace Hedetniemi.Round4
open scoped BigOperators ComplexOrder
set_option linter.unusedSectionVars false

variable {C I E L B : Type*} [Fintype C] [Fintype I]
  [Fintype E] [Fintype L] [Fintype B]
variable [DecidableEq C]
variable (pal : GeneralPalette C I E L B)

noncomputable def generalList (v : GeneralGadgetVertex C I L B) : Finset C := by
  classical
  exact Finset.univ.filter (GeneralAllowed pal v)

@[simp] theorem mem_generalList (v : GeneralGadgetVertex C I L B) (a : C) :
    a ∈ generalList pal v ↔ GeneralAllowed pal v a := by
  classical
  simp [generalList]

theorem generalList_binary (i : I) (b : B) :
    generalList pal (.binary i b) = {pal.center i, pal.privateLabel i b} := by
  classical
  ext a
  simp [GeneralAllowed]

theorem generalList_low (i : I) (l : L) :
    generalList pal (.final i (.inl l)) = pal.residualList i := by
  classical
  ext a
  simp [GeneralAllowed]

theorem generalList_high (i : I) (b : B) :
    generalList pal (.final i (.inr b)) = insert (pal.privateLabel i b) (pal.residualList i) := by
  classical
  ext a
  simp [GeneralAllowed, or_comm]

theorem generalList_binary_center (i : I) (b : B) :
    generalList pal (.binary i b) ∩ generalList pal .center = {pal.center i} := by
  classical
  ext a
  simp only [Finset.mem_inter, mem_generalList, GeneralAllowed, Finset.mem_singleton]
  constructor
  · rintro ⟨h, j, hj⟩
    rcases h with h | h
    · exact h
    · exact False.elim (pal.private_ne_center i b j (h.symm.trans hj))
  · intro h
    exact ⟨Or.inl h, i, h⟩

theorem generalList_high_binary (i : I) (b : B) :
    generalList pal (.final i (.inr b)) ∩ generalList pal (.binary i b) =
      {pal.privateLabel i b} := by
  classical
  ext a
  simp only [Finset.mem_inter, mem_generalList, GeneralAllowed, Finset.mem_singleton]
  constructor
  · rintro ⟨h, h'⟩
    rcases h' with h' | h'
    · rcases h with ⟨r, hr⟩ | h
      · exact False.elim (pal.residual_ne_center i r (hr.symm.trans h'))
      · exact h
    · exact h'
  · intro h
    exact ⟨Or.inr h, Or.inr h⟩

variable {A : Type*} [CStarAlgebra A]
variable (M : ProjectiveColoring (generalGadgetGraph pal) C A)

def generalAnchor (b a : C) : A := M.P (.anchor b) a

def generalEffect (v : GeneralGadgetVertex C I L B) (b : C) : A :=
  ∑ a, generalAnchor pal M b a * M.P v a * generalAnchor pal M b a

theorem generalAnchor_row (b : C) : PVM (generalAnchor pal M b) := M.pvm (.anchor b)

theorem generalAnchor_col (a : C) : PVM (fun b => generalAnchor pal M b a) := by
  apply anchor_columns (generalAnchor pal M) (generalAnchor_row pal M)
  intro a b d hbd
  exact M.edge (.anchor b) (.anchor d)
    (Or.inl (GeneralGadgetEdge.anchor b (.anchor d)
      (by simpa [GeneralAllowed] using hbd))) a

theorem general_support (v : GeneralGadgetVertex C I L B) :
    ∀ a, (∑ b ∈ generalList pal v, generalAnchor pal M b a) * M.P v a = M.P v a := by
  apply list_support_left (generalAnchor pal M) (generalAnchor_col pal M)
    (M.P v) (M.pvm v) (generalList pal v)
  intro a b hb
  exact M.edge v (.anchor b)
    (Or.inr (GeneralGadgetEdge.anchor b v (by simpa using hb))) a

theorem general_effect_sa (v : GeneralGadgetVertex C I L B) (b : C) :
    star (generalEffect pal M v b) = generalEffect pal M v b := by
  simp only [generalEffect, star_sum, star_mul, (generalAnchor_row pal M b).sa, (M.pvm v).sa]
  apply Finset.sum_congr rfl
  intro a _
  noncomm_ring

theorem general_binary_effect_sum (i : I) (b : B) :
    generalEffect pal M (.binary i b) (pal.center i) +
      generalEffect pal M (.binary i b) (pal.privateLabel i b) = 1 := by
  apply binary_relative_identity (generalAnchor pal M (pal.center i))
    (generalAnchor pal M (pal.privateLabel i b)) (M.P (.binary i b))
    (generalAnchor_row pal M _) (generalAnchor_row pal M _) (M.pvm _)
  · intro a
    exact (generalAnchor_col pal M a).orth _ _ (Ne.symm (pal.private_ne_center i b i))
  · intro a
    have h := general_support pal M (.binary i b) a
    rw [generalList_binary, Finset.sum_pair (Ne.symm (pal.private_ne_center i b i))] at h
    exact h

theorem general_binary_center_zero (i : I) (b : B) :
    generalEffect pal M (.binary i b) (pal.center i) *
      generalEffect pal M .center (pal.center i) = 0 := by
  apply singleton_intersection_identity (generalAnchor pal M)
    (generalAnchor_row pal M) (generalAnchor_col pal M)
    (M.P (.binary i b)) (M.P .center) (M.pvm _) (M.pvm _)
    (generalList pal (.binary i b)) (generalList pal .center) (pal.center i)
    (generalList_binary_center pal i b) (general_support pal M _) (general_support pal M _)
  intro a
  exact M.edge _ _ (Or.inr (GeneralGadgetEdge.centerBinary i b)) a

theorem general_high_binary_zero (i : I) (b : B) :
    generalEffect pal M (.final i (.inr b)) (pal.privateLabel i b) *
      generalEffect pal M (.binary i b) (pal.privateLabel i b) = 0 := by
  apply singleton_intersection_identity (generalAnchor pal M)
    (generalAnchor_row pal M) (generalAnchor_col pal M)
    (M.P (.final i (.inr b))) (M.P (.binary i b)) (M.pvm _) (M.pvm _)
    (generalList pal (.final i (.inr b))) (generalList pal (.binary i b))
    (pal.privateLabel i b) (generalList_high_binary pal i b)
    (general_support pal M _) (general_support pal M _)
  intro a
  exact M.edge _ _ (Or.inr (GeneralGadgetEdge.binaryFinal i b)) a

theorem general_binary_right_fix (i : I) (b : B) :
    generalEffect pal M (.binary i b) (pal.privateLabel i b) *
      generalEffect pal M .center (pal.center i) =
        generalEffect pal M .center (pal.center i) := by
  have h := congrArg (fun x : A => x * generalEffect pal M .center (pal.center i))
    (general_binary_effect_sum pal M i b)
  simpa only [add_mul, general_binary_center_zero pal M i b, zero_add, one_mul] using h

theorem general_high_effect_zero (i : I) (b : B) :
    generalEffect pal M (.final i (.inr b)) (pal.privateLabel i b) *
      generalEffect pal M .center (pal.center i) = 0 := by
  calc
    _ = generalEffect pal M (.final i (.inr b)) (pal.privateLabel i b) *
        (generalEffect pal M (.binary i b) (pal.privateLabel i b) *
          generalEffect pal M .center (pal.center i)) := by
      rw [general_binary_right_fix pal M i b]
    _ = 0 := by rw [← mul_assoc, general_high_binary_zero pal M i b, zero_mul]

/-- The final clique has exactly one more vertex than residual labels. -/
theorem general_center_effect_zero (i : I) :
    generalEffect pal M .center (pal.center i) = 0 := by
  classical
  letI : PartialOrder A := CStarAlgebra.spectralOrder A
  letI : StarOrderedRing A := CStarAlgebra.spectralOrderedRing A
  let R : C → A := fun a => ∑ b ∈ pal.residualList i, generalAnchor pal M b a
  have hR (a : C) : IsProjection (R a) :=
    anchor_mask_projection (generalAnchor pal M) (generalAnchor_col pal M) (pal.residualList i) a
  have sumR : (∑ a, R a) = (Fintype.card E + Fintype.card L) • (1 : A) := by
    dsimp [R]
    rw [Finset.sum_comm]
    simp_rw [(generalAnchor_row pal M _).sum_eq_one]
    simp
  have cardJ : Fintype.card (L ⊕ B) = (Fintype.card E + Fintype.card L) + 1 := by
    simp only [Fintype.card_sum, pal.private_card]
    omega
  apply clique_capacity_zero (fun j : L ⊕ B => M.P (.final i j))
    (fun j => M.pvm _) (fun a j j' h =>
      M.edge _ _ (Or.inl (GeneralGadgetEdge.finalClique i j j' h)) a)
    R hR (Fintype.card E + Fintype.card L) sumR cardJ
    (generalEffect pal M .center (pal.center i)) (general_effect_sa pal M _ _)
  intro j a
  have hs := congrArg star (general_support pal M (.final i j) a)
  have hstar : star (∑ b ∈ generalList pal (.final i j), generalAnchor pal M b a) =
      ∑ b ∈ generalList pal (.final i j), generalAnchor pal M b a := by
    simp only [star_sum, (generalAnchor_col pal M a).sa]
  rw [star_mul, (M.pvm _).sa, hstar] at hs
  cases j with
  | inl l =>
    rw [generalList_low] at hs
    change M.P (.final i (.inl l)) a * R a = M.P (.final i (.inl l)) a at hs
    rw [hs]
  | inr b =>
    have kill := dephased_annihilates (generalAnchor pal M (pal.privateLabel i b))
      (M.P (.final i (.inr b))) (generalAnchor_row pal M _).sa (M.pvm _)
      (generalEffect pal M .center (pal.center i)) (general_high_effect_zero pal M i b) a
    have hmask : (∑ d ∈ generalList pal (.final i (.inr b)), generalAnchor pal M d a) =
        generalAnchor pal M (pal.privateLabel i b) a + R a := by
      rw [generalList_high]
      rw [Finset.sum_insert (pal.private_not_residual i b)]
    rw [hmask] at hs
    calc
      _ = (M.P (.final i (.inr b)) a *
          (generalAnchor pal M (pal.privateLabel i b) a + R a)) *
            generalEffect pal M .center (pal.center i) := by rw [hs]
      _ = _ := by rw [mul_add, add_mul, kill, zero_add]

include M in
/-- No projective coloring by the anchor palette exists in any nonzero
unital C*-algebra, with no dimension or trace assumption. -/
theorem general_gadget_no_projective_coloring [Nontrivial A] : False := by
  classical
  letI : PartialOrder A := CStarAlgebra.spectralOrder A
  letI : StarOrderedRing A := CStarAlgebra.spectralOrderedRing A
  have heffect (b : C) : generalEffect pal M .center b = 0 := by
    by_cases h : ∃ i, b = pal.center i
    · obtain ⟨i, rfl⟩ := h
      exact general_center_effect_zero pal M i
    · apply Finset.sum_eq_zero
      intro a _
      have hz := M.edge .center (.anchor b)
        (Or.inr (GeneralGadgetEdge.anchor b .center h)) a
      change M.P .center a * generalAnchor pal M b a = 0 at hz
      change generalAnchor pal M b a * M.P .center a * generalAnchor pal M b a = 0
      rw [mul_assoc, hz, mul_zero]
  have hkill (b a : C) : M.P .center a * generalAnchor pal M b a = 0 := by
    have h := dephased_annihilates (generalAnchor pal M b) (M.P .center)
      (generalAnchor_row pal M b).sa (M.pvm .center) (1 : A)
      (by rw [← generalEffect, heffect, zero_mul]) a
    simpa only [mul_one] using h
  have hPzero (a : C) : M.P .center a = 0 := by
    calc
      _ = M.P .center a * (∑ b, generalAnchor pal M b a) := by
        rw [(generalAnchor_col pal M a).sum_eq_one, mul_one]
      _ = 0 := by simp only [Finset.mul_sum, hkill, Finset.sum_const_zero]
  have h := (M.pvm .center).sum_eq_one
  simp only [hPzero, Finset.sum_const_zero] at h
  exact zero_ne_one h

theorem general_gadget_not_quantumColorable :
    ¬ QuantumColorable (generalGadgetGraph pal) (Fintype.card C) := by
  classical
  rintro ⟨d, hd, ⟨Q⟩⟩
  letI := complexMatrix_nontrivial hd
  exact general_gadget_no_projective_coloring pal (Q.relabel (Fintype.equivFin C))

end Hedetniemi.Round4
