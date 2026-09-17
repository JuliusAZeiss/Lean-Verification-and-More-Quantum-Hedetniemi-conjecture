import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_32 : ∀ j : Fin 33,
    listResidual 1 32 j.val = expectedResidual 1 32 j.val := by decide +kernel
theorem dd_check_1_32 : expectedRowCheck 1 32 = true := by decide +kernel
theorem list_length_1_32 : (listFactorRows 1 32).length ≤ 197 := by decide +kernel
#check gram_check_1_32

theorem gram_check_1_33 : ∀ j : Fin 34,
    listResidual 1 33 j.val = expectedResidual 1 33 j.val := by decide +kernel
theorem dd_check_1_33 : expectedRowCheck 1 33 = true := by decide +kernel
theorem list_length_1_33 : (listFactorRows 1 33).length ≤ 197 := by decide +kernel
#check gram_check_1_33

theorem gram_check_1_34 : ∀ j : Fin 35,
    listResidual 1 34 j.val = expectedResidual 1 34 j.val := by decide +kernel
theorem dd_check_1_34 : expectedRowCheck 1 34 = true := by decide +kernel
theorem list_length_1_34 : (listFactorRows 1 34).length ≤ 197 := by decide +kernel
#check gram_check_1_34

theorem gram_check_1_35 : ∀ j : Fin 36,
    listResidual 1 35 j.val = expectedResidual 1 35 j.val := by decide +kernel
theorem dd_check_1_35 : expectedRowCheck 1 35 = true := by decide +kernel
theorem list_length_1_35 : (listFactorRows 1 35).length ≤ 197 := by decide +kernel
#check gram_check_1_35

theorem gram_check_1_36 : ∀ j : Fin 37,
    listResidual 1 36 j.val = expectedResidual 1 36 j.val := by decide +kernel
theorem dd_check_1_36 : expectedRowCheck 1 36 = true := by decide +kernel
theorem list_length_1_36 : (listFactorRows 1 36).length ≤ 197 := by decide +kernel
#check gram_check_1_36

theorem gram_check_1_37 : ∀ j : Fin 38,
    listResidual 1 37 j.val = expectedResidual 1 37 j.val := by decide +kernel
theorem dd_check_1_37 : expectedRowCheck 1 37 = true := by decide +kernel
theorem list_length_1_37 : (listFactorRows 1 37).length ≤ 197 := by decide +kernel
#check gram_check_1_37

theorem gram_check_1_38 : ∀ j : Fin 39,
    listResidual 1 38 j.val = expectedResidual 1 38 j.val := by decide +kernel
theorem dd_check_1_38 : expectedRowCheck 1 38 = true := by decide +kernel
theorem list_length_1_38 : (listFactorRows 1 38).length ≤ 197 := by decide +kernel
#check gram_check_1_38

theorem gram_check_1_39 : ∀ j : Fin 40,
    listResidual 1 39 j.val = expectedResidual 1 39 j.val := by decide +kernel
theorem dd_check_1_39 : expectedRowCheck 1 39 = true := by decide +kernel
theorem list_length_1_39 : (listFactorRows 1 39).length ≤ 197 := by decide +kernel
#check gram_check_1_39

end Hedetniemi.Round4
