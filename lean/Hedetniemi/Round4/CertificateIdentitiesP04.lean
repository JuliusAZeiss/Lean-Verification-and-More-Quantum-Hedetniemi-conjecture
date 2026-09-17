import Hedetniemi.Round4.CertificateIdentityBasic

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem checked_entry_row_32 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 32 j = blockEntry a j 32 ∧
    blockEntry a 32 j = blockFormulaN a.val 32 j.val := by decide +kernel
#check checked_entry_row_32

theorem checked_entry_row_33 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 33 j = blockEntry a j 33 ∧
    blockEntry a 33 j = blockFormulaN a.val 33 j.val := by decide +kernel
#check checked_entry_row_33

theorem checked_entry_row_34 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 34 j = blockEntry a j 34 ∧
    blockEntry a 34 j = blockFormulaN a.val 34 j.val := by decide +kernel
#check checked_entry_row_34

theorem checked_entry_row_35 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 35 j = blockEntry a j 35 ∧
    blockEntry a 35 j = blockFormulaN a.val 35 j.val := by decide +kernel
#check checked_entry_row_35

theorem checked_entry_row_36 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 36 j = blockEntry a j 36 ∧
    blockEntry a 36 j = blockFormulaN a.val 36 j.val := by decide +kernel
#check checked_entry_row_36

theorem checked_entry_row_37 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 37 j = blockEntry a j 37 ∧
    blockEntry a 37 j = blockFormulaN a.val 37 j.val := by decide +kernel
#check checked_entry_row_37

theorem checked_entry_row_38 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 38 j = blockEntry a j 38 ∧
    blockEntry a 38 j = blockFormulaN a.val 38 j.val := by decide +kernel
#check checked_entry_row_38

theorem checked_entry_row_39 : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a 39 j = blockEntry a j 39 ∧
    blockEntry a 39 j = blockFormulaN a.val 39 j.val := by decide +kernel
#check checked_entry_row_39

end Hedetniemi.Round4
