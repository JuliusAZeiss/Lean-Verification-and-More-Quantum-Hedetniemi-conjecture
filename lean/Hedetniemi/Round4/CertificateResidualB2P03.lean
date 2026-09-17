import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_24 : ∀ j : Fin 25,
    listResidual 2 24 j.val = expectedResidual 2 24 j.val := by decide +kernel
theorem dd_check_2_24 : expectedRowCheck 2 24 = true := by decide +kernel
theorem list_length_2_24 : (listFactorRows 2 24).length ≤ 197 := by decide +kernel
#check gram_check_2_24

theorem gram_check_2_25 : ∀ j : Fin 26,
    listResidual 2 25 j.val = expectedResidual 2 25 j.val := by decide +kernel
theorem dd_check_2_25 : expectedRowCheck 2 25 = true := by decide +kernel
theorem list_length_2_25 : (listFactorRows 2 25).length ≤ 197 := by decide +kernel
#check gram_check_2_25

theorem gram_check_2_26 : ∀ j : Fin 27,
    listResidual 2 26 j.val = expectedResidual 2 26 j.val := by decide +kernel
theorem dd_check_2_26 : expectedRowCheck 2 26 = true := by decide +kernel
theorem list_length_2_26 : (listFactorRows 2 26).length ≤ 197 := by decide +kernel
#check gram_check_2_26

theorem gram_check_2_27 : ∀ j : Fin 28,
    listResidual 2 27 j.val = expectedResidual 2 27 j.val := by decide +kernel
theorem dd_check_2_27 : expectedRowCheck 2 27 = true := by decide +kernel
theorem list_length_2_27 : (listFactorRows 2 27).length ≤ 197 := by decide +kernel
#check gram_check_2_27

theorem gram_check_2_28 : ∀ j : Fin 29,
    listResidual 2 28 j.val = expectedResidual 2 28 j.val := by decide +kernel
theorem dd_check_2_28 : expectedRowCheck 2 28 = true := by decide +kernel
theorem list_length_2_28 : (listFactorRows 2 28).length ≤ 197 := by decide +kernel
#check gram_check_2_28

theorem gram_check_2_29 : ∀ j : Fin 30,
    listResidual 2 29 j.val = expectedResidual 2 29 j.val := by decide +kernel
theorem dd_check_2_29 : expectedRowCheck 2 29 = true := by decide +kernel
theorem list_length_2_29 : (listFactorRows 2 29).length ≤ 197 := by decide +kernel
#check gram_check_2_29

theorem gram_check_2_30 : ∀ j : Fin 31,
    listResidual 2 30 j.val = expectedResidual 2 30 j.val := by decide +kernel
theorem dd_check_2_30 : expectedRowCheck 2 30 = true := by decide +kernel
theorem list_length_2_30 : (listFactorRows 2 30).length ≤ 197 := by decide +kernel
#check gram_check_2_30

theorem gram_check_2_31 : ∀ j : Fin 32,
    listResidual 2 31 j.val = expectedResidual 2 31 j.val := by decide +kernel
theorem dd_check_2_31 : expectedRowCheck 2 31 = true := by decide +kernel
theorem list_length_2_31 : (listFactorRows 2 31).length ≤ 197 := by decide +kernel
#check gram_check_2_31

end Hedetniemi.Round4
