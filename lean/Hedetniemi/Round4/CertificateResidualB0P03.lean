import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_24 : ∀ j : Fin 25,
    listResidual 0 24 j.val = expectedResidual 0 24 j.val := by decide +kernel
theorem dd_check_0_24 : expectedRowCheck 0 24 = true := by decide +kernel
theorem list_length_0_24 : (listFactorRows 0 24).length ≤ 197 := by decide +kernel
#check gram_check_0_24

theorem gram_check_0_25 : ∀ j : Fin 26,
    listResidual 0 25 j.val = expectedResidual 0 25 j.val := by decide +kernel
theorem dd_check_0_25 : expectedRowCheck 0 25 = true := by decide +kernel
theorem list_length_0_25 : (listFactorRows 0 25).length ≤ 197 := by decide +kernel
#check gram_check_0_25

theorem gram_check_0_26 : ∀ j : Fin 27,
    listResidual 0 26 j.val = expectedResidual 0 26 j.val := by decide +kernel
theorem dd_check_0_26 : expectedRowCheck 0 26 = true := by decide +kernel
theorem list_length_0_26 : (listFactorRows 0 26).length ≤ 197 := by decide +kernel
#check gram_check_0_26

theorem gram_check_0_27 : ∀ j : Fin 28,
    listResidual 0 27 j.val = expectedResidual 0 27 j.val := by decide +kernel
theorem dd_check_0_27 : expectedRowCheck 0 27 = true := by decide +kernel
theorem list_length_0_27 : (listFactorRows 0 27).length ≤ 197 := by decide +kernel
#check gram_check_0_27

theorem gram_check_0_28 : ∀ j : Fin 29,
    listResidual 0 28 j.val = expectedResidual 0 28 j.val := by decide +kernel
theorem dd_check_0_28 : expectedRowCheck 0 28 = true := by decide +kernel
theorem list_length_0_28 : (listFactorRows 0 28).length ≤ 197 := by decide +kernel
#check gram_check_0_28

theorem gram_check_0_29 : ∀ j : Fin 30,
    listResidual 0 29 j.val = expectedResidual 0 29 j.val := by decide +kernel
theorem dd_check_0_29 : expectedRowCheck 0 29 = true := by decide +kernel
theorem list_length_0_29 : (listFactorRows 0 29).length ≤ 197 := by decide +kernel
#check gram_check_0_29

theorem gram_check_0_30 : ∀ j : Fin 31,
    listResidual 0 30 j.val = expectedResidual 0 30 j.val := by decide +kernel
theorem dd_check_0_30 : expectedRowCheck 0 30 = true := by decide +kernel
theorem list_length_0_30 : (listFactorRows 0 30).length ≤ 197 := by decide +kernel
#check gram_check_0_30

theorem gram_check_0_31 : ∀ j : Fin 32,
    listResidual 0 31 j.val = expectedResidual 0 31 j.val := by decide +kernel
theorem dd_check_0_31 : expectedRowCheck 0 31 = true := by decide +kernel
theorem list_length_0_31 : (listFactorRows 0 31).length ≤ 197 := by decide +kernel
#check gram_check_0_31

end Hedetniemi.Round4
