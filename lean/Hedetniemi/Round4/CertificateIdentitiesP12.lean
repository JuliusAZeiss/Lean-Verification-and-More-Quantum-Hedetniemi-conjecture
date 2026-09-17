import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_96 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 96 j = blockEntry a j 96 ∧
    blockEntry a 96 j = blockFormulaN a.val 96 j.val := by decide +kernel
#check checked_entry_row_96

theorem checked_entry_row_97 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 97 j = blockEntry a j 97 ∧
    blockEntry a 97 j = blockFormulaN a.val 97 j.val := by decide +kernel
#check checked_entry_row_97

theorem checked_entry_row_98 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 98 j = blockEntry a j 98 ∧
    blockEntry a 98 j = blockFormulaN a.val 98 j.val := by decide +kernel
#check checked_entry_row_98

theorem checked_entry_row_99 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 99 j = blockEntry a j 99 ∧
    blockEntry a 99 j = blockFormulaN a.val 99 j.val := by decide +kernel
#check checked_entry_row_99

theorem checked_entry_row_100 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 100 j = blockEntry a j 100 ∧
    blockEntry a 100 j = blockFormulaN a.val 100 j.val := by decide +kernel
#check checked_entry_row_100

theorem checked_entry_row_101 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 101 j = blockEntry a j 101 ∧
    blockEntry a 101 j = blockFormulaN a.val 101 j.val := by decide +kernel
#check checked_entry_row_101

theorem checked_entry_row_102 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 102 j = blockEntry a j 102 ∧
    blockEntry a 102 j = blockFormulaN a.val 102 j.val := by decide +kernel
#check checked_entry_row_102

theorem checked_entry_row_103 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 103 j = blockEntry a j 103 ∧
    blockEntry a 103 j = blockFormulaN a.val 103 j.val := by decide +kernel
#check checked_entry_row_103

end Hedetniemi.Round4
