import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_8 : ∀ j : Fin 9,
    listResidual 1 8 j.val = expectedResidual 1 8 j.val := by decide +kernel
theorem dd_check_1_8 : expectedRowCheck 1 8 = true := by decide +kernel
theorem list_length_1_8 : (listFactorRows 1 8).length ≤ 197 := by decide +kernel
#check gram_check_1_8

theorem gram_check_1_9 : ∀ j : Fin 10,
    listResidual 1 9 j.val = expectedResidual 1 9 j.val := by decide +kernel
theorem dd_check_1_9 : expectedRowCheck 1 9 = true := by decide +kernel
theorem list_length_1_9 : (listFactorRows 1 9).length ≤ 197 := by decide +kernel
#check gram_check_1_9

theorem gram_check_1_10 : ∀ j : Fin 11,
    listResidual 1 10 j.val = expectedResidual 1 10 j.val := by decide +kernel
theorem dd_check_1_10 : expectedRowCheck 1 10 = true := by decide +kernel
theorem list_length_1_10 : (listFactorRows 1 10).length ≤ 197 := by decide +kernel
#check gram_check_1_10

theorem gram_check_1_11 : ∀ j : Fin 12,
    listResidual 1 11 j.val = expectedResidual 1 11 j.val := by decide +kernel
theorem dd_check_1_11 : expectedRowCheck 1 11 = true := by decide +kernel
theorem list_length_1_11 : (listFactorRows 1 11).length ≤ 197 := by decide +kernel
#check gram_check_1_11

theorem gram_check_1_12 : ∀ j : Fin 13,
    listResidual 1 12 j.val = expectedResidual 1 12 j.val := by decide +kernel
theorem dd_check_1_12 : expectedRowCheck 1 12 = true := by decide +kernel
theorem list_length_1_12 : (listFactorRows 1 12).length ≤ 197 := by decide +kernel
#check gram_check_1_12

theorem gram_check_1_13 : ∀ j : Fin 14,
    listResidual 1 13 j.val = expectedResidual 1 13 j.val := by decide +kernel
theorem dd_check_1_13 : expectedRowCheck 1 13 = true := by decide +kernel
theorem list_length_1_13 : (listFactorRows 1 13).length ≤ 197 := by decide +kernel
#check gram_check_1_13

theorem gram_check_1_14 : ∀ j : Fin 15,
    listResidual 1 14 j.val = expectedResidual 1 14 j.val := by decide +kernel
theorem dd_check_1_14 : expectedRowCheck 1 14 = true := by decide +kernel
theorem list_length_1_14 : (listFactorRows 1 14).length ≤ 197 := by decide +kernel
#check gram_check_1_14

theorem gram_check_1_15 : ∀ j : Fin 16,
    listResidual 1 15 j.val = expectedResidual 1 15 j.val := by decide +kernel
theorem dd_check_1_15 : expectedRowCheck 1 15 = true := by decide +kernel
theorem list_length_1_15 : (listFactorRows 1 15).length ≤ 197 := by decide +kernel
#check gram_check_1_15

end Hedetniemi.Round4
