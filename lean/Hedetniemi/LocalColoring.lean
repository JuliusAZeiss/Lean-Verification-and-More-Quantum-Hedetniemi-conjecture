import Mathlib

namespace Hedetniemi

/-- The two disjoint palettes of `n` colors used by the actual gadget. -/
abbrev GadgetColor (n : ℕ) := Sum (Fin n) (Fin n)

/-- The vertices of the manuscript's finite graph `H_n`. -/
inductive GadgetVertex (n : ℕ)
  | anchor : GadgetColor n → GadgetVertex n
  | center : GadgetVertex n
  | binary : Fin n → Fin n → GadgetVertex n
  | final : Fin n → Fin n → GadgetVertex n
  deriving DecidableEq, Fintype

/-- Membership in the anchor list of a vertex, including a singleton list
for an anchor itself. -/
def GadgetAllowed {n : ℕ} : GadgetVertex n → GadgetColor n → Prop
  | .anchor b, a => a = b
  | .center, a => ∃ q, a = .inl q
  | .binary q j, a => a = .inl q ∨ a = .inr j
  | .final q j, a => (∃ r, r ≠ q ∧ a = .inl r) ∨ a = .inr j

/-- The four required edge types, prior to taking symmetric closure. -/
inductive GadgetEdge {n : ℕ} : GadgetVertex n → GadgetVertex n → Prop
  | anchor (a : GadgetColor n) (v : GadgetVertex n)
      (forbidden : ¬ GadgetAllowed v a) : GadgetEdge (.anchor a) v
  | centerBinary (q j : Fin n) : GadgetEdge .center (.binary q j)
  | binaryFinal (q j : Fin n) : GadgetEdge (.binary q j) (.final q j)
  | finalClique (q j j' : Fin n) (different : j ≠ j') :
      GadgetEdge (.final q j) (.final q j')

theorem gadgetEdge_irrefl {n : ℕ} (v : GadgetVertex n) : ¬ GadgetEdge v v := by
  cases v <;> intro h <;> cases h <;> simp_all [GadgetAllowed]

/-- Exactly the manuscript's graph `H_n`; no additional edges are inserted. -/
def gadgetGraph (n : ℕ) : SimpleGraph (GadgetVertex n) where
  Adj u v := GadgetEdge u v ∨ GadgetEdge v u
  symm := by intro u v h; exact h.elim Or.inr Or.inl
  loopless := by intro v h; exact h.elim (gadgetEdge_irrefl v) (gadgetEdge_irrefl v)

/-- The categorical product, with both coordinates required to be adjacent. -/
def categoricalProduct {V W : Type*} (G : SimpleGraph V) (H : SimpleGraph W) :
    SimpleGraph (V × W) where
  Adj x y := G.Adj x.1 y.1 ∧ H.Adj x.2 y.2
  symm := by intro x y h; exact ⟨G.symm h.1, H.symm h.2⟩
  loopless := by intro x h; exact G.loopless x.1 h.1

section LocalRealization

variable {V : Type*} {n : ℕ} (G : SimpleGraph V) (f : V → Fin n)

/-- The exact one-step walk neighborhood of the fiber `f⁻¹(q)`. -/
def fiberN1 (q : Fin n) (x : V) : Prop := ∃ y, f y = q ∧ G.Adj y x

/-- The exact two-step walk neighborhood of the fiber `f⁻¹(q)`. -/
def fiberN2 (q : Fin n) (x : V) : Prop := ∃ y, fiberN1 G f q y ∧ G.Adj y x

variable (φ : (q : Fin n) → {x // fiberN2 G f q x} → {a : Fin n // a ≠ q})

/-- The explicit evaluation functions at every vertex of `H_n`. -/
noncomputable def localRealization : GadgetVertex n → V → GadgetColor n := by
  classical
  exact fun v x => match v with
    | .anchor a => a
    | .center => .inl (f x)
    | .binary q j => if fiberN1 G f q x then .inr j else .inl q
    | .final q j => if hx : fiberN2 G f q x then .inl (φ q ⟨x,hx⟩).1 else .inr j

theorem localRealization_allowed (v : GadgetVertex n) (x : V) :
    GadgetAllowed v (localRealization G f φ v x) := by
  classical
  cases v with
  | anchor a => rfl
  | center => exact ⟨f x,rfl⟩
  | binary q j =>
      simp only [localRealization, GadgetAllowed]
      split <;> simp
  | final q j =>
      simp only [localRealization, GadgetAllowed]
      split
      · exact Or.inl ⟨_, (φ q _).property, rfl⟩
      · exact Or.inr rfl

variable (proper : ∀ (q : Fin n) (x y : {x // fiberN2 G f q x}),
  G.Adj x.1 y.1 → (φ q x).1 ≠ (φ q y).1)

include proper

theorem localRealization_basicEdge {u v : GadgetVertex n}
    (edge : GadgetEdge u v) {x y : V} (xy : G.Adj x y) :
    localRealization G f φ u x ≠ localRealization G f φ v y := by
  classical
  cases edge with
  | anchor a v forbidden =>
      intro equal
      apply forbidden
      have allowed := localRealization_allowed G f φ v y
      change a = localRealization G f φ v y at equal
      rw [equal]
      exact allowed
  | centerBinary q j =>
      by_cases hy : fiberN1 G f q y
      · simp [localRealization,hy]
      · simp only [localRealization,if_neg hy, Sum.inl.injEq, ne_eq]
        intro equal
        exact hy ⟨x,equal,xy⟩
  | binaryFinal q j =>
      by_cases hx : fiberN1 G f q x
      · have hy : fiberN2 G f q y := ⟨x,hx,xy⟩
        simp [localRealization,hx,hy]
      · by_cases hy : fiberN2 G f q y
        · simp only [localRealization,if_neg hx,dif_pos hy]
          intro equal
          exact (φ q ⟨y,hy⟩).property (Sum.inl.inj equal).symm
        · simp [localRealization,hx,hy]
  | finalClique q j j' different =>
      by_cases hx : fiberN2 G f q x <;> by_cases hy : fiberN2 G f q y
      · simp only [localRealization,dif_pos hx,dif_pos hy]
        intro equal
        exact proper q ⟨x,hx⟩ ⟨y,hy⟩ xy (Sum.inl.inj equal)
      · simp [localRealization,hx,hy]
      · simp [localRealization,hx,hy]
      · simpa [localRealization,hx,hy] using different

/-- Every actual edge of `H_n` yields an exponential adjacency. -/
theorem localRealization_edge {u v : GadgetVertex n}
    (edge : (gadgetGraph n).Adj u v) {x y : V} (xy : G.Adj x y) :
    localRealization G f φ u x ≠ localRealization G f φ v y := by
  rcases edge with edge | edge
  · exact localRealization_basicEdge G f φ proper edge xy
  · exact Ne.symm (localRealization_basicEdge G f φ proper edge (G.symm xy))

/-- Section 3's local-neighborhood hypothesis produces an actual proper
coloring of the categorical product with the manuscript's `H_n`. -/
noncomputable def localProductColoring :
    (categoricalProduct G (gadgetGraph n)).Coloring (GadgetColor n) :=
  SimpleGraph.Coloring.mk (fun v => localRealization G f φ v.2 v.1)
    (fun h => localRealization_edge G f φ proper h.2 h.1)

theorem local_product_colorable :
    (categoricalProduct G (gadgetGraph n)).Colorable (2*n) := by
  simpa [GadgetColor, two_mul] using (localProductColoring G f φ proper).colorable

end LocalRealization

end Hedetniemi

namespace Hedetniemi

def gadgetVertexEquiv (n : ℕ) :
    GadgetVertex n ≃ (GadgetColor n ⊕ (Unit ⊕ ((Fin n × Fin n) ⊕ (Fin n × Fin n)))) where
  toFun v := match v with
    | .anchor a => .inl a
    | .center => .inr (.inl ())
    | .binary q j => .inr (.inr (.inl (q,j)))
    | .final q j => .inr (.inr (.inr (q,j)))
  invFun v := match v with
    | .inl a => .anchor a
    | .inr (.inl _) => .center
    | .inr (.inr (.inl (q,j))) => .binary q j
    | .inr (.inr (.inr (q,j))) => .final q j
  left_inv := by intro v; cases v <;> rfl
  right_inv := by
    intro v
    rcases v with a | (u | (⟨q,j⟩ | ⟨q,j⟩))
    · rfl
    · cases u; rfl
    · rfl
    · rfl

theorem gadgetVertex_card (n : ℕ) : Fintype.card (GadgetVertex n) = 2*n^2+2*n+1 := by
  rw [Fintype.card_congr (gadgetVertexEquiv n)]
  simp only [Fintype.card_sum,Fintype.card_unit,Fintype.card_prod,Fintype.card_fin,GadgetColor]
  ring

def gadgetUpperColor {n : ℕ} : GadgetVertex n → (GadgetColor n ⊕ Unit)
  | .anchor a => .inl a
  | .center => .inr ()
  | .binary q _ => .inl (.inl q)
  | .final _ j => .inl (.inr j)

theorem gadgetUpperColor_basic {n : ℕ} {u v : GadgetVertex n}
    (edge : GadgetEdge u v) : gadgetUpperColor u ≠ gadgetUpperColor v := by
  cases edge with
  | anchor a v forbidden =>
    cases v with
    | anchor b => simpa [gadgetUpperColor,GadgetAllowed] using forbidden
    | center => simp [gadgetUpperColor]
    | binary q j =>
      simp only [gadgetUpperColor,Sum.inl.injEq]
      intro equal
      exact forbidden (Or.inl (Sum.inl.inj equal))
    | final q j =>
      simp only [gadgetUpperColor,Sum.inl.injEq]
      intro equal
      exact forbidden (Or.inr (Sum.inl.inj equal))
  | centerBinary q j => simp [gadgetUpperColor]
  | binaryFinal q j => simp [gadgetUpperColor]
  | finalClique q j j' different => simpa [gadgetUpperColor] using different

def gadgetUpperColoring (n : ℕ) : (gadgetGraph n).Coloring (GadgetColor n ⊕ Unit) :=
  SimpleGraph.Coloring.mk gadgetUpperColor (by
    intro u v edge
    rcases edge with edge | edge
    · exact gadgetUpperColor_basic edge
    · exact Ne.symm (gadgetUpperColor_basic edge))

theorem gadget_colorable (n : ℕ) : (gadgetGraph n).Colorable (2*n+1) := by
  simpa [GadgetColor,two_mul] using (gadgetUpperColoring n).colorable

/-- An explicit edge-level formulation of the absence of five-step closed walks. -/
def NoClosedWalkFive {V : Type*} (F : SimpleGraph V) : Prop :=
  ∀ a b c d e, F.Adj a b → F.Adj b c → F.Adj c d → F.Adj d e → F.Adj e a → False

/-- Absence of triangles, stated directly in terms of the three edges. -/
def NoTriangles {V : Type*} (F : SimpleGraph V) : Prop :=
  ∀ a b c, F.Adj a b → F.Adj b c → F.Adj c a → False

/-- Absence of simple pentagons; the five vertices must be pairwise distinct. -/
def NoPentagons {V : Type*} (F : SimpleGraph V) : Prop :=
  ∀ a b c d e, List.Pairwise (fun x y => x ≠ y) [a,b,c,d,e] →
    F.Adj a b → F.Adj b c → F.Adj c d → F.Adj d e → F.Adj e a → False

theorem noClosedWalkFive_of_noTriangles_noPentagons {V : Type*} (F : SimpleGraph V)
    (noThree : NoTriangles F) (noFive : NoPentagons F) : NoClosedWalkFive F := by
  intro a b c d e ab bc cd de ea
  have hab : a ≠ b := F.ne_of_adj ab
  have hbc : b ≠ c := F.ne_of_adj bc
  have hcd : c ≠ d := F.ne_of_adj cd
  have hde : d ≠ e := F.ne_of_adj de
  have hae : a ≠ e := (F.ne_of_adj ea).symm
  have hac : a ≠ c := by
    intro equal
    subst c
    exact noThree a d e cd de ea
  have had : a ≠ d := by
    intro equal
    subst d
    exact noThree a b c ab bc cd
  have hbd : b ≠ d := by
    intro equal
    subst d
    exact noThree a b e ab de ea
  have hbe : b ≠ e := by
    intro equal
    subst e
    exact noThree b c d bc cd de
  have hce : c ≠ e := by
    intro equal
    subst e
    exact noThree a b c ab bc ea
  apply noFive a b c d e ?_ ab bc cd de ea
  simp [List.pairwise_cons,hab,hac,had,hae,hbc,hbd,hbe,hcd,hce,hde]

/-- Membership in the closed radius-two ball. -/
def inRadiusTwo {V : Type*} (F : SimpleGraph V) (q x : V) : Prop :=
  x = q ∨ F.Adj q x ∨ ∃ y, F.Adj q y ∧ F.Adj y x

theorem radiusTwo_parity_proper {V : Type*} (F : SimpleGraph V)
    (noFive : NoClosedWalkFive F) (q x y : V)
    (hx : inRadiusTwo F q x) (hy : inRadiusTwo F q y) (xy : F.Adj x y) :
    (F.Adj q x) ≠ (F.Adj q y) := by
  intro equal
  by_cases qx : F.Adj q x
  · have qy : F.Adj q y := equal ▸ qx
    exact noFive q x y q x qx xy (F.symm qy) qx (F.symm qx)
  · have qy : ¬ F.Adj q y := by rwa [← equal]
    rcases hx with rfl | qx' | ⟨a,qa,ax⟩
    · exact qy xy
    · exact qx qx'
    · rcases hy with rfl | qy' | ⟨b,qb,byEdge⟩
      · exact qx (F.symm xy)
      · exact qy qy'
      · exact noFive q a x y b qa ax xy (F.symm byEdge) (F.symm qb)

/-- Lexicographic blowup by a complete graph on the fiber type. -/
def cliqueBlowup {V I : Type*} (F : SimpleGraph V) : SimpleGraph (V × I) where
  Adj x y := F.Adj x.1 y.1 ∨ (x.1 = y.1 ∧ x.2 ≠ y.2)
  symm := by
    intro x y h
    rcases h with h | ⟨h1,h2⟩
    · exact Or.inl (F.symm h)
    · exact Or.inr ⟨h1.symm,h2.symm⟩
  loopless := by
    intro x h
    rcases h with h | h
    · exact F.loopless _ h
    · exact h.2 rfl

theorem blowup_fiberN2_radius {n t : ℕ} (F : SimpleGraph (Fin n))
    (q : Fin n) (x : Fin n × Fin t)
    (hx : fiberN2 (cliqueBlowup F) Prod.fst q x) :
    inRadiusTwo F q x.1 := by
  rcases hx with ⟨y,⟨z,hz,zy⟩,yx⟩
  change z.1 = q at hz
  rcases zy with zy | ⟨zy,_⟩ <;> rcases yx with yx | ⟨yx,_⟩
  · exact Or.inr (Or.inr ⟨y.1,by simpa [hz] using zy,yx⟩)
  · exact Or.inr (Or.inl (by simpa [hz,yx] using zy))
  · exact Or.inr (Or.inl (by simpa [← zy,hz] using yx))
  · exact Or.inl (yx.symm.trans (zy.symm.trans hz))

noncomputable def blowupLocalPair {n t : ℕ} (F : SimpleGraph (Fin n))
    (x : Fin n × Fin t) (q : Fin n) : Bool × Fin t := by
  classical
  exact (decide (F.Adj q x.1),x.2)

theorem blowupLocalPair_proper {n t : ℕ} (F : SimpleGraph (Fin n))
    (noFive : NoClosedWalkFive F) (q : Fin n) (x y : Fin n × Fin t)
    (hx : fiberN2 (cliqueBlowup F) Prod.fst q x)
    (hy : fiberN2 (cliqueBlowup F) Prod.fst q y)
    (xy : (cliqueBlowup F).Adj x y) :
    blowupLocalPair F x q ≠ blowupLocalPair F y q := by
  classical
  intro equal
  rcases xy with xy | ⟨_,ij⟩
  · have hbool : decide (F.Adj q x.1) = decide (F.Adj q y.1) :=
      congrArg Prod.fst equal
    have heq : (F.Adj q x.1) = (F.Adj q y.1) := by
      simpa using hbool
    exact radiusTwo_parity_proper F noFive q x.1 y.1
      (blowup_fiberN2_radius F q x hx) (blowup_fiberN2_radius F q y hy) xy heq
  · have hf := congrArg Prod.snd equal
    exact ij hf

noncomputable def residualPaletteEmbedding {n t : ℕ} (h : 2*t+1 ≤ n) (q : Fin n) :
    (Bool × Fin t) ↪ {a : Fin n // a ≠ q} := by
  classical
  apply Classical.choice (Function.Embedding.nonempty_of_card_le ?_)
  have hc : Fintype.card {a : Fin n // a ≠ q} = n-1 := by
    simpa only [Fintype.card_fin,Fintype.card_subtype_eq] using
      (Fintype.card_subtype_compl (fun a : Fin n => a = q))
  rw [hc]
  simp only [Fintype.card_prod,Fintype.card_bool,Fintype.card_fin]
  omega

noncomputable def blowupLocalColor {n t : ℕ} (F : SimpleGraph (Fin n))
    (h : 2*t+1 ≤ n) (q : Fin n)
    (x : {x : Fin n × Fin t // fiberN2 (cliqueBlowup F) Prod.fst q x}) :
    {a : Fin n // a ≠ q} :=
  residualPaletteEmbedding h q (blowupLocalPair F x.1 q)

theorem blowupLocalColor_proper {n t : ℕ} (F : SimpleGraph (Fin n))
    (h : 2*t+1 ≤ n) (noFive : NoClosedWalkFive F) (q : Fin n)
    (x y : {x : Fin n × Fin t // fiberN2 (cliqueBlowup F) Prod.fst q x})
    (xy : (cliqueBlowup F).Adj x.1 y.1) :
    (blowupLocalColor F h q x).1 ≠ (blowupLocalColor F h q y).1 := by
  intro equal
  have heq : blowupLocalColor F h q x = blowupLocalColor F h q y := Subtype.ext equal
  have hp := (residualPaletteEmbedding h q).injective heq
  exact blowupLocalPair_proper F noFive q x.1 y.1 x.property y.property xy hp

/-- The blowup specialization of the manuscript's local product-coloring theorem.
Its hypothesis excludes actual five-step closed walks, not colorability itself. -/
theorem blowup_product_colorable {n t : ℕ} (F : SimpleGraph (Fin n))
    (h : 2*t+1 ≤ n) (noFive : NoClosedWalkFive F) :
    (categoricalProduct (cliqueBlowup F : SimpleGraph (Fin n × Fin t))
      (gadgetGraph n)).Colorable (2*n) := by
  apply local_product_colorable (cliqueBlowup F) Prod.fst (blowupLocalColor F h)
  exact blowupLocalColor_proper F h noFive

/-- The manuscript's precise no-triangle/no-pentagon hypothesis suffices. -/
theorem blowup_product_colorable_of_noTriangles_noPentagons {n t : ℕ}
    (F : SimpleGraph (Fin n)) (h : 2*t+1 ≤ n)
    (noThree : NoTriangles F) (noFive : NoPentagons F) :
    (categoricalProduct (cliqueBlowup F : SimpleGraph (Fin n × Fin t))
      (gadgetGraph n)).Colorable (2*n) :=
  blowup_product_colorable F h (noClosedWalkFive_of_noTriangles_noPentagons F noThree noFive)

end Hedetniemi
