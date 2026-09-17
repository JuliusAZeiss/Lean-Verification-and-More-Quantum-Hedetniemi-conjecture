import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_128 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 128 j = blockEntry a j 128 ∧
    blockEntry a 128 j = blockFormulaN a.val 128 j.val := by decide +kernel
#check checked_entry_row_128

theorem checked_entry_row_129 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 129 j = blockEntry a j 129 ∧
    blockEntry a 129 j = blockFormulaN a.val 129 j.val := by decide +kernel
#check checked_entry_row_129

theorem checked_entry_row_130 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 130 j = blockEntry a j 130 ∧
    blockEntry a 130 j = blockFormulaN a.val 130 j.val := by decide +kernel
#check checked_entry_row_130

theorem checked_entry_row_131 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 131 j = blockEntry a j 131 ∧
    blockEntry a 131 j = blockFormulaN a.val 131 j.val := by decide +kernel
#check checked_entry_row_131

theorem checked_entry_row_132 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 132 j = blockEntry a j 132 ∧
    blockEntry a 132 j = blockFormulaN a.val 132 j.val := by decide +kernel
#check checked_entry_row_132

theorem checked_entry_row_133 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 133 j = blockEntry a j 133 ∧
    blockEntry a 133 j = blockFormulaN a.val 133 j.val := by decide +kernel
#check checked_entry_row_133

theorem checked_entry_row_134 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 134 j = blockEntry a j 134 ∧
    blockEntry a 134 j = blockFormulaN a.val 134 j.val := by decide +kernel
#check checked_entry_row_134

theorem checked_entry_row_135 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 135 j = blockEntry a j 135 ∧
    blockEntry a 135 j = blockFormulaN a.val 135 j.val := by decide +kernel
#check checked_entry_row_135

end Hedetniemi.Round4
