import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_72 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 72 j = blockEntry a j 72 ∧
    blockEntry a 72 j = blockFormulaN a.val 72 j.val := by decide +kernel
#check checked_entry_row_72

theorem checked_entry_row_73 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 73 j = blockEntry a j 73 ∧
    blockEntry a 73 j = blockFormulaN a.val 73 j.val := by decide +kernel
#check checked_entry_row_73

theorem checked_entry_row_74 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 74 j = blockEntry a j 74 ∧
    blockEntry a 74 j = blockFormulaN a.val 74 j.val := by decide +kernel
#check checked_entry_row_74

theorem checked_entry_row_75 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 75 j = blockEntry a j 75 ∧
    blockEntry a 75 j = blockFormulaN a.val 75 j.val := by decide +kernel
#check checked_entry_row_75

theorem checked_entry_row_76 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 76 j = blockEntry a j 76 ∧
    blockEntry a 76 j = blockFormulaN a.val 76 j.val := by decide +kernel
#check checked_entry_row_76

theorem checked_entry_row_77 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 77 j = blockEntry a j 77 ∧
    blockEntry a 77 j = blockFormulaN a.val 77 j.val := by decide +kernel
#check checked_entry_row_77

theorem checked_entry_row_78 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 78 j = blockEntry a j 78 ∧
    blockEntry a 78 j = blockFormulaN a.val 78 j.val := by decide +kernel
#check checked_entry_row_78

theorem checked_entry_row_79 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 79 j = blockEntry a j 79 ∧
    blockEntry a 79 j = blockFormulaN a.val 79 j.val := by decide +kernel
#check checked_entry_row_79

end Hedetniemi.Round4
