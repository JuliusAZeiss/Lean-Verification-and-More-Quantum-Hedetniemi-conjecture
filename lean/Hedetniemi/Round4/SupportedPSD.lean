import Hedetniemi.Spectral

/-! A general supported-PSD quantum coloring bound.
This file is a separate addition, not part of the older closed-instance audit.
-/

namespace Hedetniemi
open scoped BigOperators ComplexOrder
noncomputable section

variable {V C A : Type*} [Fintype V] [Fintype C] [CStarAlgebra A]

omit [Fintype V] in
theorem supported_psd_centered_pair
    (P : V → C → A) (hcomplete : ∀ v, ∑ a : C, P v a = 1)
    (u v : V) :
    (∑ a : C, ((Fintype.card C : ℝ) • P u a - 1) *
      ((Fintype.card C : ℝ) • P v a - 1)) =
      (Fintype.card C : ℝ)^2 • (∑ a : C, P u a * P v a) -
        (Fintype.card C : ℝ) • (1 : A) := by
  simp only [sub_mul, mul_sub, smul_mul_assoc, mul_smul_comm, smul_smul,
    one_mul, mul_one, Finset.sum_sub_distrib, ← Finset.smul_sum,
    hcomplete, Finset.sum_const, Finset.card_univ, ← Nat.cast_smul_eq_nsmul ℝ]
  module

theorem supported_psd_energy [DecidableEq V]
    (M : Matrix V V ℝ) (P : V → C → A)
    (hidem : ∀ v a, P v a * P v a = P v a)
    (hcomplete : ∀ v, ∑ a : C, P v a = 1)
    (hzero : ∀ u v, u ≠ v → ∀ a, M u v • (P u a * P v a) = 0) :
    (∑ u : V, ∑ v : V, M u v • (∑ a : C, P u a * P v a)) =
      (∑ u : V, M u u) • (1 : A) := by
  have hrow (u : V) :
      (∑ v : V, M u v • (∑ a : C, P u a * P v a)) = M u u • (1 : A) := by
    rw [Finset.sum_eq_single u]
    · simp only [hidem, hcomplete]
    · intro v hv hvu
      simp only [Finset.smul_sum, hzero u v (Ne.symm hvu), Finset.sum_const_zero]
    · simp
  simp only [hrow, Finset.sum_smul]

/-- Every real PSD matrix supported on the diagonal and colored edges bounds
the color count, in any nonzero unital C*-algebra. -/
theorem cstar_supported_psd_bound [DecidableEq V] [Nonempty C] [Nontrivial A]
    (M : Matrix V V ℝ) (hM : M.PosSemidef) (P : V → C → A)
    (hsa : ∀ v a, star (P v a) = P v a)
    (hidem : ∀ v a, P v a * P v a = P v a)
    (hcomplete : ∀ v, ∑ a : C, P v a = 1)
    (hzero : ∀ u v, u ≠ v → ∀ a, M u v • (P u a * P v a) = 0) :
    (∑ u : V, ∑ v : V, M u v) ≤
      (Fintype.card C : ℝ) * (∑ u : V, M u u) := by
  letI : PartialOrder A := CStarAlgebra.spectralOrder A
  letI : StarOrderedRing A := CStarAlgebra.spectralOrderedRing A
  let c : ℝ := Fintype.card C
  have hc : 0 < c := by dsimp [c]; exact_mod_cast Fintype.card_pos
  let Q : V → C → A := fun v a => c • P v a - 1
  have hQsa (v : V) (a : C) : star (Q v a) = Q v a := by
    simp [Q, star_sub, star_smul, hsa]
  have hp : 0 ≤ ∑ a : C, ∑ u : V, ∑ v : V, M u v • (Q u a * Q v a) := by
    apply Finset.sum_nonneg
    intro a ha
    exact psd_sum_nonneg M hM (fun v => Q v a) (fun v => hQsa v a)
  have hreorder :
      (∑ a : C, ∑ u : V, ∑ v : V, M u v • (Q u a * Q v a)) =
        ∑ u : V, ∑ v : V, M u v • (∑ a : C, Q u a * Q v a) := by
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro u hu
    rw [Finset.sum_comm]
    simp only [Finset.smul_sum]
  have hpair (u v : V) : (∑ a : C, Q u a * Q v a) =
      c^2 • (∑ a : C, P u a * P v a) - c • (1 : A) :=
    supported_psd_centered_pair P hcomplete u v
  have heq :
      (∑ a : C, ∑ u : V, ∑ v : V, M u v • (Q u a * Q v a)) =
        (c * (c * (∑ u : V, M u u) - (∑ u : V, ∑ v : V, M u v))) • (1 : A) := by
    rw [hreorder]
    simp_rw [hpair, smul_sub, smul_comm (M _ _) (c^2), smul_comm (M _ _) c]
    simp only [Finset.sum_sub_distrib, ← Finset.smul_sum]
    rw [supported_psd_energy M P hidem hcomplete hzero]
    simp only [← Finset.sum_smul, smul_smul]
    module
  rw [heq] at hp
  have hs : 0 ≤ c * (c * (∑ u : V, M u u) - (∑ u : V, ∑ v : V, M u v)) :=
    real_scalar_nonneg _ (by simpa only [Algebra.algebraMap_eq_smul_one] using hp)
  have hlast := nonneg_of_mul_nonneg_right hs hc
  dsimp [c] at hlast
  linarith

/-- Graph-level interface: nonzero off-diagonal coefficients must be edges. -/
theorem ProjectiveColoring.supported_psd_bound [DecidableEq V]
    [Nonempty V] [Nontrivial A] {G : SimpleGraph V}
    (Q : ProjectiveColoring G C A) (M : Matrix V V ℝ) (hM : M.PosSemidef)
    (hsupport : ∀ u v, u ≠ v → ¬G.Adj u v → M u v = 0) :
    (∑ u : V, ∑ v : V, M u v) ≤
      (Fintype.card C : ℝ) * (∑ u : V, M u u) := by
  letI : Nonempty C := Q.nonempty_colors
  apply cstar_supported_psd_bound M hM Q.P
    (fun v a => (Q.pvm v).sa a) (fun v a => (Q.pvm v).idem a)
    (fun v => (Q.pvm v).sum_eq_one)
  intro u v huv a
  by_cases hedge : G.Adj u v
  · rw [Q.edge u v hedge a, smul_zero]
  · rw [hsupport u v huv hedge, zero_smul]

/-- The standard finite-dimensional quantum coloring predicate inherits the bound. -/
theorem quantum_supported_psd_bound [DecidableEq V] [Nonempty V]
    (G : SimpleGraph V) {r : ℕ} (hcolor : QuantumColorable G r)
    (M : Matrix V V ℝ) (hM : M.PosSemidef)
    (hsupport : ∀ u v, u ≠ v → ¬G.Adj u v → M u v = 0) :
    (∑ u : V, ∑ v : V, M u v) ≤ (r : ℝ) * (∑ u : V, M u u) := by
  obtain ⟨d, hd, ⟨Q⟩⟩ := hcolor
  letI := complexMatrix_nontrivial hd
  simpa only [Fintype.card_fin] using Q.supported_psd_bound M hM hsupport

/-- Replace each base vertex by a clique of its own specified size. -/
def variableCliqueBlowup (F : SimpleGraph V) (s : V → ℕ) :
    SimpleGraph (Σ v : V, Fin (s v)) where
  Adj u v := F.Adj u.1 v.1 ∨ (u.1 = v.1 ∧ u ≠ v)
  symm := by
    intro u v h
    rcases h with h | ⟨heq,hne⟩
    · exact Or.inl (F.symm h)
    · exact Or.inr ⟨heq.symm,hne.symm⟩
  loopless := by
    intro u h
    rcases h with h | ⟨_,hne⟩
    · exact F.loopless u.1 h
    · exact hne rfl

/-- Exact weighted inequality for unequal clique fibers, with the PSD lift
proved by a matrix submatrix (incidence congruence). -/
theorem quantum_variable_fiber_supported_psd_bound [DecidableEq V] [Nonempty V]
    (F : SimpleGraph V) (s : V → ℕ) (hs : ∀ v, 0 < s v)
    {r : ℕ} (hcolor : QuantumColorable (variableCliqueBlowup F s) r)
    (M : Matrix V V ℝ) (hM : M.PosSemidef)
    (hsupport : ∀ u v, u ≠ v → ¬F.Adj u v → M u v = 0) :
    (∑ u : V, ∑ v : V, ((s u : ℝ) * (s v : ℝ)) * M u v) ≤
      (r : ℝ) * (∑ u : V, (s u : ℝ) * M u u) := by
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
  have hbound := quantum_supported_psd_bound (variableCliqueBlowup F s)
    hcolor N hN hsupportN
  simp only [N, Matrix.submatrix_apply, Fintype.sum_sigma, Finset.sum_const,
    Finset.card_univ, Fintype.card_fin, nsmul_eq_mul] at hbound
  simpa only [Finset.mul_sum, mul_assoc] using hbound

#print axioms cstar_supported_psd_bound
#print axioms ProjectiveColoring.supported_psd_bound
#print axioms quantum_supported_psd_bound
#print axioms quantum_variable_fiber_supported_psd_bound

end
end Hedetniemi
