import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_104 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 104 j = blockEntry a j 104 ∧
    blockEntry a 104 j = blockFormulaN a.val 104 j.val := by decide +kernel
#check checked_entry_row_104

theorem checked_entry_row_105 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 105 j = blockEntry a j 105 ∧
    blockEntry a 105 j = blockFormulaN a.val 105 j.val := by decide +kernel
#check checked_entry_row_105

theorem checked_entry_row_106 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 106 j = blockEntry a j 106 ∧
    blockEntry a 106 j = blockFormulaN a.val 106 j.val := by decide +kernel
#check checked_entry_row_106

theorem checked_entry_row_107 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 107 j = blockEntry a j 107 ∧
    blockEntry a 107 j = blockFormulaN a.val 107 j.val := by decide +kernel
#check checked_entry_row_107

theorem checked_entry_row_108 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 108 j = blockEntry a j 108 ∧
    blockEntry a 108 j = blockFormulaN a.val 108 j.val := by decide +kernel
#check checked_entry_row_108

theorem checked_entry_row_109 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 109 j = blockEntry a j 109 ∧
    blockEntry a 109 j = blockFormulaN a.val 109 j.val := by decide +kernel
#check checked_entry_row_109

theorem checked_entry_row_110 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 110 j = blockEntry a j 110 ∧
    blockEntry a 110 j = blockFormulaN a.val 110 j.val := by decide +kernel
#check checked_entry_row_110

theorem checked_entry_row_111 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 111 j = blockEntry a j 111 ∧
    blockEntry a 111 j = blockFormulaN a.val 111 j.val := by decide +kernel
#check checked_entry_row_111

end Hedetniemi.Round4
