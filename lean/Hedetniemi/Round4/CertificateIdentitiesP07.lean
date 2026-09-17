import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_56 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 56 j = blockEntry a j 56 ∧
    blockEntry a 56 j = blockFormulaN a.val 56 j.val := by decide +kernel
#check checked_entry_row_56

theorem checked_entry_row_57 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 57 j = blockEntry a j 57 ∧
    blockEntry a 57 j = blockFormulaN a.val 57 j.val := by decide +kernel
#check checked_entry_row_57

theorem checked_entry_row_58 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 58 j = blockEntry a j 58 ∧
    blockEntry a 58 j = blockFormulaN a.val 58 j.val := by decide +kernel
#check checked_entry_row_58

theorem checked_entry_row_59 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 59 j = blockEntry a j 59 ∧
    blockEntry a 59 j = blockFormulaN a.val 59 j.val := by decide +kernel
#check checked_entry_row_59

theorem checked_entry_row_60 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 60 j = blockEntry a j 60 ∧
    blockEntry a 60 j = blockFormulaN a.val 60 j.val := by decide +kernel
#check checked_entry_row_60

theorem checked_entry_row_61 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 61 j = blockEntry a j 61 ∧
    blockEntry a 61 j = blockFormulaN a.val 61 j.val := by decide +kernel
#check checked_entry_row_61

theorem checked_entry_row_62 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 62 j = blockEntry a j 62 ∧
    blockEntry a 62 j = blockFormulaN a.val 62 j.val := by decide +kernel
#check checked_entry_row_62

theorem checked_entry_row_63 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 63 j = blockEntry a j 63 ∧
    blockEntry a 63 j = blockFormulaN a.val 63 j.val := by decide +kernel
#check checked_entry_row_63

end Hedetniemi.Round4
