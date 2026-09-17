import Hedetniemi.Round4.CertificateFactors
import Hedetniemi.Round4.CertificateResidualData
import Hedetniemi.Round4.CertificateListGram
import Hedetniemi.Round4.CertificateArithmetic

namespace Hedetniemi.Round4
open scoped BigOperators

noncomputable def listResidual (a i j : Nat) : Int :=
  1000000000000 * blockEntryN a i j -
    listIntDot (listFactorRows a i) (listFactorRows a j)

theorem expectedResidual_symm (a i j : Nat) :
    expectedResidual a i j = expectedResidual a j i := by
  simp only [expectedResidual, Nat.max_comm i j, Nat.min_comm i j]

theorem listResidual_symm (a : Fin 4)
    (hs : ∀ i j : Fin 197, blockEntry a i j = blockEntry a j i)
    (i j : Fin 197) :
    listResidual a.val i.val j.val = listResidual a.val j.val i.val := by
  unfold listResidual
  change 1000000000000 * blockEntry a i j - _ =
    1000000000000 * blockEntry a j i - _
  rw [hs i j, listIntDot_eq_zip, listIntDot_eq_zip]
  rw [List.zipWith_comm_of_comm (fun x y : Int => mul_comm x y)]

theorem checked_expected_dominance (a : Fin 4) (i : Fin 197)
    (hc : expectedRowCheck a.val i.val = true) :
    (∑ j : Fin 197, if i=j then 0 else |expectedResidual a.val i.val j.val|) ≤
      expectedResidual a.val i.val i.val := by
  have hh : decide (0 ≤ expectedResidual a.val i.val i.val) = true ∧
      decide (((List.range 197).map (fun j => |expectedResidual a.val i.val j|)).sum ≤
        2 * expectedResidual a.val i.val i.val) = true := by
    simpa only [expectedRowCheck, Bool.and_eq_true] using hc
  have hd : 0 ≤ expectedResidual a.val i.val i.val := of_decide_eq_true hh.1
  have ht : ((List.range 197).map (fun j => |expectedResidual a.val i.val j|)).sum ≤
      2 * expectedResidual a.val i.val i.val := of_decide_eq_true hh.2
  rw [list_range_sum_eq_fin_sum] at ht
  exact abs_row_bound_offdiag
    (fun i j : Fin 197 => expectedResidual a.val i.val j.val) i hd ht

theorem checked_residual_table_eq (a : Fin 4)
    (hs : ∀ i j : Fin 197, blockEntry a i j = blockEntry a j i)
    (hc : ∀ i : Fin 197, ∀ j : Fin (i.val+1),
      listResidual a.val i.val j.val = expectedResidual a.val i.val j.val)
    (i j : Fin 197) :
    listResidual a.val i.val j.val = expectedResidual a.val i.val j.val := by
  by_cases h : j.val ≤ i.val
  · exact hc i ⟨j.val, by omega⟩
  · rw [listResidual_symm a hs i j,
      expectedResidual_symm a.val i.val j.val]
    exact hc j ⟨i.val, by omega⟩

theorem checked_residual_table_posSemidef (a : Fin 4)
    (hs : ∀ i j : Fin 197, blockEntry a i j = blockEntry a j i)
    (hc : ∀ i : Fin 197,
      (∀ j : Fin (i.val+1), listResidual a.val i.val j.val =
        expectedResidual a.val i.val j.val) ∧
      expectedRowCheck a.val i.val = true ∧
      (listFactorRows a.val i.val).length ≤ 197) :
    Matrix.PosSemidef (fun i j : Fin 197 => (blockEntry a i j : ℝ)) := by
  apply list_gram_residual_posSemidef 197 (blockEntry a)
    (fun i : Fin 197 => listFactorRows a.val i.val) 1000000 (by omega)
  · intro i
    exact (hc i).2.2
  · exact hs
  · intro i
    have hd := checked_expected_dominance a i (hc i).2.1
    have he := checked_residual_table_eq a hs (fun i => (hc i).1)
    simp_rw [← he] at hd
    norm_num only [show (1000000 : Int)^2 = 1000000000000 by decide]
    simpa only [listResidual, listIntDot_eq_zip, blockEntry] using hd

end Hedetniemi.Round4
