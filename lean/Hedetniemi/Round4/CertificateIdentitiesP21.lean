import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_168 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 168 j = blockEntry a j 168 ∧
    blockEntry a 168 j = blockFormulaN a.val 168 j.val := by decide +kernel
#check checked_entry_row_168

theorem checked_entry_row_169 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 169 j = blockEntry a j 169 ∧
    blockEntry a 169 j = blockFormulaN a.val 169 j.val := by decide +kernel
#check checked_entry_row_169

theorem checked_entry_row_170 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 170 j = blockEntry a j 170 ∧
    blockEntry a 170 j = blockFormulaN a.val 170 j.val := by decide +kernel
#check checked_entry_row_170

theorem checked_entry_row_171 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 171 j = blockEntry a j 171 ∧
    blockEntry a 171 j = blockFormulaN a.val 171 j.val := by decide +kernel
#check checked_entry_row_171

theorem checked_entry_row_172 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 172 j = blockEntry a j 172 ∧
    blockEntry a 172 j = blockFormulaN a.val 172 j.val := by decide +kernel
#check checked_entry_row_172

theorem checked_entry_row_173 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 173 j = blockEntry a j 173 ∧
    blockEntry a 173 j = blockFormulaN a.val 173 j.val := by decide +kernel
#check checked_entry_row_173

theorem checked_entry_row_174 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 174 j = blockEntry a j 174 ∧
    blockEntry a 174 j = blockFormulaN a.val 174 j.val := by decide +kernel
#check checked_entry_row_174

theorem checked_entry_row_175 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 175 j = blockEntry a j 175 ∧
    blockEntry a 175 j = blockFormulaN a.val 175 j.val := by decide +kernel
#check checked_entry_row_175

end Hedetniemi.Round4
