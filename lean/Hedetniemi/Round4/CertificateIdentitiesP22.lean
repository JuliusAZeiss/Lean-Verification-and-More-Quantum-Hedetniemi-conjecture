import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_176 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 176 j = blockEntry a j 176 ∧
    blockEntry a 176 j = blockFormulaN a.val 176 j.val := by decide +kernel
#check checked_entry_row_176

theorem checked_entry_row_177 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 177 j = blockEntry a j 177 ∧
    blockEntry a 177 j = blockFormulaN a.val 177 j.val := by decide +kernel
#check checked_entry_row_177

theorem checked_entry_row_178 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 178 j = blockEntry a j 178 ∧
    blockEntry a 178 j = blockFormulaN a.val 178 j.val := by decide +kernel
#check checked_entry_row_178

theorem checked_entry_row_179 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 179 j = blockEntry a j 179 ∧
    blockEntry a 179 j = blockFormulaN a.val 179 j.val := by decide +kernel
#check checked_entry_row_179

theorem checked_entry_row_180 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 180 j = blockEntry a j 180 ∧
    blockEntry a 180 j = blockFormulaN a.val 180 j.val := by decide +kernel
#check checked_entry_row_180

theorem checked_entry_row_181 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 181 j = blockEntry a j 181 ∧
    blockEntry a 181 j = blockFormulaN a.val 181 j.val := by decide +kernel
#check checked_entry_row_181

theorem checked_entry_row_182 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 182 j = blockEntry a j 182 ∧
    blockEntry a 182 j = blockFormulaN a.val 182 j.val := by decide +kernel
#check checked_entry_row_182

theorem checked_entry_row_183 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 183 j = blockEntry a j 183 ∧
    blockEntry a 183 j = blockFormulaN a.val 183 j.val := by decide +kernel
#check checked_entry_row_183

end Hedetniemi.Round4
