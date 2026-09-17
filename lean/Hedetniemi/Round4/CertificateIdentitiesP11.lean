import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_88 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 88 j = blockEntry a j 88 ∧
    blockEntry a 88 j = blockFormulaN a.val 88 j.val := by decide +kernel
#check checked_entry_row_88

theorem checked_entry_row_89 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 89 j = blockEntry a j 89 ∧
    blockEntry a 89 j = blockFormulaN a.val 89 j.val := by decide +kernel
#check checked_entry_row_89

theorem checked_entry_row_90 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 90 j = blockEntry a j 90 ∧
    blockEntry a 90 j = blockFormulaN a.val 90 j.val := by decide +kernel
#check checked_entry_row_90

theorem checked_entry_row_91 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 91 j = blockEntry a j 91 ∧
    blockEntry a 91 j = blockFormulaN a.val 91 j.val := by decide +kernel
#check checked_entry_row_91

theorem checked_entry_row_92 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 92 j = blockEntry a j 92 ∧
    blockEntry a 92 j = blockFormulaN a.val 92 j.val := by decide +kernel
#check checked_entry_row_92

theorem checked_entry_row_93 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 93 j = blockEntry a j 93 ∧
    blockEntry a 93 j = blockFormulaN a.val 93 j.val := by decide +kernel
#check checked_entry_row_93

theorem checked_entry_row_94 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 94 j = blockEntry a j 94 ∧
    blockEntry a 94 j = blockFormulaN a.val 94 j.val := by decide +kernel
#check checked_entry_row_94

theorem checked_entry_row_95 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 95 j = blockEntry a j 95 ∧
    blockEntry a 95 j = blockFormulaN a.val 95 j.val := by decide +kernel
#check checked_entry_row_95

end Hedetniemi.Round4
