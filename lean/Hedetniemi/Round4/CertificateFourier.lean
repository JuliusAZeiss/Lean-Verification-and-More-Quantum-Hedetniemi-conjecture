import Mathlib

namespace Hedetniemi.Round4
open scoped BigOperators Matrix
noncomputable section

/-- The four real characters of the two-bit translation group. -/
def walshSign (a h : Fin 4) : ℝ :=
  ![![1,1,1,1], ![1,-1,1,-1], ![1,1,-1,-1], ![1,-1,-1,1]] a h

def walshInt (a h : Fin 4) : ℤ :=
  ![![1,1,1,1], ![1,-1,1,-1], ![1,1,-1,-1], ![1,-1,-1,1]] a h

theorem walshInt_cast (a h : Fin 4) : (walshInt a h : ℝ) = walshSign a h := by
  fin_cases a <;> fin_cases h <;> norm_num [walshInt, walshSign]

#check walshInt_cast

theorem walsh_four_reconstruction (K : Nat → ℤ) (h l : Fin 4) :
    4 * K (Nat.xor h.val l.val) =
      ∑ a : Fin 4, walshInt a h *
        (∑ s : Fin 4, walshInt a s * K s.val) * walshInt a l := by
  fin_cases h <;> fin_cases l <;>
    norm_num [walshInt, Fin.sum_univ_succ] <;> ring

#check walsh_four_reconstruction

/-- A scalar diagonal congruence of any pullback of a PSD matrix is PSD. -/
theorem signed_pullback_posSemidef {I V : Type*} [Fintype I] [Fintype V]
    [DecidableEq V] (B : Matrix I I ℝ) (hB : B.PosSemidef)
    (index : V → I) (w : V → ℝ) :
    Matrix.PosSemidef (fun u v => w u * B (index u) (index v) * w v) := by
  have hp := (hB.submatrix index).conjTranspose_mul_mul_same (Matrix.diagonal w)
  convert hp using 1
  ext u v
  simp [Matrix.mul_apply, Matrix.conjTranspose_apply, Matrix.diagonal_apply,
    Matrix.submatrix_apply]

/-- Entrywise four-character reconstruction suffices for positivity. This lemma
does not assume anything about the source of the four blocks. -/
theorem four_block_posSemidef {I V : Type*} [Fintype I] [Fintype V]
    [DecidableEq V] (M : Matrix V V ℝ) (B : Fin 4 → Matrix I I ℝ)
    (index : V → I) (bit : V → Fin 4)
    (hB : ∀ a, (B a).PosSemidef)
    (hrec : ∀ u v, 4 * M u v = ∑ a : Fin 4,
      walshSign a (bit u) * B a (index u) (index v) * walshSign a (bit v)) :
    M.PosSemidef := by
  let T : Fin 4 → Matrix V V ℝ := fun a u v =>
    walshSign a (bit u) * B a (index u) (index v) * walshSign a (bit v)
  have hT (a : Fin 4) : (T a).PosSemidef :=
    signed_pullback_posSemidef (B a) (hB a) index (fun v => walshSign a (bit v))
  have hp := ((hT 0).add (hT 1)).add ((hT 2).add (hT 3))
  have heq : (T 0 + T 1) + (T 2 + T 3) = (4 : ℝ) • M := by
    ext u v
    have hr := hrec u v
    simp only [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ,
      Matrix.add_apply, Matrix.smul_apply, smul_eq_mul] at hr ⊢
    simpa [T, add_assoc] using hr.symm
  rw [heq] at hp
  refine ⟨?_, ?_⟩
  · ext u v
    have hs := congrFun (congrFun hp.1 u) v
    simp only [Matrix.conjTranspose_apply, star_trivial, Matrix.smul_apply,
      smul_eq_mul] at hs ⊢
    linarith
  · intro x
    have hx := hp.2 x
    have he : dotProduct (star x) (((4 : ℝ) • M) *ᵥ x) =
        4 * dotProduct (star x) (M *ᵥ x) := by
      simp only [dotProduct, Matrix.mulVec, Matrix.smul_apply, smul_eq_mul,
        Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro i _
      apply Finset.sum_congr rfl
      intro j _
      ring
    rw [he] at hx
    linarith

end
end Hedetniemi.Round4
