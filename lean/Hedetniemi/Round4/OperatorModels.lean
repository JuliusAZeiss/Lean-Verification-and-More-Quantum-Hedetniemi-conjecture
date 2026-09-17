import Hedetniemi.Round4.SupportedPSD
import Hedetniemi.OperatorBounds

namespace Hedetniemi
open scoped BigOperators ComplexOrder
noncomputable section

variable {V C A : Type*} [Fintype V] [Fintype C] [CStarAlgebra A]

/-- The variable-fiber supported PSD bound without a dimension or trace hypothesis. -/
theorem ProjectiveColoring.variable_fiber_supported_psd_bound
    [DecidableEq V] [Nonempty V] [Nontrivial A]
    (F : SimpleGraph V) (s : V → ℕ) (hs : ∀ v, 0 < s v)
    (Q : ProjectiveColoring (variableCliqueBlowup F s) C A)
    (M : Matrix V V ℝ) (hM : M.PosSemidef)
    (hsupport : ∀ u v, u ≠ v → ¬F.Adj u v → M u v = 0) :
    (∑ u : V, ∑ v : V, ((s u : ℝ) * (s v : ℝ)) * M u v) ≤
      (Fintype.card C : ℝ) * (∑ u : V, (s u : ℝ) * M u u) := by
  classical
  let v0 : V := Classical.arbitrary V
  letI : Nonempty (Σ v : V, Fin (s v)) := ⟨⟨v0, ⟨0,hs v0⟩⟩⟩
  let N : Matrix (Σ v : V, Fin (s v)) (Σ v : V, Fin (s v)) ℝ :=
    M.submatrix Sigma.fst Sigma.fst
  have hN : N.PosSemidef := hM.submatrix Sigma.fst
  have hsupportN : ∀ u v : (Σ v : V, Fin (s v)),
      u ≠ v → ¬(variableCliqueBlowup F s).Adj u v → N u v = 0 := by
    intro u v hne hnot
    apply hsupport
    · intro heq
      exact hnot (Or.inr ⟨heq,hne⟩)
    · intro hedge
      exact hnot (Or.inl hedge)
  have hbound := Q.supported_psd_bound N hN hsupportN
  simp only [N, Matrix.submatrix_apply, Fintype.sum_sigma, Finset.sum_const,
    Finset.card_univ, Fintype.card_fin, nsmul_eq_mul] at hbound
  simpa only [Finset.mul_sum, mul_assoc] using hbound

namespace Round4

/-- The tracial-state data used by the standard synchronous commuting model.
Faithfulness refers to positive squares; no finite dimension is assumed. -/
structure FaithfulTracialState (A : Type*) [CStarAlgebra A] where
  τ : A →ₗ[ℂ] ℂ
  normalized : τ 1 = 1
  positive : ∀ x, 0 ≤ τ (star x*x)
  cyclic : ∀ x y, τ (x*y) = τ (y*x)
  faithful : ∀ x, τ (star x*x) = 0 → x = 0

/-- In a faithful tracial realization, zero forbidden probability is an
operator zero product. This is the model bridge needed by the operator bounds. -/
theorem projection_product_zero_of_trace_zero (τ : FaithfulTracialState A)
    (p q : A) (hp : IsProjection p) (hq : IsProjection q)
    (hzero : τ.τ (p*q) = 0) : p*q = 0 := by
  apply τ.faithful
  have hsa : star (p*q)*(p*q) = q*p*q := by
    rw [star_mul, hp.1, hq.1]
    calc
      q*p*(p*q) = q*(p*p)*q := by noncomm_ring
      _ = q*p*q := by rw [hp.2]
  rw [hsa, τ.cyclic (q*p) q]
  have heq : q*(q*p) = q*p := by
    rw [← mul_assoc, hq.2]
  rw [heq, τ.cyclic q p]
  exact hzero

/-- A perfect synchronous tracial coloring gives the exact projection
relations, so dimension-free noncolorability also excludes this model. -/
def tracialProjectiveColoring {G : SimpleGraph V}
    (τ : FaithfulTracialState A) (P : V → C → A) (hP : ∀ v, PVM (P v))
    (hedge : ∀ u v, G.Adj u v → ∀ a, τ.τ (P u a*P v a) = 0) :
    ProjectiveColoring G C A where
  P := P
  pvm := hP
  edge u v huv a := projection_product_zero_of_trace_zero τ _ _
    ⟨(hP u).sa a, (hP u).idem a⟩ ⟨(hP v).sa a, (hP v).idem a⟩ (hedge u v huv a)

end Round4
#print axioms ProjectiveColoring.variable_fiber_supported_psd_bound
#print axioms Round4.projection_product_zero_of_trace_zero
#print axioms Round4.tracialProjectiveColoring
end
end Hedetniemi
