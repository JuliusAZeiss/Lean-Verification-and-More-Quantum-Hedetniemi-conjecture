import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_0 : ∀ j : Fin 1,
    listResidual 3 0 j.val = expectedResidual 3 0 j.val := by decide +kernel
theorem dd_check_3_0 : expectedRowCheck 3 0 = true := by decide +kernel
theorem list_length_3_0 : (listFactorRows 3 0).length ≤ 197 := by decide +kernel
#check gram_check_3_0

theorem gram_check_3_1 : ∀ j : Fin 2,
    listResidual 3 1 j.val = expectedResidual 3 1 j.val := by decide +kernel
theorem dd_check_3_1 : expectedRowCheck 3 1 = true := by decide +kernel
theorem list_length_3_1 : (listFactorRows 3 1).length ≤ 197 := by decide +kernel
#check gram_check_3_1

theorem gram_check_3_2 : ∀ j : Fin 3,
    listResidual 3 2 j.val = expectedResidual 3 2 j.val := by decide +kernel
theorem dd_check_3_2 : expectedRowCheck 3 2 = true := by decide +kernel
theorem list_length_3_2 : (listFactorRows 3 2).length ≤ 197 := by decide +kernel
#check gram_check_3_2

theorem gram_check_3_3 : ∀ j : Fin 4,
    listResidual 3 3 j.val = expectedResidual 3 3 j.val := by decide +kernel
theorem dd_check_3_3 : expectedRowCheck 3 3 = true := by decide +kernel
theorem list_length_3_3 : (listFactorRows 3 3).length ≤ 197 := by decide +kernel
#check gram_check_3_3

theorem gram_check_3_4 : ∀ j : Fin 5,
    listResidual 3 4 j.val = expectedResidual 3 4 j.val := by decide +kernel
theorem dd_check_3_4 : expectedRowCheck 3 4 = true := by decide +kernel
theorem list_length_3_4 : (listFactorRows 3 4).length ≤ 197 := by decide +kernel
#check gram_check_3_4

theorem gram_check_3_5 : ∀ j : Fin 6,
    listResidual 3 5 j.val = expectedResidual 3 5 j.val := by decide +kernel
theorem dd_check_3_5 : expectedRowCheck 3 5 = true := by decide +kernel
theorem list_length_3_5 : (listFactorRows 3 5).length ≤ 197 := by decide +kernel
#check gram_check_3_5

theorem gram_check_3_6 : ∀ j : Fin 7,
    listResidual 3 6 j.val = expectedResidual 3 6 j.val := by decide +kernel
theorem dd_check_3_6 : expectedRowCheck 3 6 = true := by decide +kernel
theorem list_length_3_6 : (listFactorRows 3 6).length ≤ 197 := by decide +kernel
#check gram_check_3_6

theorem gram_check_3_7 : ∀ j : Fin 8,
    listResidual 3 7 j.val = expectedResidual 3 7 j.val := by decide +kernel
theorem dd_check_3_7 : expectedRowCheck 3 7 = true := by decide +kernel
theorem list_length_3_7 : (listFactorRows 3 7).length ≤ 197 := by decide +kernel
#check gram_check_3_7

end Hedetniemi.Round4
