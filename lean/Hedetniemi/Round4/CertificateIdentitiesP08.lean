import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_64 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 64 j = blockEntry a j 64 ∧
    blockEntry a 64 j = blockFormulaN a.val 64 j.val := by decide +kernel
#check checked_entry_row_64

theorem checked_entry_row_65 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 65 j = blockEntry a j 65 ∧
    blockEntry a 65 j = blockFormulaN a.val 65 j.val := by decide +kernel
#check checked_entry_row_65

theorem checked_entry_row_66 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 66 j = blockEntry a j 66 ∧
    blockEntry a 66 j = blockFormulaN a.val 66 j.val := by decide +kernel
#check checked_entry_row_66

theorem checked_entry_row_67 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 67 j = blockEntry a j 67 ∧
    blockEntry a 67 j = blockFormulaN a.val 67 j.val := by decide +kernel
#check checked_entry_row_67

theorem checked_entry_row_68 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 68 j = blockEntry a j 68 ∧
    blockEntry a 68 j = blockFormulaN a.val 68 j.val := by decide +kernel
#check checked_entry_row_68

theorem checked_entry_row_69 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 69 j = blockEntry a j 69 ∧
    blockEntry a 69 j = blockFormulaN a.val 69 j.val := by decide +kernel
#check checked_entry_row_69

theorem checked_entry_row_70 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 70 j = blockEntry a j 70 ∧
    blockEntry a 70 j = blockFormulaN a.val 70 j.val := by decide +kernel
#check checked_entry_row_70

theorem checked_entry_row_71 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 71 j = blockEntry a j 71 ∧
    blockEntry a 71 j = blockFormulaN a.val 71 j.val := by decide +kernel
#check checked_entry_row_71

end Hedetniemi.Round4
