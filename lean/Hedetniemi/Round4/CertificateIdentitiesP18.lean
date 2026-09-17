import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_144 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 144 j = blockEntry a j 144 ∧
    blockEntry a 144 j = blockFormulaN a.val 144 j.val := by decide +kernel
#check checked_entry_row_144

theorem checked_entry_row_145 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 145 j = blockEntry a j 145 ∧
    blockEntry a 145 j = blockFormulaN a.val 145 j.val := by decide +kernel
#check checked_entry_row_145

theorem checked_entry_row_146 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 146 j = blockEntry a j 146 ∧
    blockEntry a 146 j = blockFormulaN a.val 146 j.val := by decide +kernel
#check checked_entry_row_146

theorem checked_entry_row_147 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 147 j = blockEntry a j 147 ∧
    blockEntry a 147 j = blockFormulaN a.val 147 j.val := by decide +kernel
#check checked_entry_row_147

theorem checked_entry_row_148 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 148 j = blockEntry a j 148 ∧
    blockEntry a 148 j = blockFormulaN a.val 148 j.val := by decide +kernel
#check checked_entry_row_148

theorem checked_entry_row_149 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 149 j = blockEntry a j 149 ∧
    blockEntry a 149 j = blockFormulaN a.val 149 j.val := by decide +kernel
#check checked_entry_row_149

theorem checked_entry_row_150 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 150 j = blockEntry a j 150 ∧
    blockEntry a 150 j = blockFormulaN a.val 150 j.val := by decide +kernel
#check checked_entry_row_150

theorem checked_entry_row_151 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 151 j = blockEntry a j 151 ∧
    blockEntry a 151 j = blockFormulaN a.val 151 j.val := by decide +kernel
#check checked_entry_row_151

end Hedetniemi.Round4
