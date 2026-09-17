import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_80 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 80 j = blockEntry a j 80 ∧
    blockEntry a 80 j = blockFormulaN a.val 80 j.val := by decide +kernel
#check checked_entry_row_80

theorem checked_entry_row_81 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 81 j = blockEntry a j 81 ∧
    blockEntry a 81 j = blockFormulaN a.val 81 j.val := by decide +kernel
#check checked_entry_row_81

theorem checked_entry_row_82 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 82 j = blockEntry a j 82 ∧
    blockEntry a 82 j = blockFormulaN a.val 82 j.val := by decide +kernel
#check checked_entry_row_82

theorem checked_entry_row_83 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 83 j = blockEntry a j 83 ∧
    blockEntry a 83 j = blockFormulaN a.val 83 j.val := by decide +kernel
#check checked_entry_row_83

theorem checked_entry_row_84 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 84 j = blockEntry a j 84 ∧
    blockEntry a 84 j = blockFormulaN a.val 84 j.val := by decide +kernel
#check checked_entry_row_84

theorem checked_entry_row_85 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 85 j = blockEntry a j 85 ∧
    blockEntry a 85 j = blockFormulaN a.val 85 j.val := by decide +kernel
#check checked_entry_row_85

theorem checked_entry_row_86 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 86 j = blockEntry a j 86 ∧
    blockEntry a 86 j = blockFormulaN a.val 86 j.val := by decide +kernel
#check checked_entry_row_86

theorem checked_entry_row_87 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 87 j = blockEntry a j 87 ∧
    blockEntry a 87 j = blockFormulaN a.val 87 j.val := by decide +kernel
#check checked_entry_row_87

end Hedetniemi.Round4
