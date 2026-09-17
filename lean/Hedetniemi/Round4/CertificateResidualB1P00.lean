import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_0 : ∀ j : Fin 1,
    listResidual 1 0 j.val = expectedResidual 1 0 j.val := by decide +kernel
theorem dd_check_1_0 : expectedRowCheck 1 0 = true := by decide +kernel
theorem list_length_1_0 : (listFactorRows 1 0).length ≤ 197 := by decide +kernel
#check gram_check_1_0

theorem gram_check_1_1 : ∀ j : Fin 2,
    listResidual 1 1 j.val = expectedResidual 1 1 j.val := by decide +kernel
theorem dd_check_1_1 : expectedRowCheck 1 1 = true := by decide +kernel
theorem list_length_1_1 : (listFactorRows 1 1).length ≤ 197 := by decide +kernel
#check gram_check_1_1

theorem gram_check_1_2 : ∀ j : Fin 3,
    listResidual 1 2 j.val = expectedResidual 1 2 j.val := by decide +kernel
theorem dd_check_1_2 : expectedRowCheck 1 2 = true := by decide +kernel
theorem list_length_1_2 : (listFactorRows 1 2).length ≤ 197 := by decide +kernel
#check gram_check_1_2

theorem gram_check_1_3 : ∀ j : Fin 4,
    listResidual 1 3 j.val = expectedResidual 1 3 j.val := by decide +kernel
theorem dd_check_1_3 : expectedRowCheck 1 3 = true := by decide +kernel
theorem list_length_1_3 : (listFactorRows 1 3).length ≤ 197 := by decide +kernel
#check gram_check_1_3

theorem gram_check_1_4 : ∀ j : Fin 5,
    listResidual 1 4 j.val = expectedResidual 1 4 j.val := by decide +kernel
theorem dd_check_1_4 : expectedRowCheck 1 4 = true := by decide +kernel
theorem list_length_1_4 : (listFactorRows 1 4).length ≤ 197 := by decide +kernel
#check gram_check_1_4

theorem gram_check_1_5 : ∀ j : Fin 6,
    listResidual 1 5 j.val = expectedResidual 1 5 j.val := by decide +kernel
theorem dd_check_1_5 : expectedRowCheck 1 5 = true := by decide +kernel
theorem list_length_1_5 : (listFactorRows 1 5).length ≤ 197 := by decide +kernel
#check gram_check_1_5

theorem gram_check_1_6 : ∀ j : Fin 7,
    listResidual 1 6 j.val = expectedResidual 1 6 j.val := by decide +kernel
theorem dd_check_1_6 : expectedRowCheck 1 6 = true := by decide +kernel
theorem list_length_1_6 : (listFactorRows 1 6).length ≤ 197 := by decide +kernel
#check gram_check_1_6

theorem gram_check_1_7 : ∀ j : Fin 8,
    listResidual 1 7 j.val = expectedResidual 1 7 j.val := by decide +kernel
theorem dd_check_1_7 : expectedRowCheck 1 7 = true := by decide +kernel
theorem list_length_1_7 : (listFactorRows 1 7).length ≤ 197 := by decide +kernel
#check gram_check_1_7

end Hedetniemi.Round4
