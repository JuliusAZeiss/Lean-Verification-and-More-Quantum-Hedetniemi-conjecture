import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_0 : ∀ j : Fin 1,
    listResidual 2 0 j.val = expectedResidual 2 0 j.val := by decide +kernel
theorem dd_check_2_0 : expectedRowCheck 2 0 = true := by decide +kernel
theorem list_length_2_0 : (listFactorRows 2 0).length ≤ 197 := by decide +kernel
#check gram_check_2_0

theorem gram_check_2_1 : ∀ j : Fin 2,
    listResidual 2 1 j.val = expectedResidual 2 1 j.val := by decide +kernel
theorem dd_check_2_1 : expectedRowCheck 2 1 = true := by decide +kernel
theorem list_length_2_1 : (listFactorRows 2 1).length ≤ 197 := by decide +kernel
#check gram_check_2_1

theorem gram_check_2_2 : ∀ j : Fin 3,
    listResidual 2 2 j.val = expectedResidual 2 2 j.val := by decide +kernel
theorem dd_check_2_2 : expectedRowCheck 2 2 = true := by decide +kernel
theorem list_length_2_2 : (listFactorRows 2 2).length ≤ 197 := by decide +kernel
#check gram_check_2_2

theorem gram_check_2_3 : ∀ j : Fin 4,
    listResidual 2 3 j.val = expectedResidual 2 3 j.val := by decide +kernel
theorem dd_check_2_3 : expectedRowCheck 2 3 = true := by decide +kernel
theorem list_length_2_3 : (listFactorRows 2 3).length ≤ 197 := by decide +kernel
#check gram_check_2_3

theorem gram_check_2_4 : ∀ j : Fin 5,
    listResidual 2 4 j.val = expectedResidual 2 4 j.val := by decide +kernel
theorem dd_check_2_4 : expectedRowCheck 2 4 = true := by decide +kernel
theorem list_length_2_4 : (listFactorRows 2 4).length ≤ 197 := by decide +kernel
#check gram_check_2_4

theorem gram_check_2_5 : ∀ j : Fin 6,
    listResidual 2 5 j.val = expectedResidual 2 5 j.val := by decide +kernel
theorem dd_check_2_5 : expectedRowCheck 2 5 = true := by decide +kernel
theorem list_length_2_5 : (listFactorRows 2 5).length ≤ 197 := by decide +kernel
#check gram_check_2_5

theorem gram_check_2_6 : ∀ j : Fin 7,
    listResidual 2 6 j.val = expectedResidual 2 6 j.val := by decide +kernel
theorem dd_check_2_6 : expectedRowCheck 2 6 = true := by decide +kernel
theorem list_length_2_6 : (listFactorRows 2 6).length ≤ 197 := by decide +kernel
#check gram_check_2_6

theorem gram_check_2_7 : ∀ j : Fin 8,
    listResidual 2 7 j.val = expectedResidual 2 7 j.val := by decide +kernel
theorem dd_check_2_7 : expectedRowCheck 2 7 = true := by decide +kernel
theorem list_length_2_7 : (listFactorRows 2 7).length ≤ 197 := by decide +kernel
#check gram_check_2_7

end Hedetniemi.Round4
