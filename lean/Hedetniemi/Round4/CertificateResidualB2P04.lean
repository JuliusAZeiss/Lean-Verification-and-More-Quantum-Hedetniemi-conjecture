import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_32 : ∀ j : Fin 33,
    listResidual 2 32 j.val = expectedResidual 2 32 j.val := by decide +kernel
theorem dd_check_2_32 : expectedRowCheck 2 32 = true := by decide +kernel
theorem list_length_2_32 : (listFactorRows 2 32).length ≤ 197 := by decide +kernel
#check gram_check_2_32

theorem gram_check_2_33 : ∀ j : Fin 34,
    listResidual 2 33 j.val = expectedResidual 2 33 j.val := by decide +kernel
theorem dd_check_2_33 : expectedRowCheck 2 33 = true := by decide +kernel
theorem list_length_2_33 : (listFactorRows 2 33).length ≤ 197 := by decide +kernel
#check gram_check_2_33

theorem gram_check_2_34 : ∀ j : Fin 35,
    listResidual 2 34 j.val = expectedResidual 2 34 j.val := by decide +kernel
theorem dd_check_2_34 : expectedRowCheck 2 34 = true := by decide +kernel
theorem list_length_2_34 : (listFactorRows 2 34).length ≤ 197 := by decide +kernel
#check gram_check_2_34

theorem gram_check_2_35 : ∀ j : Fin 36,
    listResidual 2 35 j.val = expectedResidual 2 35 j.val := by decide +kernel
theorem dd_check_2_35 : expectedRowCheck 2 35 = true := by decide +kernel
theorem list_length_2_35 : (listFactorRows 2 35).length ≤ 197 := by decide +kernel
#check gram_check_2_35

theorem gram_check_2_36 : ∀ j : Fin 37,
    listResidual 2 36 j.val = expectedResidual 2 36 j.val := by decide +kernel
theorem dd_check_2_36 : expectedRowCheck 2 36 = true := by decide +kernel
theorem list_length_2_36 : (listFactorRows 2 36).length ≤ 197 := by decide +kernel
#check gram_check_2_36

theorem gram_check_2_37 : ∀ j : Fin 38,
    listResidual 2 37 j.val = expectedResidual 2 37 j.val := by decide +kernel
theorem dd_check_2_37 : expectedRowCheck 2 37 = true := by decide +kernel
theorem list_length_2_37 : (listFactorRows 2 37).length ≤ 197 := by decide +kernel
#check gram_check_2_37

theorem gram_check_2_38 : ∀ j : Fin 39,
    listResidual 2 38 j.val = expectedResidual 2 38 j.val := by decide +kernel
theorem dd_check_2_38 : expectedRowCheck 2 38 = true := by decide +kernel
theorem list_length_2_38 : (listFactorRows 2 38).length ≤ 197 := by decide +kernel
#check gram_check_2_38

theorem gram_check_2_39 : ∀ j : Fin 40,
    listResidual 2 39 j.val = expectedResidual 2 39 j.val := by decide +kernel
theorem dd_check_2_39 : expectedRowCheck 2 39 = true := by decide +kernel
theorem list_length_2_39 : (listFactorRows 2 39).length ≤ 197 := by decide +kernel
#check gram_check_2_39

end Hedetniemi.Round4
