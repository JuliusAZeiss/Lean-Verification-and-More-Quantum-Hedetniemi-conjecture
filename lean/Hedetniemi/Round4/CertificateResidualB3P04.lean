import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_32 : ∀ j : Fin 33,
    listResidual 3 32 j.val = expectedResidual 3 32 j.val := by decide +kernel
theorem dd_check_3_32 : expectedRowCheck 3 32 = true := by decide +kernel
theorem list_length_3_32 : (listFactorRows 3 32).length ≤ 197 := by decide +kernel
#check gram_check_3_32

theorem gram_check_3_33 : ∀ j : Fin 34,
    listResidual 3 33 j.val = expectedResidual 3 33 j.val := by decide +kernel
theorem dd_check_3_33 : expectedRowCheck 3 33 = true := by decide +kernel
theorem list_length_3_33 : (listFactorRows 3 33).length ≤ 197 := by decide +kernel
#check gram_check_3_33

theorem gram_check_3_34 : ∀ j : Fin 35,
    listResidual 3 34 j.val = expectedResidual 3 34 j.val := by decide +kernel
theorem dd_check_3_34 : expectedRowCheck 3 34 = true := by decide +kernel
theorem list_length_3_34 : (listFactorRows 3 34).length ≤ 197 := by decide +kernel
#check gram_check_3_34

theorem gram_check_3_35 : ∀ j : Fin 36,
    listResidual 3 35 j.val = expectedResidual 3 35 j.val := by decide +kernel
theorem dd_check_3_35 : expectedRowCheck 3 35 = true := by decide +kernel
theorem list_length_3_35 : (listFactorRows 3 35).length ≤ 197 := by decide +kernel
#check gram_check_3_35

theorem gram_check_3_36 : ∀ j : Fin 37,
    listResidual 3 36 j.val = expectedResidual 3 36 j.val := by decide +kernel
theorem dd_check_3_36 : expectedRowCheck 3 36 = true := by decide +kernel
theorem list_length_3_36 : (listFactorRows 3 36).length ≤ 197 := by decide +kernel
#check gram_check_3_36

theorem gram_check_3_37 : ∀ j : Fin 38,
    listResidual 3 37 j.val = expectedResidual 3 37 j.val := by decide +kernel
theorem dd_check_3_37 : expectedRowCheck 3 37 = true := by decide +kernel
theorem list_length_3_37 : (listFactorRows 3 37).length ≤ 197 := by decide +kernel
#check gram_check_3_37

theorem gram_check_3_38 : ∀ j : Fin 39,
    listResidual 3 38 j.val = expectedResidual 3 38 j.val := by decide +kernel
theorem dd_check_3_38 : expectedRowCheck 3 38 = true := by decide +kernel
theorem list_length_3_38 : (listFactorRows 3 38).length ≤ 197 := by decide +kernel
#check gram_check_3_38

theorem gram_check_3_39 : ∀ j : Fin 40,
    listResidual 3 39 j.val = expectedResidual 3 39 j.val := by decide +kernel
theorem dd_check_3_39 : expectedRowCheck 3 39 = true := by decide +kernel
theorem list_length_3_39 : (listFactorRows 3 39).length ≤ 197 := by decide +kernel
#check gram_check_3_39

end Hedetniemi.Round4
