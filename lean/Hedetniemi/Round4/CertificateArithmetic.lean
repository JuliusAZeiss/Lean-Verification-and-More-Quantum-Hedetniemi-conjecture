import Hedetniemi.Round4.CertificateData
import Hedetniemi.Round4.CertificateFourier
import Hedetniemi.Round4.DiagonalDominance

namespace Hedetniemi.Round4
open scoped BigOperators Matrix

theorem list_range_sum_eq_fin_sum {A : Type*} [AddCommMonoid A]
    (n : Nat) (f : Nat → A) :
    ((List.range n).map f).sum = ∑ i : Fin n, f i.val := by
  rw [Fin.sum_univ_eq_sum_range]
  have he : (List.range n).toFinset = Finset.range n := by
    ext i
    simp
  simpa only [he] using (List.sum_toFinset f (List.nodup_range (n := n))).symm

theorem residualEntryN_eq (a : Fin 4) (i j : Fin 197) :
    residualEntryN a.val i.val j.val =
      1000000000000 * blockEntry a i j -
        ∑ k : Fin 197, factorEntry a i k * factorEntry a j k := by
  simp only [residualEntryN, blockEntry, factorEntry, list_range_sum_eq_fin_sum]

theorem rowCheck_dominance (a : Fin 4) (i : Fin 197)
    (hc : rowCheck a.val i.val = true) :
    (∑ j : Fin 197, if i=j then 0 else |residualEntryN a.val i.val j.val|) ≤
      residualEntryN a.val i.val i.val := by
  have hc' : decide (0 ≤ residualEntryN a.val i.val i.val) = true ∧
      decide (((List.range 197).map (fun j => |residualEntryN a.val i.val j|)).sum ≤
        2 * residualEntryN a.val i.val i.val) = true := by
    simpa only [rowCheck, Bool.and_eq_true] using hc
  have hd : 0 ≤ residualEntryN a.val i.val i.val := of_decide_eq_true hc'.1
  have ht : ((List.range 197).map
      (fun j => |residualEntryN a.val i.val j|)).sum ≤
        2 * residualEntryN a.val i.val i.val := of_decide_eq_true hc'.2
  rw [list_range_sum_eq_fin_sum] at ht
  have heq : (∑ j : Fin 197, |residualEntryN a.val i.val j.val|) =
      residualEntryN a.val i.val i.val +
        ∑ j : Fin 197, if i=j then 0 else |residualEntryN a.val i.val j.val| := by
    calc
      _ = ∑ j : Fin 197,
          ((if i=j then residualEntryN a.val i.val i.val else 0) +
            (if i=j then 0 else |residualEntryN a.val i.val j.val|)) := by
        apply Finset.sum_congr rfl
        intro j _
        by_cases h : i=j
        · subst j; simp [abs_of_nonneg hd]
        · simp [h]
      _ = _ := by simp [Finset.sum_add_distrib]
  rw [heq] at ht
  linarith

theorem checked_block_posSemidef (a : Fin 4)
    (hsym : ∀ i j : Fin 197, blockEntry a i j = blockEntry a j i)
    (hcheck : ∀ i : Fin 197, rowCheck a.val i.val = true) :
    Matrix.PosSemidef (fun i j : Fin 197 => (blockEntry a i j : ℝ)) := by
  apply gram_residual_posSemidef _
    (fun i k : Fin 197 => (factorEntry a i k : ℝ)) 1000000 (by norm_num)
  · intro i j
    rw [hsym]
  · intro i
    have h := rowCheck_dominance a i (hcheck i)
    simp only [residualEntryN_eq] at h
    exact_mod_cast h

end Hedetniemi.Round4
