import Mathlib.Data.Int.Basic
import Mathlib.Algebra.BigOperators.Group.List.Basic
namespace Hedetniemi.Round4
inductive FactorListTree where
  | leaf : List Int → FactorListTree
  | branch : FactorListTree → FactorListTree → FactorListTree
def FactorListTree.get : FactorListTree → Nat → List Int
  | .leaf v, _ => v
  | .branch l r, i => if i % 2 = 0 then l.get (i/2) else r.get (i/2)
end Hedetniemi.Round4
