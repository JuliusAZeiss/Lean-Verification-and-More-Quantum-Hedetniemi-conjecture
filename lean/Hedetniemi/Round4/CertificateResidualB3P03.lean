import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_24 : ∀ j : Fin 25,
    listResidual 3 24 j.val = expectedResidual 3 24 j.val := by decide +kernel
theorem dd_check_3_24 : expectedRowCheck 3 24 = true := by decide +kernel
theorem list_length_3_24 : (listFactorRows 3 24).length ≤ 197 := by decide +kernel
#check gram_check_3_24

theorem gram_check_3_25 : ∀ j : Fin 26,
    listResidual 3 25 j.val = expectedResidual 3 25 j.val := by decide +kernel
theorem dd_check_3_25 : expectedRowCheck 3 25 = true := by decide +kernel
theorem list_length_3_25 : (listFactorRows 3 25).length ≤ 197 := by decide +kernel
#check gram_check_3_25

theorem gram_check_3_26 : ∀ j : Fin 27,
    listResidual 3 26 j.val = expectedResidual 3 26 j.val := by decide +kernel
theorem dd_check_3_26 : expectedRowCheck 3 26 = true := by decide +kernel
theorem list_length_3_26 : (listFactorRows 3 26).length ≤ 197 := by decide +kernel
#check gram_check_3_26

theorem gram_check_3_27 : ∀ j : Fin 28,
    listResidual 3 27 j.val = expectedResidual 3 27 j.val := by decide +kernel
theorem dd_check_3_27 : expectedRowCheck 3 27 = true := by decide +kernel
theorem list_length_3_27 : (listFactorRows 3 27).length ≤ 197 := by decide +kernel
#check gram_check_3_27

theorem gram_check_3_28 : ∀ j : Fin 29,
    listResidual 3 28 j.val = expectedResidual 3 28 j.val := by decide +kernel
theorem dd_check_3_28 : expectedRowCheck 3 28 = true := by decide +kernel
theorem list_length_3_28 : (listFactorRows 3 28).length ≤ 197 := by decide +kernel
#check gram_check_3_28

theorem gram_check_3_29 : ∀ j : Fin 30,
    listResidual 3 29 j.val = expectedResidual 3 29 j.val := by decide +kernel
theorem dd_check_3_29 : expectedRowCheck 3 29 = true := by decide +kernel
theorem list_length_3_29 : (listFactorRows 3 29).length ≤ 197 := by decide +kernel
#check gram_check_3_29

theorem gram_check_3_30 : ∀ j : Fin 31,
    listResidual 3 30 j.val = expectedResidual 3 30 j.val := by decide +kernel
theorem dd_check_3_30 : expectedRowCheck 3 30 = true := by decide +kernel
theorem list_length_3_30 : (listFactorRows 3 30).length ≤ 197 := by decide +kernel
#check gram_check_3_30

theorem gram_check_3_31 : ∀ j : Fin 32,
    listResidual 3 31 j.val = expectedResidual 3 31 j.val := by decide +kernel
theorem dd_check_3_31 : expectedRowCheck 3 31 = true := by decide +kernel
theorem list_length_3_31 : (listFactorRows 3 31).length ≤ 197 := by decide +kernel
#check gram_check_3_31

end Hedetniemi.Round4
