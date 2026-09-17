import Hedetniemi.Round4.DiagonalDominance

namespace Hedetniemi.Round4
open scoped BigOperators Matrix

def listIntDotAcc : List Int → List Int → Int → Int
  | [], _, acc => acc
  | _, [], acc => acc
  | x::xs, y::ys, acc => listIntDotAcc xs ys (Int.add acc (Int.mul x y))

theorem listIntDotAcc_eq_zip (xs ys : List Int) (acc : Int) :
    listIntDotAcc xs ys acc = acc + (xs.zipWith (fun x y => x*y) ys).sum := by
  induction xs generalizing ys acc with
  | nil => simp [listIntDotAcc]
  | cons x xs ih =>
    cases ys with
    | nil => simp [listIntDotAcc]
    | cons y ys =>
      simpa only [listIntDotAcc, List.zipWith_cons_cons, List.sum_cons, add_assoc] using
        ih ys (acc+x*y)

def listIntDot (xs ys : List Int) : Int := listIntDotAcc xs ys 0

theorem listIntDot_eq_zip (xs ys : List Int) :
    listIntDot xs ys = (xs.zipWith (fun x y => x*y) ys).sum := by
  simp only [listIntDot, listIntDotAcc_eq_zip, zero_add]

/-- A zip product of possibly different length rows is exactly the finite Gram
product of their zero extensions. -/
theorem list_zip_mul_sum_eq_fin_sum (n : Nat) (xs ys : List Int)
    (hx : xs.length ≤ n) (hy : ys.length ≤ n) :
    (List.zipWith (fun x y => x*y) xs ys).sum =
      ∑ k : Fin n, xs.getD k.val 0 * ys.getD k.val 0 := by
  induction n generalizing xs ys with
  | zero =>
      have hx' : xs = [] := List.length_eq_zero_iff.mp (by omega)
      have hy' : ys = [] := List.length_eq_zero_iff.mp (by omega)
      subst xs; subst ys
      simp
  | succ n ih =>
      cases xs with
      | nil => simp
      | cons x xs =>
        cases ys with
        | nil => simp
        | cons y ys =>
          have hx' : xs.length ≤ n := by simpa using hx
          have hy' : ys.length ≤ n := by simpa using hy
          rw [Fin.sum_univ_succ]
          simpa [List.zipWith, List.getD] using congrArg (fun z : Int => x*y+z)
            (ih xs ys hx' hy')

theorem abs_row_bound_offdiag {I : Type*} [Fintype I] [DecidableEq I]
    (R : Matrix I I Int) (i : I) (hd : 0 ≤ R i i)
    (ht : (∑ j : I, |R i j|) ≤ 2 * R i i) :
    (∑ j : I, if i=j then 0 else |R i j|) ≤ R i i := by
  have heq : (∑ j : I, |R i j|) =
      R i i + ∑ j : I, if i=j then 0 else |R i j| := by
    calc
      _ = ∑ j : I, ((if i=j then R i i else 0) +
          (if i=j then 0 else |R i j|)) := by
        apply Finset.sum_congr rfl
        intro j _
        by_cases h : i=j
        · subst j; simp [abs_of_nonneg hd]
        · simp [h]
      _ = _ := by simp [Finset.sum_add_distrib]
  rw [heq] at ht
  linarith

/-- Integer row lists and a diagonally dominant exact residual suffice for
positivity. The list lengths may vary, and are bounded by the Gram dimension. -/
theorem list_gram_residual_posSemidef {n : Nat} (m : Nat)
    (B : Matrix (Fin n) (Fin n) Int) (rows : Fin n → List Int)
    (s : Nat) (hs : 0 < s)
    (hlen : ∀ i, (rows i).length ≤ m)
    (hB : ∀ i j, B i j = B j i)
    (hdom : ∀ i, (∑ j : Fin n, if i=j then 0 else
        |(s : Int)^2 * B i j - (List.zipWith (fun x y => x*y) (rows i) (rows j)).sum|) ≤
      (s : Int)^2 * B i i - (List.zipWith (fun x y => x*y) (rows i) (rows i)).sum) :
    Matrix.PosSemidef (fun i j => (B i j : ℝ)) := by
  apply gram_residual_posSemidef _
    (fun (i : Fin n) (k : Fin m) => (rows i |>.getD k.val 0 : ℝ))
    (s : ℝ) (by exact_mod_cast hs)
  · intro i j
    rw [hB]
  · intro i
    have hd := hdom i
    have he (i j : Fin n) :=
      list_zip_mul_sum_eq_fin_sum m (rows i) (rows j) (hlen i) (hlen j)
    simp_rw [he] at hd
    exact_mod_cast hd

end Hedetniemi.Round4
