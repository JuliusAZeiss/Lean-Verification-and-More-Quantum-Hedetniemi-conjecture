import Hedetniemi.Anchor
import Hedetniemi.Packing
import Hedetniemi.ModelBridge
import Hedetniemi.LocalColoring

namespace Hedetniemi.Round4
open scoped BigOperators ComplexOrder
set_option linter.unusedSectionVars false

/-- Explicit anchor palettes. `E` indexes even local labels, `L` indexes
odd local labels and low finals, and `B` indexes privateLabel labels and binaries. -/
structure GeneralPalette (C I E L B : Type*) [Fintype E] [Fintype B] where
  center : I ↪ C
  residual : I → (E ⊕ L) ↪ C
  privateLabel : I → B ↪ C
  residual_ne_center : ∀ i r, residual i r ≠ center i
  private_ne_center : ∀ i b j, privateLabel i b ≠ center j
  residual_ne_private : ∀ i r b, residual i r ≠ privateLabel i b
  private_card : Fintype.card B = Fintype.card E + 1

inductive GeneralGadgetVertex (C I L B : Type*)
  | anchor : C → GeneralGadgetVertex C I L B
  | center : GeneralGadgetVertex C I L B
  | final : I → (L ⊕ B) → GeneralGadgetVertex C I L B
  | binary : I → B → GeneralGadgetVertex C I L B
  deriving DecidableEq, Fintype

variable {C I E L B : Type*} [Fintype C] [Fintype I]
  [Fintype E] [Fintype L] [Fintype B]
variable (pal : GeneralPalette C I E L B)

namespace GeneralPalette

noncomputable def residualList (i : I) : Finset C := by
  classical
  exact Finset.univ.map (pal.residual i)

@[simp] theorem mem_residualList (i : I) (a : C) :
    a ∈ pal.residualList i ↔ ∃ r, a = pal.residual i r := by
  classical
  simp [residualList, eq_comm]

@[simp] theorem residualList_card (i : I) :
    (pal.residualList i).card = Fintype.card E + Fintype.card L := by
  classical
  simp [residualList]

@[simp] theorem center_not_residual (i : I) : pal.center i ∉ pal.residualList i := by
  simp only [mem_residualList, not_exists]
  intro r h
  exact pal.residual_ne_center i r h.symm

@[simp] theorem private_not_residual (i : I) (b : B) :
    pal.privateLabel i b ∉ pal.residualList i := by
  simp only [mem_residualList, not_exists]
  intro r h
  exact pal.residual_ne_private i r b h.symm

def finalLabel (i : I) : L ⊕ B → C
  | .inl l => pal.residual i (.inr l)
  | .inr b => pal.privateLabel i b

theorem finalLabel_injective (i : I) : Function.Injective (pal.finalLabel i) := by
  intro x y h
  cases x with
  | inl l =>
    cases y with
    | inl l' => exact congrArg Sum.inl (Sum.inr.inj ((pal.residual i).injective h))
    | inr b => exact False.elim (pal.residual_ne_private i (.inr l) b h)
  | inr b =>
    cases y with
    | inl l => exact False.elim (pal.residual_ne_private i (.inr l) b h.symm)
    | inr b' => exact congrArg Sum.inr ((pal.privateLabel i).injective h)

end GeneralPalette

def GeneralAllowed : GeneralGadgetVertex C I L B → C → Prop
  | .anchor b, a => a = b
  | .center, a => ∃ i, a = pal.center i
  | .final i (.inl _), a => ∃ r, a = pal.residual i r
  | .final i (.inr b), a => (∃ r, a = pal.residual i r) ∨ a = pal.privateLabel i b
  | .binary i b, a => a = pal.center i ∨ a = pal.privateLabel i b

inductive GeneralGadgetEdge : GeneralGadgetVertex C I L B →
    GeneralGadgetVertex C I L B → Prop
  | anchor (a : C) (v : GeneralGadgetVertex C I L B)
      (forbidden : ¬ GeneralAllowed pal v a) : GeneralGadgetEdge (.anchor a) v
  | centerBinary (i : I) (b : B) : GeneralGadgetEdge .center (.binary i b)
  | binaryFinal (i : I) (b : B) : GeneralGadgetEdge (.binary i b) (.final i (.inr b))
  | finalClique (i : I) (j j' : L ⊕ B) (different : j ≠ j') :
      GeneralGadgetEdge (.final i j) (.final i j')

theorem generalGadgetEdge_irrefl (v : GeneralGadgetVertex C I L B) :
    ¬ GeneralGadgetEdge pal v v := by
  cases v <;> intro h <;> cases h <;> simp_all [GeneralAllowed]

def generalGadgetGraph : SimpleGraph (GeneralGadgetVertex C I L B) where
  Adj u v := GeneralGadgetEdge pal u v ∨ GeneralGadgetEdge pal v u
  symm := by intro u v h; exact h.elim Or.inr Or.inl
  loopless := by
    intro v h
    exact h.elim (generalGadgetEdge_irrefl pal v) (generalGadgetEdge_irrefl pal v)

def generalUpperColor : GeneralGadgetVertex C I L B → Option C
  | .anchor a => some a
  | .center => none
  | .final i j => some (pal.finalLabel i j)
  | .binary i _ => some (pal.center i)

theorem generalUpperColor_basic {u v : GeneralGadgetVertex C I L B}
    (edge : GeneralGadgetEdge pal u v) :
    generalUpperColor pal u ≠ generalUpperColor pal v := by
  cases edge with
  | anchor a v forbidden =>
    cases v with
    | anchor b => simpa [generalUpperColor, GeneralAllowed] using forbidden
    | center => simp [generalUpperColor]
    | final i j =>
      cases j with
      | inl l =>
        intro h
        exact forbidden ⟨.inr l, Option.some.inj h⟩
      | inr b =>
        intro h
        exact forbidden (Or.inr (Option.some.inj h))
    | binary i b =>
      intro h
      exact forbidden (Or.inl (Option.some.inj h))
  | centerBinary i b => simp [generalUpperColor]
  | binaryFinal i b =>
    simpa [generalUpperColor, GeneralPalette.finalLabel, eq_comm] using
      pal.private_ne_center i b i
  | finalClique i j j' different =>
    intro h
    exact different (pal.finalLabel_injective i (Option.some.inj h))

def generalUpperColoring : (generalGadgetGraph pal).Coloring (Option C) :=
  SimpleGraph.Coloring.mk (generalUpperColor pal) (fun h => by
    rcases h with h | h
    · exact generalUpperColor_basic pal h
    · exact Ne.symm (generalUpperColor_basic pal h))

theorem general_gadget_colorable :
    (generalGadgetGraph pal).Colorable (Fintype.card C + 1) := by
  simpa using (generalUpperColoring pal).colorable

def generalGadgetVertexEquiv : GeneralGadgetVertex C I L B ≃
    C ⊕ (Unit ⊕ ((I × (L ⊕ B)) ⊕ (I × B))) where
  toFun v := match v with
    | .anchor a => .inl a
    | .center => .inr (.inl ())
    | .final i j => .inr (.inr (.inl (i,j)))
    | .binary i b => .inr (.inr (.inr (i,b)))
  invFun v := match v with
    | .inl a => .anchor a
    | .inr (.inl _) => .center
    | .inr (.inr (.inl (i,j))) => .final i j
    | .inr (.inr (.inr (i,b))) => .binary i b
  left_inv := by intro v; cases v <;> rfl
  right_inv := by
    intro v
    rcases v with a | (u | (⟨i,j⟩ | ⟨i,b⟩))
    · rfl
    · cases u; rfl
    · rfl
    · rfl

theorem generalGadgetVertex_card : Fintype.card (GeneralGadgetVertex C I L B) =
    Fintype.card C + 1 + Fintype.card I *
      (Fintype.card L + 2 * Fintype.card B) := by
  rw [Fintype.card_congr generalGadgetVertexEquiv]
  simp only [Fintype.card_sum, Fintype.card_unit, Fintype.card_prod]
  ring

end Hedetniemi.Round4
