import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_24 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 24 j = blockEntry a j 24 ∧
    blockEntry a 24 j = blockFormulaN a.val 24 j.val := by decide +kernel
#check checked_entry_row_24

theorem checked_entry_row_25 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 25 j = blockEntry a j 25 ∧
    blockEntry a 25 j = blockFormulaN a.val 25 j.val := by decide +kernel
#check checked_entry_row_25

theorem checked_entry_row_26 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 26 j = blockEntry a j 26 ∧
    blockEntry a 26 j = blockFormulaN a.val 26 j.val := by decide +kernel
#check checked_entry_row_26

theorem checked_entry_row_27 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 27 j = blockEntry a j 27 ∧
    blockEntry a 27 j = blockFormulaN a.val 27 j.val := by decide +kernel
#check checked_entry_row_27

theorem checked_entry_row_28 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 28 j = blockEntry a j 28 ∧
    blockEntry a 28 j = blockFormulaN a.val 28 j.val := by decide +kernel
#check checked_entry_row_28

theorem checked_entry_row_29 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 29 j = blockEntry a j 29 ∧
    blockEntry a 29 j = blockFormulaN a.val 29 j.val := by decide +kernel
#check checked_entry_row_29

theorem checked_entry_row_30 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 30 j = blockEntry a j 30 ∧
    blockEntry a 30 j = blockFormulaN a.val 30 j.val := by decide +kernel
#check checked_entry_row_30

theorem checked_entry_row_31 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 31 j = blockEntry a j 31 ∧
    blockEntry a 31 j = blockFormulaN a.val 31 j.val := by decide +kernel
#check checked_entry_row_31

end Hedetniemi.Round4
