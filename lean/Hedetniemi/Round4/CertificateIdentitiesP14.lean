import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_112 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 112 j = blockEntry a j 112 ∧
    blockEntry a 112 j = blockFormulaN a.val 112 j.val := by decide +kernel
#check checked_entry_row_112

theorem checked_entry_row_113 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 113 j = blockEntry a j 113 ∧
    blockEntry a 113 j = blockFormulaN a.val 113 j.val := by decide +kernel
#check checked_entry_row_113

theorem checked_entry_row_114 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 114 j = blockEntry a j 114 ∧
    blockEntry a 114 j = blockFormulaN a.val 114 j.val := by decide +kernel
#check checked_entry_row_114

theorem checked_entry_row_115 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 115 j = blockEntry a j 115 ∧
    blockEntry a 115 j = blockFormulaN a.val 115 j.val := by decide +kernel
#check checked_entry_row_115

theorem checked_entry_row_116 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 116 j = blockEntry a j 116 ∧
    blockEntry a 116 j = blockFormulaN a.val 116 j.val := by decide +kernel
#check checked_entry_row_116

theorem checked_entry_row_117 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 117 j = blockEntry a j 117 ∧
    blockEntry a 117 j = blockFormulaN a.val 117 j.val := by decide +kernel
#check checked_entry_row_117

theorem checked_entry_row_118 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 118 j = blockEntry a j 118 ∧
    blockEntry a 118 j = blockFormulaN a.val 118 j.val := by decide +kernel
#check checked_entry_row_118

theorem checked_entry_row_119 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 119 j = blockEntry a j 119 ∧
    blockEntry a 119 j = blockFormulaN a.val 119 j.val := by decide +kernel
#check checked_entry_row_119

end Hedetniemi.Round4
