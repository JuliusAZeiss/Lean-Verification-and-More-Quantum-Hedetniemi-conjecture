import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_184 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 184 j = blockEntry a j 184 ∧
    blockEntry a 184 j = blockFormulaN a.val 184 j.val := by decide +kernel
#check checked_entry_row_184

theorem checked_entry_row_185 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 185 j = blockEntry a j 185 ∧
    blockEntry a 185 j = blockFormulaN a.val 185 j.val := by decide +kernel
#check checked_entry_row_185

theorem checked_entry_row_186 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 186 j = blockEntry a j 186 ∧
    blockEntry a 186 j = blockFormulaN a.val 186 j.val := by decide +kernel
#check checked_entry_row_186

theorem checked_entry_row_187 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 187 j = blockEntry a j 187 ∧
    blockEntry a 187 j = blockFormulaN a.val 187 j.val := by decide +kernel
#check checked_entry_row_187

theorem checked_entry_row_188 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 188 j = blockEntry a j 188 ∧
    blockEntry a 188 j = blockFormulaN a.val 188 j.val := by decide +kernel
#check checked_entry_row_188

theorem checked_entry_row_189 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 189 j = blockEntry a j 189 ∧
    blockEntry a 189 j = blockFormulaN a.val 189 j.val := by decide +kernel
#check checked_entry_row_189

theorem checked_entry_row_190 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 190 j = blockEntry a j 190 ∧
    blockEntry a 190 j = blockFormulaN a.val 190 j.val := by decide +kernel
#check checked_entry_row_190

theorem checked_entry_row_191 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 191 j = blockEntry a j 191 ∧
    blockEntry a 191 j = blockFormulaN a.val 191 j.val := by decide +kernel
#check checked_entry_row_191

end Hedetniemi.Round4
