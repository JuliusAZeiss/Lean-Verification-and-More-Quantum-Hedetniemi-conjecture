import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_160 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 160 j = blockEntry a j 160 ∧
    blockEntry a 160 j = blockFormulaN a.val 160 j.val := by decide +kernel
#check checked_entry_row_160

theorem checked_entry_row_161 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 161 j = blockEntry a j 161 ∧
    blockEntry a 161 j = blockFormulaN a.val 161 j.val := by decide +kernel
#check checked_entry_row_161

theorem checked_entry_row_162 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 162 j = blockEntry a j 162 ∧
    blockEntry a 162 j = blockFormulaN a.val 162 j.val := by decide +kernel
#check checked_entry_row_162

theorem checked_entry_row_163 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 163 j = blockEntry a j 163 ∧
    blockEntry a 163 j = blockFormulaN a.val 163 j.val := by decide +kernel
#check checked_entry_row_163

theorem checked_entry_row_164 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 164 j = blockEntry a j 164 ∧
    blockEntry a 164 j = blockFormulaN a.val 164 j.val := by decide +kernel
#check checked_entry_row_164

theorem checked_entry_row_165 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 165 j = blockEntry a j 165 ∧
    blockEntry a 165 j = blockFormulaN a.val 165 j.val := by decide +kernel
#check checked_entry_row_165

theorem checked_entry_row_166 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 166 j = blockEntry a j 166 ∧
    blockEntry a 166 j = blockFormulaN a.val 166 j.val := by decide +kernel
#check checked_entry_row_166

theorem checked_entry_row_167 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 167 j = blockEntry a j 167 ∧
    blockEntry a 167 j = blockFormulaN a.val 167 j.val := by decide +kernel
#check checked_entry_row_167

end Hedetniemi.Round4
