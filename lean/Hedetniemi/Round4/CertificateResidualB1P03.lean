import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_24 : ∀ j : Fin 25,
    listResidual 1 24 j.val = expectedResidual 1 24 j.val := by decide +kernel
theorem dd_check_1_24 : expectedRowCheck 1 24 = true := by decide +kernel
theorem list_length_1_24 : (listFactorRows 1 24).length ≤ 197 := by decide +kernel
#check gram_check_1_24

theorem gram_check_1_25 : ∀ j : Fin 26,
    listResidual 1 25 j.val = expectedResidual 1 25 j.val := by decide +kernel
theorem dd_check_1_25 : expectedRowCheck 1 25 = true := by decide +kernel
theorem list_length_1_25 : (listFactorRows 1 25).length ≤ 197 := by decide +kernel
#check gram_check_1_25

theorem gram_check_1_26 : ∀ j : Fin 27,
    listResidual 1 26 j.val = expectedResidual 1 26 j.val := by decide +kernel
theorem dd_check_1_26 : expectedRowCheck 1 26 = true := by decide +kernel
theorem list_length_1_26 : (listFactorRows 1 26).length ≤ 197 := by decide +kernel
#check gram_check_1_26

theorem gram_check_1_27 : ∀ j : Fin 28,
    listResidual 1 27 j.val = expectedResidual 1 27 j.val := by decide +kernel
theorem dd_check_1_27 : expectedRowCheck 1 27 = true := by decide +kernel
theorem list_length_1_27 : (listFactorRows 1 27).length ≤ 197 := by decide +kernel
#check gram_check_1_27

theorem gram_check_1_28 : ∀ j : Fin 29,
    listResidual 1 28 j.val = expectedResidual 1 28 j.val := by decide +kernel
theorem dd_check_1_28 : expectedRowCheck 1 28 = true := by decide +kernel
theorem list_length_1_28 : (listFactorRows 1 28).length ≤ 197 := by decide +kernel
#check gram_check_1_28

theorem gram_check_1_29 : ∀ j : Fin 30,
    listResidual 1 29 j.val = expectedResidual 1 29 j.val := by decide +kernel
theorem dd_check_1_29 : expectedRowCheck 1 29 = true := by decide +kernel
theorem list_length_1_29 : (listFactorRows 1 29).length ≤ 197 := by decide +kernel
#check gram_check_1_29

theorem gram_check_1_30 : ∀ j : Fin 31,
    listResidual 1 30 j.val = expectedResidual 1 30 j.val := by decide +kernel
theorem dd_check_1_30 : expectedRowCheck 1 30 = true := by decide +kernel
theorem list_length_1_30 : (listFactorRows 1 30).length ≤ 197 := by decide +kernel
#check gram_check_1_30

theorem gram_check_1_31 : ∀ j : Fin 32,
    listResidual 1 31 j.val = expectedResidual 1 31 j.val := by decide +kernel
theorem dd_check_1_31 : expectedRowCheck 1 31 = true := by decide +kernel
theorem list_length_1_31 : (listFactorRows 1 31).length ≤ 197 := by decide +kernel
#check gram_check_1_31

end Hedetniemi.Round4
