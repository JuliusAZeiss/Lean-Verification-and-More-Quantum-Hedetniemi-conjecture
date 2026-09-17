import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_8 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 8 j = blockEntry a j 8 ∧
    blockEntry a 8 j = blockFormulaN a.val 8 j.val := by decide +kernel
#check checked_entry_row_8

theorem checked_entry_row_9 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 9 j = blockEntry a j 9 ∧
    blockEntry a 9 j = blockFormulaN a.val 9 j.val := by decide +kernel
#check checked_entry_row_9

theorem checked_entry_row_10 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 10 j = blockEntry a j 10 ∧
    blockEntry a 10 j = blockFormulaN a.val 10 j.val := by decide +kernel
#check checked_entry_row_10

theorem checked_entry_row_11 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 11 j = blockEntry a j 11 ∧
    blockEntry a 11 j = blockFormulaN a.val 11 j.val := by decide +kernel
#check checked_entry_row_11

theorem checked_entry_row_12 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 12 j = blockEntry a j 12 ∧
    blockEntry a 12 j = blockFormulaN a.val 12 j.val := by decide +kernel
#check checked_entry_row_12

theorem checked_entry_row_13 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 13 j = blockEntry a j 13 ∧
    blockEntry a 13 j = blockFormulaN a.val 13 j.val := by decide +kernel
#check checked_entry_row_13

theorem checked_entry_row_14 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 14 j = blockEntry a j 14 ∧
    blockEntry a 14 j = blockFormulaN a.val 14 j.val := by decide +kernel
#check checked_entry_row_14

theorem checked_entry_row_15 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 15 j = blockEntry a j 15 ∧
    blockEntry a 15 j = blockFormulaN a.val 15 j.val := by decide +kernel
#check checked_entry_row_15

end Hedetniemi.Round4
