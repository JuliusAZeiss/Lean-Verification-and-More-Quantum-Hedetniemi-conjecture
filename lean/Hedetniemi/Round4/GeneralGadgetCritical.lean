import Hedetniemi.Round4.GeneralGadgetConsequences
import Hedetniemi.Round4.VertexExtension

namespace Hedetniemi.Round4
open scoped BigOperators
set_option linter.unusedSectionVars false

variable {C I E L B : Type*} [Fintype C] [Fintype I]
  [Fintype E] [Fintype L] [Fintype B]
variable [DecidableEq C] [DecidableEq I] [DecidableEq L] [DecidableEq B]
variable (pal : GeneralPalette C I E L B)

noncomputable def remainingFinalEquiv (j : L ⊕ B) :
    {x : L ⊕ B // x ≠ j} ≃ (E ⊕ L) := by
  classical
  apply Fintype.equivOfCardEq
  simp only [Fintype.card_subtype_compl, Fintype.card_subtype_eq,
    Fintype.card_sum, pal.private_card]
  omega

noncomputable def repackFinal (i : I) (j : L ⊕ B) (d : C) (x : L ⊕ B) : C := by
  classical
  exact if h : x = j then d else pal.residual i (remainingFinalEquiv pal j ⟨x,h⟩)

theorem repackFinal_injective (i : I) (j : L ⊕ B) (d : C)
    (hd : ∀ r, pal.residual i r ≠ d) : Function.Injective (repackFinal pal i j d) := by
  classical
  intro x y hxy
  by_cases hx : x = j <;> by_cases hy : y = j
  · exact hx.trans hy.symm
  · simp only [repackFinal, dif_pos hx, dif_neg hy] at hxy
    exact False.elim (hd _ hxy.symm)
  · simp only [repackFinal, dif_neg hx, dif_pos hy] at hxy
    exact False.elim (hd _ hxy)
  · simp only [repackFinal, dif_neg hx, dif_neg hy] at hxy
    exact congrArg Subtype.val ((remainingFinalEquiv pal j).injective
      ((pal.residual i).injective hxy))

noncomputable def blockColor (i : I) (j : L ⊕ B) (d : C) :
    GeneralGadgetVertex C I L B → C := by
  classical
  exact fun v => match v with
    | .anchor a => a
    | .center => pal.center i
    | .binary k b => if k = i then pal.privateLabel k b else pal.center k
    | .final k x => if k = i then repackFinal pal k j d x else pal.finalLabel k x

theorem blockColor_allowed (i : I) (j : L ⊕ B) (d : C)
    (v : GeneralGadgetVertex C I L B) (hv : v ≠ .final i j) :
    GeneralAllowed pal v (blockColor pal i j d v) := by
  classical
  cases v with
  | anchor a => rfl
  | center => exact ⟨i,rfl⟩
  | binary k b =>
    by_cases hk : k = i
    · simp [blockColor, hk, GeneralAllowed]
    · simp [blockColor, hk, GeneralAllowed]
  | final k x =>
    by_cases hk : k = i
    · subst k
      have hx : x ≠ j := by intro h; exact hv (h ▸ rfl)
      cases x with
      | inl l =>
        exact ⟨remainingFinalEquiv pal j ⟨.inl l, hx⟩,
          by simp [blockColor, repackFinal, hx]⟩
      | inr b =>
        exact Or.inl ⟨remainingFinalEquiv pal j ⟨.inr b, hx⟩,
          by simp [blockColor, repackFinal, hx]⟩
    · cases x with
      | inl l => exact ⟨.inr l, by simp [blockColor, hk, GeneralPalette.finalLabel]⟩
      | inr b => exact Or.inr (by simp [blockColor, hk, GeneralPalette.finalLabel])

theorem blockColor_anchor_failure (i : I) (j : L ⊕ B) (d a : C)
    (v : GeneralGadgetVertex C I L B) (hforbid : ¬ GeneralAllowed pal v a)
    (heq : a = blockColor pal i j d v) : v = .final i j ∧ a = d := by
  classical
  have hv : v = .final i j := by
    by_contra hn
    exact hforbid (heq ▸ blockColor_allowed pal i j d v hn)
  subst v
  exact ⟨rfl, by simpa [blockColor, repackFinal] using heq⟩

theorem blockColor_center_binary (i : I) (j : L ⊕ B) (d : C) (k : I) (b : B) :
    blockColor pal i j d .center ≠ blockColor pal i j d (.binary k b) := by
  classical
  by_cases hk : k = i
  · subst k
    simpa [blockColor] using (pal.private_ne_center i b i).symm
  · simpa [blockColor, hk] using (fun h => hk ((pal.center.injective h).symm))

theorem blockColor_binary_final_failure (i : I) (j : L ⊕ B) (d : C) (k : I) (b : B)
    (heq : blockColor pal i j d (.binary k b) =
      blockColor pal i j d (.final k (.inr b))) :
    k = i ∧ j = .inr b ∧ d = pal.privateLabel i b := by
  classical
  by_cases hk : k = i
  · subst k
    by_cases hj : (Sum.inr b : L ⊕ B) = j
    · exact ⟨rfl, hj.symm, by simpa [blockColor, repackFinal, hj] using heq.symm⟩
    · have h := pal.residual_ne_private i (remainingFinalEquiv pal j ⟨.inr b,hj⟩) b
      exact False.elim (h (by simpa [blockColor, repackFinal, hj] using heq.symm))
  · exact False.elim ((pal.private_ne_center k b k)
      (by simpa [blockColor, hk, GeneralPalette.finalLabel] using heq.symm))

theorem blockColor_final_injective (i : I) (j : L ⊕ B) (d : C)
    (hd : ∀ r, pal.residual i r ≠ d) (k : I) :
    Function.Injective (fun x => blockColor pal i j d (.final k x)) := by
  classical
  by_cases hk : k = i
  · subst k
    simpa [blockColor] using repackFinal_injective pal i j d hd
  · simpa [blockColor, hk] using pal.finalLabel_injective k

def deletedGadget (v : GeneralGadgetVertex C I L B) :
    SimpleGraph {w : GeneralGadgetVertex C I L B // w ≠ v} :=
  (generalGadgetGraph pal).induce {w | w ≠ v}

def deletedColoring (v : GeneralGadgetVertex C I L B)
    (f : GeneralGadgetVertex C I L B → C)
    (h : ∀ u w, GeneralGadgetEdge pal u w → u ≠ v → w ≠ v → f u ≠ f w) :
    (deletedGadget pal v).Coloring C :=
  SimpleGraph.Coloring.mk (fun w => f w.1) (by
    intro u w huw
    rcases huw with huw | huw
    · exact h u.1 w.1 huw u.2 w.2
    · exact Ne.symm (h w.1 u.1 huw w.2 u.2))

noncomputable def finalDeletedColoring (i : I) (j : L ⊕ B) :
    (deletedGadget pal (.final i j)).Coloring C := by
  classical
  apply deletedColoring pal (.final i j) (blockColor pal i j (pal.center i))
  intro u v hedge hu hv
  cases hedge with
  | anchor a v hforbid =>
    intro heq
    exact hv (blockColor_anchor_failure pal i j (pal.center i) a v hforbid heq).1
  | centerBinary k b => exact blockColor_center_binary pal i j (pal.center i) k b
  | binaryFinal k b =>
    intro heq
    obtain ⟨rfl,hj,_⟩ := blockColor_binary_final_failure pal i j (pal.center i) k b heq
    exact hv (by rw [hj])
  | finalClique k x y hxy =>
    exact fun h => hxy (blockColor_final_injective pal i j (pal.center i)
      (pal.residual_ne_center i) k h)

noncomputable def binaryDeletedColoring (i : I) (b : B) :
    (deletedGadget pal (.binary i b)).Coloring C := by
  classical
  apply deletedColoring pal (.binary i b) (blockColor pal i (.inr b) (pal.privateLabel i b))
  intro u v hedge hu hv
  cases hedge with
  | anchor a v hforbid =>
    intro heq
    obtain ⟨rfl,rfl⟩ := blockColor_anchor_failure pal i (.inr b) (pal.privateLabel i b)
      a v hforbid heq
    exact hforbid (Or.inr rfl)
  | centerBinary k b' => exact blockColor_center_binary pal i (.inr b) (pal.privateLabel i b) k b'
  | binaryFinal k b' =>
    intro heq
    obtain ⟨rfl,hb,_⟩ := blockColor_binary_final_failure pal i (.inr b)
      (pal.privateLabel i b) k b' heq
    exact hu (by rw [Sum.inr.inj hb])
  | finalClique k x y hxy =>
    exact fun h => hxy (blockColor_final_injective pal i (.inr b) (pal.privateLabel i b)
      (fun r => pal.residual_ne_private i r b) k h)

noncomputable def centerAnchorDeletedColoring (i : I) (j : L ⊕ B) :
    (deletedGadget pal (.anchor (pal.center i))).Coloring C := by
  classical
  apply deletedColoring pal (.anchor (pal.center i)) (blockColor pal i j (pal.center i))
  intro u v hedge hu hv
  cases hedge with
  | anchor a v hforbid =>
    intro heq
    have h := (blockColor_anchor_failure pal i j (pal.center i) a v hforbid heq).2
    exact hu (by rw [h])
  | centerBinary k b => exact blockColor_center_binary pal i j (pal.center i) k b
  | binaryFinal k b =>
    intro heq
    obtain ⟨_,_,h⟩ := blockColor_binary_final_failure pal i j (pal.center i) k b heq
    exact pal.private_ne_center i b i h.symm
  | finalClique k x y hxy =>
    exact fun h => hxy (blockColor_final_injective pal i j (pal.center i)
      (pal.residual_ne_center i) k h)

def normalColor (a : C) : GeneralGadgetVertex C I L B → C
  | .anchor b => b
  | .center => a
  | .final i j => pal.finalLabel i j
  | .binary i _ => pal.center i

theorem normalColor_allowed (a : C) (v : GeneralGadgetVertex C I L B)
    (hv : v ≠ .center) : GeneralAllowed pal v (normalColor pal a v) := by
  cases v with
  | anchor b => rfl
  | center => exact False.elim (hv rfl)
  | binary i b => exact Or.inl rfl
  | final i j =>
    cases j with
    | inl l => exact ⟨.inr l,rfl⟩
    | inr b => exact Or.inr rfl

theorem normalColor_anchor_failure (a b : C) (v : GeneralGadgetVertex C I L B)
    (hforbid : ¬ GeneralAllowed pal v b) (heq : b = normalColor pal a v) :
    v = .center ∧ b = a := by
  have hv : v = .center := by
    by_contra hn
    exact hforbid (heq ▸ normalColor_allowed pal a v hn)
  subst v
  exact ⟨rfl,heq⟩

def centerDeletedColoring (a : C) : (deletedGadget pal .center).Coloring C := by
  apply deletedColoring pal .center (normalColor pal a)
  intro u v hedge hu hv
  cases hedge with
  | anchor b v hforbid =>
    intro heq
    exact hv (normalColor_anchor_failure pal a b v hforbid heq).1
  | centerBinary i b => exact False.elim (hu rfl)
  | binaryFinal i b => exact (pal.private_ne_center i b i).symm
  | finalClique i x y hxy => exact fun h => hxy (pal.finalLabel_injective i h)

def outsideAnchorDeletedColoring (a : C) (ha : ∀ i, a ≠ pal.center i) :
    (deletedGadget pal (.anchor a)).Coloring C := by
  apply deletedColoring pal (.anchor a) (normalColor pal a)
  intro u v hedge hu hv
  cases hedge with
  | anchor b v hforbid =>
    intro heq
    have h := (normalColor_anchor_failure pal a b v hforbid heq).2
    exact hu (by rw [h])
  | centerBinary i b => exact ha i
  | binaryFinal i b => exact (pal.private_ne_center i b i).symm
  | finalClique i x y hxy => exact fun h => hxy (pal.finalLabel_injective i h)

/-- Explicit ordinary anchor-palette colorings after every vertex deletion. -/
theorem general_deleted_colorable [Nonempty I] (v : GeneralGadgetVertex C I L B) :
    (deletedGadget pal v).Colorable (Fintype.card C) := by
  classical
  cases v with
  | center => exact (centerDeletedColoring pal (pal.center (Classical.arbitrary I))).colorable
  | final i j => exact (finalDeletedColoring pal i j).colorable
  | binary i b => exact (binaryDeletedColoring pal i b).colorable
  | anchor a =>
    by_cases h : ∃ i, a = pal.center i
    · obtain ⟨i,rfl⟩ := h
      have hb : 0 < Fintype.card B := by rw [pal.private_card]; omega
      let b : B := Classical.choice (Fintype.card_pos_iff.mp hb)
      exact (centerAnchorDeletedColoring pal i (.inr b)).colorable
    · exact (outsideAnchorDeletedColoring pal a (by simpa using h)).colorable

/-- Every vertex deletion reduces the quantum chromatic number by exactly one. -/
theorem general_deleted_quantumChromaticNumber [Nonempty I]
    (v : GeneralGadgetVertex C I L B) :
    quantumChromaticNumber (deletedGadget pal v) = Fintype.card C := by
  classical
  have hup := (quantumChromaticNumber_le_iff (deletedGadget pal v) (Fintype.card C)).mpr
    (colorable_quantumColorable (general_deleted_colorable pal v))
  have hlo : Fintype.card C ≤ quantumChromaticNumber (deletedGadget pal v) := by
    by_contra h
    have hm : QuantumColorable (deletedGadget pal v)
        (quantumChromaticNumber (deletedGadget pal v)) :=
      (quantumChromaticNumber_le_iff _ _).mp le_rfl
    have hext := quantumColorable_extend_deleted v hm
    have hle : quantumChromaticNumber (deletedGadget pal v) + 1 ≤ Fintype.card C := by omega
    exact general_gadget_not_quantumColorable pal (quantumColorable_mono hle hext)
  exact le_antisymm hup hlo

end Hedetniemi.Round4
