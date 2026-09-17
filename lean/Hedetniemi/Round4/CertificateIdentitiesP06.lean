import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_48 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 48 j = blockEntry a j 48 ∧
    blockEntry a 48 j = blockFormulaN a.val 48 j.val := by decide +kernel
#check checked_entry_row_48

theorem checked_entry_row_49 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 49 j = blockEntry a j 49 ∧
    blockEntry a 49 j = blockFormulaN a.val 49 j.val := by decide +kernel
#check checked_entry_row_49

theorem checked_entry_row_50 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 50 j = blockEntry a j 50 ∧
    blockEntry a 50 j = blockFormulaN a.val 50 j.val := by decide +kernel
#check checked_entry_row_50

theorem checked_entry_row_51 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 51 j = blockEntry a j 51 ∧
    blockEntry a 51 j = blockFormulaN a.val 51 j.val := by decide +kernel
#check checked_entry_row_51

theorem checked_entry_row_52 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 52 j = blockEntry a j 52 ∧
    blockEntry a 52 j = blockFormulaN a.val 52 j.val := by decide +kernel
#check checked_entry_row_52

theorem checked_entry_row_53 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 53 j = blockEntry a j 53 ∧
    blockEntry a 53 j = blockFormulaN a.val 53 j.val := by decide +kernel
#check checked_entry_row_53

theorem checked_entry_row_54 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 54 j = blockEntry a j 54 ∧
    blockEntry a 54 j = blockFormulaN a.val 54 j.val := by decide +kernel
#check checked_entry_row_54

theorem checked_entry_row_55 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 55 j = blockEntry a j 55 ∧
    blockEntry a 55 j = blockFormulaN a.val 55 j.val := by decide +kernel
#check checked_entry_row_55

end Hedetniemi.Round4
