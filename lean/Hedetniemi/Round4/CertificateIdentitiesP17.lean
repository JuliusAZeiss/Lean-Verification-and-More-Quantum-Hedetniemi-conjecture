import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_136 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 136 j = blockEntry a j 136 ∧
    blockEntry a 136 j = blockFormulaN a.val 136 j.val := by decide +kernel
#check checked_entry_row_136

theorem checked_entry_row_137 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 137 j = blockEntry a j 137 ∧
    blockEntry a 137 j = blockFormulaN a.val 137 j.val := by decide +kernel
#check checked_entry_row_137

theorem checked_entry_row_138 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 138 j = blockEntry a j 138 ∧
    blockEntry a 138 j = blockFormulaN a.val 138 j.val := by decide +kernel
#check checked_entry_row_138

theorem checked_entry_row_139 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 139 j = blockEntry a j 139 ∧
    blockEntry a 139 j = blockFormulaN a.val 139 j.val := by decide +kernel
#check checked_entry_row_139

theorem checked_entry_row_140 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 140 j = blockEntry a j 140 ∧
    blockEntry a 140 j = blockFormulaN a.val 140 j.val := by decide +kernel
#check checked_entry_row_140

theorem checked_entry_row_141 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 141 j = blockEntry a j 141 ∧
    blockEntry a 141 j = blockFormulaN a.val 141 j.val := by decide +kernel
#check checked_entry_row_141

theorem checked_entry_row_142 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 142 j = blockEntry a j 142 ∧
    blockEntry a 142 j = blockFormulaN a.val 142 j.val := by decide +kernel
#check checked_entry_row_142

theorem checked_entry_row_143 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 143 j = blockEntry a j 143 ∧
    blockEntry a 143 j = blockFormulaN a.val 143 j.val := by decide +kernel
#check checked_entry_row_143

end Hedetniemi.Round4
