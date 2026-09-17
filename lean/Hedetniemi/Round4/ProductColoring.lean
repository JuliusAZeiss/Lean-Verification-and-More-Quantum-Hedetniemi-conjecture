import Hedetniemi.Round4.SmallGraphs
import Hedetniemi.Round4.GeneralGadget

namespace Hedetniemi.Round4

section GeneralEvaluation
variable {C I B : Type*} [Fintype C] [Fintype I] [Fintype B]
variable {t : ℕ} (F : SimpleGraph I)
  (pal : GeneralPalette C I (Fin t) (Fin t) B)

noncomputable def localResidual (q : I) (x : I × Fin t) : Fin t ⊕ Fin t := by
  classical
  exact if F.Adj q x.1 then .inr x.2 else .inl x.2

noncomputable def generalEvaluation : GeneralGadgetVertex C I (Fin t) B →
    (I × Fin t) → C := by
  classical
  exact fun v x => match v with
    | .anchor a => a
    | .center => pal.center x.1
    | .binary i b => if x.1 = i ∨ F.Adj i x.1 then pal.privateLabel i b else pal.center i
    | .final i j => if inRadiusTwo F i x.1 then pal.residual i (localResidual F i x)
        else pal.finalLabel i j

omit [Fintype C] [Fintype I] in
theorem generalEvaluation_allowed (v : GeneralGadgetVertex C I (Fin t) B)
    (x : I × Fin t) : GeneralAllowed pal v (generalEvaluation F pal v x) := by
  classical
  cases v with
  | anchor a => rfl
  | center => exact ⟨x.1,rfl⟩
  | binary i b =>
    simp only [generalEvaluation,GeneralAllowed]
    split <;> simp
  | final i j =>
    cases j with
    | inl l =>
      simp only [generalEvaluation,GeneralAllowed]
      split
      · exact ⟨_,rfl⟩
      · exact ⟨.inr l,rfl⟩
    | inr b =>
      simp only [generalEvaluation,GeneralAllowed]
      split
      · exact Or.inl ⟨_,rfl⟩
      · exact Or.inr rfl

omit [Fintype I] in
theorem closedOne_neighbor_radius (q : I) (x y : I × Fin t)
    (hx : x.1 = q ∨ F.Adj q x.1)
    (xy : (cliqueBlowup F).Adj x y) : inRadiusTwo F q y.1 := by
  rcases xy with xy | ⟨heq,_⟩
  · rcases hx with hx | hx
    · exact Or.inr (Or.inl (by simpa [hx] using xy))
    · exact Or.inr (Or.inr ⟨x.1,hx,xy⟩)
  · rcases hx with hx | hx
    · exact Or.inl (heq.symm.trans hx)
    · exact Or.inr (Or.inl (by simpa [heq] using hx))

omit [Fintype I] in
theorem odd_neighbor_radius (q : I) (x y : I × Fin t)
    (hx : F.Adj q x.1) (xy : (cliqueBlowup F).Adj x y) :
    inRadiusTwo F q y.1 :=
  closedOne_neighbor_radius F q x y (Or.inr hx) xy

omit [Fintype I] in
theorem localResidual_proper (noFive : NoClosedWalkFive F)
    (q : I) (x y : I × Fin t)
    (hx : inRadiusTwo F q x.1) (hy : inRadiusTwo F q y.1)
    (xy : (cliqueBlowup F).Adj x y) : localResidual F q x ≠ localResidual F q y := by
  classical
  intro heq
  rcases xy with xy | ⟨_,hij⟩
  · have hparity : (F.Adj q x.1) = (F.Adj q y.1) := by
      by_cases qx : F.Adj q x.1 <;> by_cases qy : F.Adj q y.1
      · simp [qx,qy]
      · simp [localResidual,qx,qy] at heq
      · simp [localResidual,qx,qy] at heq
      · simp [qx,qy]
    exact radiusTwo_parity_proper F noFive q x.1 y.1 hx hy xy hparity
  · have hf : x.2 = y.2 := by
      have hm := congrArg (fun z : Fin t ⊕ Fin t => z.elim id id) heq
      by_cases qx : F.Adj q x.1 <;> by_cases qy : F.Adj q y.1 <;>
        simpa [localResidual,qx,qy] using hm
    exact hij hf

omit [Fintype C] [Fintype I] in
theorem residual_far_different (q : I) (j : Fin t ⊕ B)
    (x y : I × Fin t) (hy : ¬ inRadiusTwo F q y.1)
    (xy : (cliqueBlowup F).Adj x y) :
    pal.residual q (localResidual F q x) ≠ pal.finalLabel q j := by
  classical
  have hqx : ¬ F.Adj q x.1 := fun h => hy (odd_neighbor_radius F q x y h xy)
  simp only [localResidual,if_neg hqx]
  cases j with
  | inl l =>
    intro heq
    have := (pal.residual q).injective heq
    contradiction
  | inr b => exact pal.residual_ne_private q (.inl x.2) b

theorem generalEvaluation_basicEdge (noFive : NoClosedWalkFive F)
    {u v : GeneralGadgetVertex C I (Fin t) B} (edge : GeneralGadgetEdge pal u v)
    {x y : I × Fin t} (xy : (cliqueBlowup F).Adj x y) :
    generalEvaluation F pal u x ≠ generalEvaluation F pal v y := by
  classical
  cases edge with
  | anchor a v forbidden =>
    intro heq
    apply forbidden
    have ha := generalEvaluation_allowed F pal v y
    change a = generalEvaluation F pal v y at heq
    rw [heq]
    exact ha
  | centerBinary i b =>
    by_cases hy : y.1 = i ∨ F.Adj i y.1
    · simpa only [generalEvaluation,if_pos hy] using (pal.private_ne_center i b x.1).symm
    · simp only [generalEvaluation,if_neg hy]
      intro heq
      have hx : x.1 = i := pal.center.injective heq
      apply hy
      rcases xy with xy | ⟨hxy,_⟩
      · exact Or.inr (by simpa [hx] using xy)
      · exact Or.inl (hxy.symm.trans hx)
  | binaryFinal i b =>
    by_cases hx : x.1 = i ∨ F.Adj i x.1
    · have hy := closedOne_neighbor_radius F i x y hx xy
      simpa only [generalEvaluation,if_pos hx,if_pos hy] using
        (pal.residual_ne_private i (localResidual F i y) b).symm
    · simp only [generalEvaluation,if_neg hx]
      split
      · exact (pal.residual_ne_center i _).symm
      · exact (pal.private_ne_center i b i).symm
  | finalClique i j j' different =>
    by_cases hx : inRadiusTwo F i x.1 <;> by_cases hy : inRadiusTwo F i y.1
    · simp only [generalEvaluation,if_pos hx,if_pos hy]
      intro heq
      exact localResidual_proper F noFive i x y hx hy xy ((pal.residual i).injective heq)
    · simpa only [generalEvaluation,if_pos hx,if_neg hy] using
        residual_far_different F pal i j' x y hy xy
    · simpa only [generalEvaluation,if_neg hx,if_pos hy] using
        (residual_far_different F pal i j y x hx ((cliqueBlowup F).symm xy)).symm
    · simp only [generalEvaluation,if_neg hx,if_neg hy]
      intro heq
      exact different (pal.finalLabel_injective i heq)

noncomputable def generalProductColoring (noFive : NoClosedWalkFive F) :
    (categoricalProduct (cliqueBlowup F : SimpleGraph (I × Fin t))
      (generalGadgetGraph pal)).Coloring C :=
  SimpleGraph.Coloring.mk (fun v => generalEvaluation F pal v.2 v.1) (by
    intro u v edge
    rcases edge.2 with h | h
    · exact generalEvaluation_basicEdge F pal noFive h edge.1
    · exact Ne.symm (generalEvaluation_basicEdge F pal noFive h ((cliqueBlowup F).symm edge.1)))

end GeneralEvaluation

/-- Replace the center label by the single spare anchor 788. -/
def replaceCenter (i r : Fin 788) : Fin 1184 :=
  ⟨if r = i then 788 else r.val, by split <;> omega⟩

theorem replaceCenter_injective (i : Fin 788) : Function.Injective (replaceCenter i) := by
  intro r s h
  have hv := congrArg Fin.val h
  simp only [replaceCenter] at hv
  by_cases hr : r = i <;> by_cases hs : s = i
  · exact hr.trans hs.symm
  · simp only [if_pos hr,if_neg hs] at hv
    omega
  · simp only [if_neg hr,if_pos hs] at hv
    omega
  · apply Fin.ext
    simpa only [if_neg hr,if_neg hs] using hv

def smallPalette : GeneralPalette (Fin 1184) (Fin 788) (Fin 394) (Fin 394) (Fin 395) where
  center := ⟨fun i => ⟨i.val,by omega⟩, by
    intro i j h
    exact Fin.ext (congrArg (fun x : Fin 1184 => x.val) h)⟩
  residual := fun i => ⟨fun r => replaceCenter i (finSumFinEquiv r),
    fun _ _ h => finSumFinEquiv.injective (replaceCenter_injective i h)⟩
  privateLabel := fun _ => ⟨fun b => ⟨789+b.val,by omega⟩, by
    intro b d h
    apply Fin.ext
    have := congrArg Fin.val h
    change 789+b.val=789+d.val at this
    omega⟩
  residual_ne_center := by
    intro i r h
    have hv := congrArg Fin.val h
    change (if finSumFinEquiv r = i then 788 else (finSumFinEquiv r).val) = i.val at hv
    by_cases hr : finSumFinEquiv r = i
    · simp only [if_pos hr] at hv
      omega
    · simp only [if_neg hr] at hv
      exact hr (Fin.ext hv)
  private_ne_center := by
    intro i b j h
    have hv := congrArg Fin.val h
    change 789+b.val=j.val at hv
    omega
  residual_ne_private := by
    intro i r b h
    have hv := congrArg Fin.val h
    change (if finSumFinEquiv r = i then 788 else (finSumFinEquiv r).val) = 789+b.val at hv
    have hr := (finSumFinEquiv r).isLt
    split_ifs at hv <;> omega
  private_card := by simp

abbrev SmallHVertex := GeneralGadgetVertex (Fin 1184) (Fin 788) (Fin 394) (Fin 395)
def smallH : SimpleGraph SmallHVertex := generalGadgetGraph smallPalette

theorem smallH_card : Fintype.card SmallHVertex = 934177 := by
  rw [generalGadgetVertex_card]
  norm_num

theorem smallH_colorable : smallH.Colorable 1185 := by
  simpa [smallH] using general_gadget_colorable smallPalette

def smallGMap (x : Σ v : Fin 788, Fin (fiberSize v)) : Fin 788 × Fin 394 :=
  (x.1, Fin.castLE (fiberSize_le x.1) x.2)

theorem smallGMap_injective : Function.Injective smallGMap := by
  rintro ⟨u,i⟩ ⟨v,j⟩ h
  have huv : u = v := congrArg Prod.fst h
  subst v
  have hij : i = j := by
    apply Fin.ext
    exact congrArg (fun x : Fin 394 => x.val) (congrArg Prod.snd h)
  subst j
  rfl

theorem smallGMap_edge {x y : Σ v : Fin 788, Fin (fiberSize v)}
    (h : smallG.Adj x y) : (cliqueBlowup baseGraph).Adj (smallGMap x) (smallGMap y) := by
  rcases h with h | ⟨hbase,hne⟩
  · exact Or.inl h
  · refine Or.inr ⟨hbase,?_⟩
    intro hcolor
    apply hne
    apply smallGMap_injective
    exact Prod.ext hbase hcolor

noncomputable def smallProductColoring :
    (categoricalProduct smallG smallH).Coloring (Fin 1184) :=
  SimpleGraph.Coloring.mk (fun v => generalEvaluation baseGraph smallPalette v.2 (smallGMap v.1)) (by
    intro u v h
    rcases h.2 with hedge | hedge
    · exact generalEvaluation_basicEdge baseGraph smallPalette baseGraph_noClosedWalkFive
        hedge (smallGMap_edge h.1)
    · exact Ne.symm (generalEvaluation_basicEdge baseGraph smallPalette baseGraph_noClosedWalkFive
        hedge ((cliqueBlowup baseGraph).symm (smallGMap_edge h.1))))

theorem small_product_colorable : (categoricalProduct smallG smallH).Colorable 1184 := by
  simpa using smallProductColoring.colorable

end Hedetniemi.Round4
