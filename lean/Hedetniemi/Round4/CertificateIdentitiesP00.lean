import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_0 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 0 j = blockEntry a j 0 ∧
    blockEntry a 0 j = blockFormulaN a.val 0 j.val := by decide +kernel
#check checked_entry_row_0

theorem checked_entry_row_1 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 1 j = blockEntry a j 1 ∧
    blockEntry a 1 j = blockFormulaN a.val 1 j.val := by decide +kernel
#check checked_entry_row_1

theorem checked_entry_row_2 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 2 j = blockEntry a j 2 ∧
    blockEntry a 2 j = blockFormulaN a.val 2 j.val := by decide +kernel
#check checked_entry_row_2

theorem checked_entry_row_3 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 3 j = blockEntry a j 3 ∧
    blockEntry a 3 j = blockFormulaN a.val 3 j.val := by decide +kernel
#check checked_entry_row_3

theorem checked_entry_row_4 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 4 j = blockEntry a j 4 ∧
    blockEntry a 4 j = blockFormulaN a.val 4 j.val := by decide +kernel
#check checked_entry_row_4

theorem checked_entry_row_5 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 5 j = blockEntry a j 5 ∧
    blockEntry a 5 j = blockFormulaN a.val 5 j.val := by decide +kernel
#check checked_entry_row_5

theorem checked_entry_row_6 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 6 j = blockEntry a j 6 ∧
    blockEntry a 6 j = blockFormulaN a.val 6 j.val := by decide +kernel
#check checked_entry_row_6

theorem checked_entry_row_7 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 7 j = blockEntry a j 7 ∧
    blockEntry a 7 j = blockFormulaN a.val 7 j.val := by decide +kernel
#check checked_entry_row_7

end Hedetniemi.Round4
