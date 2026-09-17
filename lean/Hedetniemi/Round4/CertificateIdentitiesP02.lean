import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_16 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 16 j = blockEntry a j 16 ∧
    blockEntry a 16 j = blockFormulaN a.val 16 j.val := by decide +kernel
#check checked_entry_row_16

theorem checked_entry_row_17 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 17 j = blockEntry a j 17 ∧
    blockEntry a 17 j = blockFormulaN a.val 17 j.val := by decide +kernel
#check checked_entry_row_17

theorem checked_entry_row_18 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 18 j = blockEntry a j 18 ∧
    blockEntry a 18 j = blockFormulaN a.val 18 j.val := by decide +kernel
#check checked_entry_row_18

theorem checked_entry_row_19 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 19 j = blockEntry a j 19 ∧
    blockEntry a 19 j = blockFormulaN a.val 19 j.val := by decide +kernel
#check checked_entry_row_19

theorem checked_entry_row_20 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 20 j = blockEntry a j 20 ∧
    blockEntry a 20 j = blockFormulaN a.val 20 j.val := by decide +kernel
#check checked_entry_row_20

theorem checked_entry_row_21 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 21 j = blockEntry a j 21 ∧
    blockEntry a 21 j = blockFormulaN a.val 21 j.val := by decide +kernel
#check checked_entry_row_21

theorem checked_entry_row_22 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 22 j = blockEntry a j 22 ∧
    blockEntry a 22 j = blockFormulaN a.val 22 j.val := by decide +kernel
#check checked_entry_row_22

theorem checked_entry_row_23 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 23 j = blockEntry a j 23 ∧
    blockEntry a 23 j = blockFormulaN a.val 23 j.val := by decide +kernel
#check checked_entry_row_23

end Hedetniemi.Round4
