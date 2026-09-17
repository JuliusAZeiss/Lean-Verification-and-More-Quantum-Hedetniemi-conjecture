import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_40 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 40 j = blockEntry a j 40 ∧
    blockEntry a 40 j = blockFormulaN a.val 40 j.val := by decide +kernel
#check checked_entry_row_40

theorem checked_entry_row_41 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 41 j = blockEntry a j 41 ∧
    blockEntry a 41 j = blockFormulaN a.val 41 j.val := by decide +kernel
#check checked_entry_row_41

theorem checked_entry_row_42 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 42 j = blockEntry a j 42 ∧
    blockEntry a 42 j = blockFormulaN a.val 42 j.val := by decide +kernel
#check checked_entry_row_42

theorem checked_entry_row_43 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 43 j = blockEntry a j 43 ∧
    blockEntry a 43 j = blockFormulaN a.val 43 j.val := by decide +kernel
#check checked_entry_row_43

theorem checked_entry_row_44 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 44 j = blockEntry a j 44 ∧
    blockEntry a 44 j = blockFormulaN a.val 44 j.val := by decide +kernel
#check checked_entry_row_44

theorem checked_entry_row_45 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 45 j = blockEntry a j 45 ∧
    blockEntry a 45 j = blockFormulaN a.val 45 j.val := by decide +kernel
#check checked_entry_row_45

theorem checked_entry_row_46 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 46 j = blockEntry a j 46 ∧
    blockEntry a 46 j = blockFormulaN a.val 46 j.val := by decide +kernel
#check checked_entry_row_46

theorem checked_entry_row_47 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 47 j = blockEntry a j 47 ∧
    blockEntry a 47 j = blockFormulaN a.val 47 j.val := by decide +kernel
#check checked_entry_row_47

end Hedetniemi.Round4
