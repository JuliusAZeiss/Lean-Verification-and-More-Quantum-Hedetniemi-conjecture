import Hedetniemi.Model
import Hedetniemi.LocalColoring

namespace Hedetniemi

open scoped BigOperators ComplexOrder

variable {V C A : Type*} [Fintype C] [CStarAlgebra A] {G : SimpleGraph V}

/-- An ordinary proper coloring gives actual zero/one projection measurements. -/
noncomputable def projectiveColoringOfColoring (f : G.Coloring C) (A : Type*)
    [CStarAlgebra A] : ProjectiveColoring G C A := by
  classical
  exact {
    P := fun v a => if f v = a then 1 else 0
    pvm := fun v => {
      sa := fun a => by split_ifs <;> simp
      idem := fun a => by split_ifs <;> simp
      orth := fun a b hab => by
        by_cases ha : f v = a <;> by_cases hb : f v = b <;> simp_all
      sum_eq_one := by simp }
    edge := fun u v huv a => by
      have hne := f.valid huv
      by_cases hu : f u = a <;> by_cases hv : f v = a <;> simp_all }

/-- Positive-dimensional complex matrix algebras are nonzero. -/
theorem complexMatrix_nontrivial {d : ℕ} (hd : 0 < d) :
    Nontrivial (CStarMatrix (Fin d) (Fin d) ℂ) := by
  letI : Nonempty (Fin d) := ⟨⟨0, hd⟩⟩
  infer_instance

/-- A proper c-coloring is a genuine finite-dimensional quantum c-coloring. -/
theorem colorable_quantumColorable {c : ℕ} (h : G.Colorable c) : QuantumColorable G c := by
  rcases h with ⟨f⟩
  exact ⟨1, by decide, ⟨projectiveColoringOfColoring f
    (CStarMatrix (Fin 1) (Fin 1) ℂ)⟩⟩

/-- The manuscript's two palettes have exactly 2n labels, with an explicit equivalence. -/
def gadgetColorEquivFin (n : ℕ) : GadgetColor n ≃ Fin (2*n) := by
  simpa [GadgetColor, two_mul] using
    (finSumFinEquiv : Fin n ⊕ Fin n ≃ Fin (n+n))

/-- Projective colorings can be expressed with either version of the gadget palette. -/
theorem projective_gadgetColor_iff (n : ℕ) :
    Nonempty (ProjectiveColoring G (GadgetColor n) A) ↔
      Nonempty (ProjectiveColoring G (Fin (2*n)) A) := by
  constructor
  · rintro ⟨Q⟩
    exact ⟨Q.relabel (gadgetColorEquivFin n).symm⟩
  · rintro ⟨Q⟩
    exact ⟨Q.relabel (gadgetColorEquivFin n)⟩

/-- The proved local classical product coloring also supplies an actual quantum upper bound. -/
theorem local_product_quantumColorable {n : ℕ} (f : V → Fin n)
    (φ : (q : Fin n) → {x // fiberN2 G f q x} → {a : Fin n // a ≠ q})
    (proper : ∀ (q : Fin n) (x y : {x // fiberN2 G f q x}),
      G.Adj x.1 y.1 → (φ q x).1 ≠ (φ q y).1) :
    QuantumColorable (categoricalProduct G (gadgetGraph n)) (2*n) :=
  colorable_quantumColorable (local_product_colorable G f φ proper)

end Hedetniemi
