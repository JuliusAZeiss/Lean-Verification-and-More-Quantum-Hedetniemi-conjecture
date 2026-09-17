import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_120 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 120 j = blockEntry a j 120 ∧
    blockEntry a 120 j = blockFormulaN a.val 120 j.val := by decide +kernel
#check checked_entry_row_120

theorem checked_entry_row_121 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 121 j = blockEntry a j 121 ∧
    blockEntry a 121 j = blockFormulaN a.val 121 j.val := by decide +kernel
#check checked_entry_row_121

theorem checked_entry_row_122 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 122 j = blockEntry a j 122 ∧
    blockEntry a 122 j = blockFormulaN a.val 122 j.val := by decide +kernel
#check checked_entry_row_122

theorem checked_entry_row_123 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 123 j = blockEntry a j 123 ∧
    blockEntry a 123 j = blockFormulaN a.val 123 j.val := by decide +kernel
#check checked_entry_row_123

theorem checked_entry_row_124 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 124 j = blockEntry a j 124 ∧
    blockEntry a 124 j = blockFormulaN a.val 124 j.val := by decide +kernel
#check checked_entry_row_124

theorem checked_entry_row_125 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 125 j = blockEntry a j 125 ∧
    blockEntry a 125 j = blockFormulaN a.val 125 j.val := by decide +kernel
#check checked_entry_row_125

theorem checked_entry_row_126 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 126 j = blockEntry a j 126 ∧
    blockEntry a 126 j = blockFormulaN a.val 126 j.val := by decide +kernel
#check checked_entry_row_126

theorem checked_entry_row_127 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 127 j = blockEntry a j 127 ∧
    blockEntry a 127 j = blockFormulaN a.val 127 j.val := by decide +kernel
#check checked_entry_row_127

end Hedetniemi.Round4
