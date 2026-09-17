import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_32 : ∀ j : Fin 33,
    listResidual 0 32 j.val = expectedResidual 0 32 j.val := by decide +kernel
theorem dd_check_0_32 : expectedRowCheck 0 32 = true := by decide +kernel
theorem list_length_0_32 : (listFactorRows 0 32).length ≤ 197 := by decide +kernel
#check gram_check_0_32

theorem gram_check_0_33 : ∀ j : Fin 34,
    listResidual 0 33 j.val = expectedResidual 0 33 j.val := by decide +kernel
theorem dd_check_0_33 : expectedRowCheck 0 33 = true := by decide +kernel
theorem list_length_0_33 : (listFactorRows 0 33).length ≤ 197 := by decide +kernel
#check gram_check_0_33

theorem gram_check_0_34 : ∀ j : Fin 35,
    listResidual 0 34 j.val = expectedResidual 0 34 j.val := by decide +kernel
theorem dd_check_0_34 : expectedRowCheck 0 34 = true := by decide +kernel
theorem list_length_0_34 : (listFactorRows 0 34).length ≤ 197 := by decide +kernel
#check gram_check_0_34

theorem gram_check_0_35 : ∀ j : Fin 36,
    listResidual 0 35 j.val = expectedResidual 0 35 j.val := by decide +kernel
theorem dd_check_0_35 : expectedRowCheck 0 35 = true := by decide +kernel
theorem list_length_0_35 : (listFactorRows 0 35).length ≤ 197 := by decide +kernel
#check gram_check_0_35

theorem gram_check_0_36 : ∀ j : Fin 37,
    listResidual 0 36 j.val = expectedResidual 0 36 j.val := by decide +kernel
theorem dd_check_0_36 : expectedRowCheck 0 36 = true := by decide +kernel
theorem list_length_0_36 : (listFactorRows 0 36).length ≤ 197 := by decide +kernel
#check gram_check_0_36

theorem gram_check_0_37 : ∀ j : Fin 38,
    listResidual 0 37 j.val = expectedResidual 0 37 j.val := by decide +kernel
theorem dd_check_0_37 : expectedRowCheck 0 37 = true := by decide +kernel
theorem list_length_0_37 : (listFactorRows 0 37).length ≤ 197 := by decide +kernel
#check gram_check_0_37

theorem gram_check_0_38 : ∀ j : Fin 39,
    listResidual 0 38 j.val = expectedResidual 0 38 j.val := by decide +kernel
theorem dd_check_0_38 : expectedRowCheck 0 38 = true := by decide +kernel
theorem list_length_0_38 : (listFactorRows 0 38).length ≤ 197 := by decide +kernel
#check gram_check_0_38

theorem gram_check_0_39 : ∀ j : Fin 40,
    listResidual 0 39 j.val = expectedResidual 0 39 j.val := by decide +kernel
theorem dd_check_0_39 : expectedRowCheck 0 39 = true := by decide +kernel
theorem list_length_0_39 : (listFactorRows 0 39).length ≤ 197 := by decide +kernel
#check gram_check_0_39

end Hedetniemi.Round4
