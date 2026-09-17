import Mathlib
import Hedetniemi.Model
import Hedetniemi.ModelBridge
import Hedetniemi.LocalColoring

/-! Weighted Hoffman inequalities from genuine C*-algebra projection families.
The only spectral input is an explicit positive-semidefinite matrix certificate.
-/

namespace Hedetniemi
open scoped BigOperators ComplexOrder
noncomputable section

variable {V C A : Type*} [Fintype V] [Fintype C] [CStarAlgebra A]

/-- Reflection of scalar positivity in any nonzero C*-algebra. -/
theorem real_scalar_nonneg [Nontrivial A] (r : ℝ)
    (h : letI := CStarAlgebra.spectralOrder A
         0 ≤ algebraMap ℝ A r) : 0 ≤ r := by
  letI : PartialOrder A := CStarAlgebra.spectralOrder A
  letI : StarOrderedRing A := CStarAlgebra.spectralOrderedRing A
  exact spectrum_nonneg_of_nonneg h (by simp)

/-- A finite Gram factor is an operator sum of squares. -/
theorem gram_sum_nonneg {I : Type*} [Fintype I]
    (R : I → V → ℝ) (P : V → A) (hsa : ∀ v, star (P v) = P v) :
    letI := CStarAlgebra.spectralOrder A
    0 ≤ ∑ u : V, ∑ v : V, (∑ i : I, R i u * R i v) • (P u * P v) := by
  letI : PartialOrder A := CStarAlgebra.spectralOrder A
  letI : StarOrderedRing A := CStarAlgebra.spectralOrderedRing A
  have h (i : I) : 0 ≤ star (∑ v : V, R i v • P v) * (∑ v : V, R i v • P v) :=
    star_mul_self_nonneg _
  have heq : (∑ u : V, ∑ v : V, (∑ i : I, R i u * R i v) • (P u * P v)) =
      ∑ i : I, star (∑ v : V, R i v • P v) * (∑ v : V, R i v • P v) := by
    simp only [star_sum, star_smul, star_trivial, hsa, Finset.sum_mul,
      Finset.mul_sum, smul_mul_assoc, mul_smul_comm, smul_smul, Finset.sum_smul,
      Finset.smul_sum]
    calc
      _ = ∑ u : V, ∑ i : I, ∑ v : V, (R i u * R i v) • (P u * P v) := by
        apply Finset.sum_congr rfl
        intro u hu
        rw [Finset.sum_comm]
      _ = ∑ i : I, ∑ u : V, ∑ v : V, (R i u * R i v) • (P u * P v) := by
        rw [Finset.sum_comm]
      _ = _ := by
        apply Finset.sum_congr rfl
        intro i hi
        rw [Finset.sum_comm]
        apply Finset.sum_congr rfl
        intro v hv
        apply Finset.sum_congr rfl
        intro u hu
        simp only [smul_smul, mul_comm (R i v) (R i u)]
  rw [heq]
  exact Finset.sum_nonneg (fun i _ => h i)

/-- Positive semidefiniteness of a real coefficient matrix implies positivity
of its quadratic form on self-adjoint elements of a C*-algebra. -/
theorem psd_sum_nonneg [DecidableEq V]
    (M : Matrix V V ℝ) (hM : M.PosSemidef)
    (P : V → A) (hsa : ∀ v, star (P v) = P v) :
    letI := CStarAlgebra.spectralOrder A
    0 ≤ ∑ u : V, ∑ v : V, M u v • (P u * P v) := by
  obtain ⟨R, hR⟩ := Matrix.posSemidef_iff_eq_transpose_mul_self.mp hM
  have heq (u v : V) : M u v = ∑ i : V, R i u * R i v := by
    rw [hR]
    simp [Matrix.mul_apply, Matrix.conjTranspose_apply]
  simp_rw [heq]
  exact gram_sum_nonneg R P hsa

/-- The operator variance identity used in the color-count Cauchy bound. -/
theorem variance_identity (X : C → A) (hsa : ∀ a, star (X a) = X a)
    (N : ℝ) (hsum : ∑ a : C, X a = N • (1 : A)) :
    (∑ a : C, star ((Fintype.card C : ℝ) • X a - N • (1 : A)) *
      ((Fintype.card C : ℝ) • X a - N • (1 : A))) =
    (Fintype.card C : ℝ)^2 • (∑ a : C, X a * X a) -
      ((Fintype.card C : ℝ) * N^2) • (1 : A) := by
  simp only [star_sub, star_smul, star_trivial, hsa, star_one, sub_mul, mul_sub,
    smul_mul_assoc, mul_smul_comm, smul_smul, one_mul, mul_one,
    Finset.sum_sub_distrib, ← Finset.smul_sum]
  rw [hsum]
  simp only [Finset.sum_const, Finset.card_univ, ← Nat.cast_smul_eq_nsmul ℝ, smul_smul]
  module

/-- Expansion of the weighted Hoffman quadratic form using the actual
idempotence, completeness, and supported-edge relations. -/
theorem weighted_energy_identity [DecidableEq V]
    (B : Matrix V V ℝ) (P : V → C → A)
    (hidem : ∀ v a, P v a * P v a = P v a)
    (hcomplete : ∀ v, ∑ a : C, P v a = 1)
    (hzero : ∀ u v a, B u v • (P u a * P v a) = 0)
    (L beta : ℝ) :
    (∑ a : C, ∑ u : V, ∑ v : V,
      (B u v + L * (if u = v then 1 else 0) - beta) • (P u a * P v a)) =
    (L * (Fintype.card V : ℝ)) • (1 : A) -
      beta • (∑ a : C, (∑ u : V, P u a) * (∑ v : V, P v a)) := by
  have hd : (∑ a : C, ∑ u : V, ∑ v : V,
      (L * (if u = v then 1 else 0)) • (P u a * P v a)) =
      (L * (Fintype.card V : ℝ)) • (1 : A) := by
    simp only [mul_ite, mul_one, mul_zero, ite_smul, zero_smul,
      Finset.sum_ite_eq, Finset.sum_ite_eq', Finset.mem_univ, if_true, hidem]
    rw [Finset.sum_comm]
    simp only [← Finset.smul_sum, hcomplete, Finset.sum_const, Finset.card_univ,
      ← Nat.cast_smul_eq_nsmul ℝ, smul_smul]
  have hm : (∑ a : C, ∑ u : V, ∑ v : V, beta • (P u a * P v a)) =
      beta • (∑ a : C, (∑ u : V, P u a) * (∑ v : V, P v a)) := by
    simp only [Finset.sum_mul, Finset.mul_sum, Finset.smul_sum]
    apply Finset.sum_congr rfl
    intro a ha
    rw [Finset.sum_comm]
  simp only [sub_smul, add_smul, Finset.sum_sub_distrib,
    Finset.sum_add_distrib, hzero, Finset.sum_const_zero, zero_add]
  rw [hd, hm]

/-- Weighted Hoffman bound for actual projections in an arbitrary nonzero
unital C*-algebra. The PSD matrix certificate is the explicit external spectral
interface; no claim about eigenvalues is smuggled into the coloring assumptions. -/
theorem cstar_weighted_hoffman [DecidableEq V] [Nonempty V] [Nonempty C]
    [Nontrivial A] (B : Matrix V V ℝ) (P : V → C → A)
    (hsa : ∀ v a, star (P v a) = P v a)
    (hidem : ∀ v a, P v a * P v a = P v a)
    (hcomplete : ∀ v, ∑ a : C, P v a = 1)
    (hzero : ∀ u v a, B u v • (P u a * P v a) = 0)
    (D L : ℝ) (hD : 0 ≤ D) (hL : 0 < L)
    (hPSD : Matrix.PosSemidef (fun u v => B u v + L * (if u = v then 1 else 0) -
      (D + L) / (Fintype.card V : ℝ))) :
    D + L ≤ L * (Fintype.card C : ℝ) := by
  letI : PartialOrder A := CStarAlgebra.spectralOrder A
  letI : StarOrderedRing A := CStarAlgebra.spectralOrderedRing A
  let N : ℝ := Fintype.card V
  let c : ℝ := Fintype.card C
  let beta : ℝ := (D + L) / N
  let X : C → A := fun a => ∑ v : V, P v a
  let T : A := ∑ a : C, X a * X a
  have hN : 0 < N := by dsimp [N]; exact_mod_cast Fintype.card_pos
  have hc : 0 < c := by dsimp [c]; exact_mod_cast Fintype.card_pos
  have hbeta : 0 ≤ beta := div_nonneg (by linarith) hN.le
  have hXsa (a : C) : star (X a) = X a := by simp [X, star_sum, hsa]
  have hXsum : ∑ a : C, X a = N • (1 : A) := by
    simp only [X]
    rw [Finset.sum_comm]
    simp only [hcomplete, Finset.sum_const, Finset.card_univ,
      ← Nat.cast_smul_eq_nsmul ℝ, N]
  have hvar : 0 ≤ c^2 • T - (c * N^2) • (1 : A) := by
    change 0 ≤ (Fintype.card C : ℝ)^2 • (∑ a : C, X a * X a) -
      ((Fintype.card C : ℝ) * N^2) • (1 : A)
    rw [← variance_identity X hXsa N hXsum]
    exact Finset.sum_nonneg (fun a _ => star_mul_self_nonneg _)
  have henergy : 0 ≤ (L * N) • (1 : A) - beta • T := by
    have hp : 0 ≤ ∑ a : C, ∑ u : V, ∑ v : V,
        (B u v + L * (if u = v then 1 else 0) - beta) • (P u a * P v a) := by
      apply Finset.sum_nonneg
      intro a ha
      exact psd_sum_nonneg _ hPSD (fun v => P v a) (fun v => hsa v a)
    rw [weighted_energy_identity B P hidem hcomplete hzero L beta] at hp
    exact hp
  have hsum := add_nonneg (smul_nonneg hbeta hvar)
    (smul_nonneg (sq_nonneg c) henergy)
  have hscalar : -(beta * (c * N^2)) + c^2 * (L * N) =
      c * N * (c * L - (D + L)) := by
    dsimp [beta]
    field_simp
    ring
  have heq : beta • (c^2 • T - (c * N^2) • (1 : A)) +
      c^2 • ((L * N) • (1 : A) - beta • T) =
      (c * N * (c * L - (D + L))) • (1 : A) := by
    calc
      _ = (-(beta * (c * N^2)) + c^2 * (L * N)) • (1 : A) := by module
      _ = _ := by rw [hscalar]
  rw [heq] at hsum
  have hr : 0 ≤ c * N * (c * L - (D + L)) :=
    real_scalar_nonneg _ (by simpa only [Algebra.algebraMap_eq_smul_one] using hsum)
  have hlast : 0 ≤ c * L - (D + L) :=
    nonneg_of_mul_nonneg_right hr (mul_pos hc hN)
  dsimp [c] at hlast
  linarith

/-- A weighted adjacency matrix for the clique blowup. Within each fiber the
weight is L; between fibers the weights are inherited from B. -/
def weightedBlowup {T : Type*} [DecidableEq V] [DecidableEq T]
    (B : Matrix V V ℝ) (L : ℝ) : Matrix (V × T) (V × T) ℝ :=
  fun u v => B u.1 v.1 + L * (if u.1 = v.1 then 1 else 0) -
    L * (if u = v then 1 else 0)

/-- The complete weighted-blowup spectral certificate follows from the base
certificate, by pulling back a PSD matrix along the first-coordinate map. -/
theorem weightedBlowup_certificate {T : Type*} [Fintype T]
    [DecidableEq V] [DecidableEq T] [Nonempty V] [Nonempty T]
    (B : Matrix V V ℝ) (D L : ℝ)
    (hPSD : Matrix.PosSemidef (fun u v => B u v + L * (if u = v then 1 else 0) -
      (D + L) / (Fintype.card V : ℝ))) :
    Matrix.PosSemidef (fun u v => weightedBlowup (T := T) B L u v +
      L * (if u = v then 1 else 0) -
      (((Fintype.card T : ℝ) * (D + L) - L) + L) /
        (Fintype.card (V × T) : ℝ)) := by
  have hN : (Fintype.card V : ℝ) ≠ 0 := by
    exact_mod_cast (Fintype.card_ne_zero : Fintype.card V ≠ 0)
  have ht : (Fintype.card T : ℝ) ≠ 0 := by
    exact_mod_cast (Fintype.card_ne_zero : Fintype.card T ≠ 0)
  convert hPSD.submatrix (fun x : V × T => x.1) using 1
  ext u v
  simp only [weightedBlowup, Matrix.submatrix_apply, Fintype.card_prod, Nat.cast_mul]
  field_simp
  ring

/-- A directly usable lower bound for the weighted clique blowup. -/
theorem cstar_weighted_blowup_bound {T : Type*} [Fintype T]
    [DecidableEq V] [DecidableEq T] [Nonempty V] [Nonempty T] [Nonempty C]
    [Nontrivial A] (B : Matrix V V ℝ) (P : (V × T) → C → A)
    (hsa : ∀ v a, star (P v a) = P v a)
    (hidem : ∀ v a, P v a * P v a = P v a)
    (hcomplete : ∀ v, ∑ a : C, P v a = 1)
    (D L : ℝ) (hD : 0 ≤ D) (hL : 0 < L)
    (hzero : ∀ u v a, weightedBlowup B L u v • (P u a * P v a) = 0)
    (hPSD : Matrix.PosSemidef (fun u v => B u v + L * (if u = v then 1 else 0) -
      (D + L) / (Fintype.card V : ℝ))) :
    (Fintype.card T : ℝ) * (D + L) ≤ L * (Fintype.card C : ℝ) := by
  have ht : (1 : ℝ) ≤ Fintype.card T := by
    exact_mod_cast Fintype.card_pos
  have hdegree : 0 ≤ (Fintype.card T : ℝ) * (D + L) - L := by
    have : 0 ≤ (Fintype.card T : ℝ) * D := mul_nonneg (by positivity) hD
    nlinarith
  have h := cstar_weighted_hoffman (weightedBlowup B L) P hsa hidem hcomplete hzero
    ((Fintype.card T : ℝ) * (D + L) - L) L hdegree hL
    (weightedBlowup_certificate B D L hPSD)
  linarith

omit [Fintype V] in
/-- A nonempty graph cannot have a zero-outcome PVM in a nonzero algebra. -/
theorem ProjectiveColoring.nonempty_colors [Nonempty V] [Nontrivial A]
    {G : SimpleGraph V} (Q : ProjectiveColoring G C A) : Nonempty C := by
  classical
  by_contra h
  letI : IsEmpty C := not_nonempty_iff.mp h
  have hc := (Q.pvm (Classical.arbitrary V)).sum_eq_one
  simp at hc

/-- Graph-theoretic wrapper: every projective coloring of the actual clique
blowup satisfies the weighted spectral bound. -/
theorem ProjectiveColoring.cliqueBlowup_bound {T : Type*} [Fintype T]
    [DecidableEq V] [DecidableEq T] [Nonempty V] [Nonempty T]
    [Nontrivial A] (F : SimpleGraph V) [DecidableRel F.Adj]
    (Q : ProjectiveColoring (cliqueBlowup (I := T) F) C A)
    (D L : ℝ) (hD : 0 ≤ D) (hL : 0 < L)
    (hPSD : Matrix.PosSemidef (fun u v => F.adjMatrix ℝ u v +
      L * (if u = v then 1 else 0) - (D + L) / (Fintype.card V : ℝ))) :
    (Fintype.card T : ℝ) * (D + L) ≤ L * (Fintype.card C : ℝ) := by
  letI : Nonempty C := Q.nonempty_colors
  apply cstar_weighted_blowup_bound (F.adjMatrix ℝ) Q.P
    (fun v a => (Q.pvm v).sa a) (fun v a => (Q.pvm v).idem a)
    (fun v => (Q.pvm v).sum_eq_one) D L hD hL ?_ hPSD
  intro u v a
  by_cases h : (cliqueBlowup (I := T) F).Adj u v
  · rw [Q.edge u v h a, smul_zero]
  · have hbase : ¬ F.Adj u.1 v.1 := fun hbase => h (Or.inl hbase)
    by_cases huv : u = v
    · subst v
      simp [weightedBlowup, SimpleGraph.adjMatrix]
    · have hfirst : u.1 ≠ v.1 := by
        intro heq
        apply h
        right
        exact ⟨heq, fun hsecond => huv (Prod.ext heq hsecond)⟩
      simp [weightedBlowup, SimpleGraph.adjMatrix, hbase, huv, hfirst]

/-- The same certified bound for the genuine finite-dimensional quantum
colorability predicate, with no assumed spectral-to-coloring implication. -/
theorem quantum_cliqueBlowup_bound {T : Type*} [Fintype T]
    [DecidableEq V] [DecidableEq T] [Nonempty V] [Nonempty T]
    (F : SimpleGraph V) [DecidableRel F.Adj] {r : ℕ}
    (hcolor : QuantumColorable (cliqueBlowup (I := T) F) r)
    (D L : ℝ) (hD : 0 ≤ D) (hL : 0 < L)
    (hPSD : Matrix.PosSemidef (fun u v => F.adjMatrix ℝ u v +
      L * (if u = v then 1 else 0) - (D + L) / (Fintype.card V : ℝ))) :
    (Fintype.card T : ℝ) * (D + L) ≤ L * (r : ℝ) := by
  obtain ⟨d, hd, ⟨Q⟩⟩ := hcolor
  letI : Nonempty (Fin d) := ⟨⟨0, hd⟩⟩
  letI := complexMatrix_nontrivial hd
  simpa only [Fintype.card_fin] using Q.cliqueBlowup_bound F D L hD hL hPSD

/-- Strict separation immediately rules out a quantum coloring. -/
theorem not_quantumColorable_cliqueBlowup {T : Type*} [Fintype T]
    [DecidableEq V] [DecidableEq T] [Nonempty V] [Nonempty T]
    (F : SimpleGraph V) [DecidableRel F.Adj] (r : ℕ)
    (D L : ℝ) (hD : 0 ≤ D) (hL : 0 < L)
    (hPSD : Matrix.PosSemidef (fun u v => F.adjMatrix ℝ u v +
      L * (if u = v then 1 else 0) - (D + L) / (Fintype.card V : ℝ)))
    (hgap : L * (r : ℝ) < (Fintype.card T : ℝ) * (D + L)) :
    ¬ QuantumColorable (cliqueBlowup (I := T) F) r := by
  intro hcolor
  exact (not_le_of_gt hgap) (quantum_cliqueBlowup_bound F hcolor D L hD hL hPSD)

end
end Hedetniemi
