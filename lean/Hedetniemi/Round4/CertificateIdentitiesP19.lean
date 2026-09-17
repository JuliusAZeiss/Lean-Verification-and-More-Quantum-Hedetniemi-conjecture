import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_152 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 152 j = blockEntry a j 152 ∧
    blockEntry a 152 j = blockFormulaN a.val 152 j.val := by decide +kernel
#check checked_entry_row_152

theorem checked_entry_row_153 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 153 j = blockEntry a j 153 ∧
    blockEntry a 153 j = blockFormulaN a.val 153 j.val := by decide +kernel
#check checked_entry_row_153

theorem checked_entry_row_154 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 154 j = blockEntry a j 154 ∧
    blockEntry a 154 j = blockFormulaN a.val 154 j.val := by decide +kernel
#check checked_entry_row_154

theorem checked_entry_row_155 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 155 j = blockEntry a j 155 ∧
    blockEntry a 155 j = blockFormulaN a.val 155 j.val := by decide +kernel
#check checked_entry_row_155

theorem checked_entry_row_156 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 156 j = blockEntry a j 156 ∧
    blockEntry a 156 j = blockFormulaN a.val 156 j.val := by decide +kernel
#check checked_entry_row_156

theorem checked_entry_row_157 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 157 j = blockEntry a j 157 ∧
    blockEntry a 157 j = blockFormulaN a.val 157 j.val := by decide +kernel
#check checked_entry_row_157

theorem checked_entry_row_158 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 158 j = blockEntry a j 158 ∧
    blockEntry a 158 j = blockFormulaN a.val 158 j.val := by decide +kernel
#check checked_entry_row_158

theorem checked_entry_row_159 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 159 j = blockEntry a j 159 ∧
    blockEntry a 159 j = blockFormulaN a.val 159 j.val := by decide +kernel
#check checked_entry_row_159

end Hedetniemi.Round4
