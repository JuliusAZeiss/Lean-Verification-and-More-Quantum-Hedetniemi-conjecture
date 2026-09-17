import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_0 : ∀ j : Fin 1,
    listResidual 0 0 j.val = expectedResidual 0 0 j.val := by decide +kernel
theorem dd_check_0_0 : expectedRowCheck 0 0 = true := by decide +kernel
theorem list_length_0_0 : (listFactorRows 0 0).length ≤ 197 := by decide +kernel
#check gram_check_0_0

theorem gram_check_0_1 : ∀ j : Fin 2,
    listResidual 0 1 j.val = expectedResidual 0 1 j.val := by decide +kernel
theorem dd_check_0_1 : expectedRowCheck 0 1 = true := by decide +kernel
theorem list_length_0_1 : (listFactorRows 0 1).length ≤ 197 := by decide +kernel
#check gram_check_0_1

theorem gram_check_0_2 : ∀ j : Fin 3,
    listResidual 0 2 j.val = expectedResidual 0 2 j.val := by decide +kernel
theorem dd_check_0_2 : expectedRowCheck 0 2 = true := by decide +kernel
theorem list_length_0_2 : (listFactorRows 0 2).length ≤ 197 := by decide +kernel
#check gram_check_0_2

theorem gram_check_0_3 : ∀ j : Fin 4,
    listResidual 0 3 j.val = expectedResidual 0 3 j.val := by decide +kernel
theorem dd_check_0_3 : expectedRowCheck 0 3 = true := by decide +kernel
theorem list_length_0_3 : (listFactorRows 0 3).length ≤ 197 := by decide +kernel
#check gram_check_0_3

theorem gram_check_0_4 : ∀ j : Fin 5,
    listResidual 0 4 j.val = expectedResidual 0 4 j.val := by decide +kernel
theorem dd_check_0_4 : expectedRowCheck 0 4 = true := by decide +kernel
theorem list_length_0_4 : (listFactorRows 0 4).length ≤ 197 := by decide +kernel
#check gram_check_0_4

theorem gram_check_0_5 : ∀ j : Fin 6,
    listResidual 0 5 j.val = expectedResidual 0 5 j.val := by decide +kernel
theorem dd_check_0_5 : expectedRowCheck 0 5 = true := by decide +kernel
theorem list_length_0_5 : (listFactorRows 0 5).length ≤ 197 := by decide +kernel
#check gram_check_0_5

theorem gram_check_0_6 : ∀ j : Fin 7,
    listResidual 0 6 j.val = expectedResidual 0 6 j.val := by decide +kernel
theorem dd_check_0_6 : expectedRowCheck 0 6 = true := by decide +kernel
theorem list_length_0_6 : (listFactorRows 0 6).length ≤ 197 := by decide +kernel
#check gram_check_0_6

theorem gram_check_0_7 : ∀ j : Fin 8,
    listResidual 0 7 j.val = expectedResidual 0 7 j.val := by decide +kernel
theorem dd_check_0_7 : expectedRowCheck 0 7 = true := by decide +kernel
theorem list_length_0_7 : (listFactorRows 0 7).length ≤ 197 := by decide +kernel
#check gram_check_0_7

end Hedetniemi.Round4
