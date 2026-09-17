import Hedetniemi.BinaryPVM
import Mathlib.Combinatorics.SimpleGraph.Coloring
import Mathlib.Analysis.CStarAlgebra.CStarMatrix

namespace Hedetniemi
open scoped BigOperators ComplexOrder

/-- Actual projection-valued graph coloring in a unital C*-algebra. -/
structure ProjectiveColoring {V : Type*} (G : SimpleGraph V)
    (C A : Type*) [Fintype C] [CStarAlgebra A] where
  P : V → C → A
  pvm : ∀ v, PVM (P v)
  edge : ∀ u v, G.Adj u v → ∀ a, P u a * P v a = 0

/-- The ordinary finite-dimensional quantum-colorability predicate.
CStarMatrix changes the norm/order, not the underlying complex matrices. -/
def QuantumColorable {V : Type*} (G : SimpleGraph V) (c : ℕ) : Prop :=
  ∃ d : ℕ, 0 < d ∧ Nonempty (ProjectiveColoring G (Fin c)
    (CStarMatrix (Fin d) (Fin d) ℂ))

/-- Relabeling colors does not change projective colorability. -/
noncomputable def ProjectiveColoring.relabel {V C D A : Type*}
    [Fintype C] [Fintype D] [CStarAlgebra A] {G : SimpleGraph V}
    (Q : ProjectiveColoring G C A) (e : D ≃ C) : ProjectiveColoring G D A where
  P v a := Q.P v (e a)
  pvm v := {
    sa := fun a => (Q.pvm v).sa (e a)
    idem := fun a => (Q.pvm v).idem (e a)
    orth := fun a b hab => (Q.pvm v).orth (e a) (e b) (fun h => hab (e.injective h))
    sum_eq_one := by rw [Equiv.sum_comp e]; exact (Q.pvm v).sum_eq_one }
  edge u v huv a := Q.edge u v huv (e a)

end Hedetniemi
