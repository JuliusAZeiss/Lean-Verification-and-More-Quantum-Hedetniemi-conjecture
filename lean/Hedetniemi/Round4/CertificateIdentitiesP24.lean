import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_192 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 192 j = blockEntry a j 192 ∧
    blockEntry a 192 j = blockFormulaN a.val 192 j.val := by decide +kernel
#check checked_entry_row_192

theorem checked_entry_row_193 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 193 j = blockEntry a j 193 ∧
    blockEntry a 193 j = blockFormulaN a.val 193 j.val := by decide +kernel
#check checked_entry_row_193

theorem checked_entry_row_194 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 194 j = blockEntry a j 194 ∧
    blockEntry a 194 j = blockFormulaN a.val 194 j.val := by decide +kernel
#check checked_entry_row_194

theorem checked_entry_row_195 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 195 j = blockEntry a j 195 ∧
    blockEntry a 195 j = blockFormulaN a.val 195 j.val := by decide +kernel
#check checked_entry_row_195

theorem checked_entry_row_196 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 196 j = blockEntry a j 196 ∧
    blockEntry a 196 j = blockFormulaN a.val 196 j.val := by decide +kernel
#check checked_entry_row_196

end Hedetniemi.Round4
