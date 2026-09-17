import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_8 : ∀ j : Fin 9,
    listResidual 2 8 j.val = expectedResidual 2 8 j.val := by decide +kernel
theorem dd_check_2_8 : expectedRowCheck 2 8 = true := by decide +kernel
theorem list_length_2_8 : (listFactorRows 2 8).length ≤ 197 := by decide +kernel
#check gram_check_2_8

theorem gram_check_2_9 : ∀ j : Fin 10,
    listResidual 2 9 j.val = expectedResidual 2 9 j.val := by decide +kernel
theorem dd_check_2_9 : expectedRowCheck 2 9 = true := by decide +kernel
theorem list_length_2_9 : (listFactorRows 2 9).length ≤ 197 := by decide +kernel
#check gram_check_2_9

theorem gram_check_2_10 : ∀ j : Fin 11,
    listResidual 2 10 j.val = expectedResidual 2 10 j.val := by decide +kernel
theorem dd_check_2_10 : expectedRowCheck 2 10 = true := by decide +kernel
theorem list_length_2_10 : (listFactorRows 2 10).length ≤ 197 := by decide +kernel
#check gram_check_2_10

theorem gram_check_2_11 : ∀ j : Fin 12,
    listResidual 2 11 j.val = expectedResidual 2 11 j.val := by decide +kernel
theorem dd_check_2_11 : expectedRowCheck 2 11 = true := by decide +kernel
theorem list_length_2_11 : (listFactorRows 2 11).length ≤ 197 := by decide +kernel
#check gram_check_2_11

theorem gram_check_2_12 : ∀ j : Fin 13,
    listResidual 2 12 j.val = expectedResidual 2 12 j.val := by decide +kernel
theorem dd_check_2_12 : expectedRowCheck 2 12 = true := by decide +kernel
theorem list_length_2_12 : (listFactorRows 2 12).length ≤ 197 := by decide +kernel
#check gram_check_2_12

theorem gram_check_2_13 : ∀ j : Fin 14,
    listResidual 2 13 j.val = expectedResidual 2 13 j.val := by decide +kernel
theorem dd_check_2_13 : expectedRowCheck 2 13 = true := by decide +kernel
theorem list_length_2_13 : (listFactorRows 2 13).length ≤ 197 := by decide +kernel
#check gram_check_2_13

theorem gram_check_2_14 : ∀ j : Fin 15,
    listResidual 2 14 j.val = expectedResidual 2 14 j.val := by decide +kernel
theorem dd_check_2_14 : expectedRowCheck 2 14 = true := by decide +kernel
theorem list_length_2_14 : (listFactorRows 2 14).length ≤ 197 := by decide +kernel
#check gram_check_2_14

theorem gram_check_2_15 : ∀ j : Fin 16,
    listResidual 2 15 j.val = expectedResidual 2 15 j.val := by decide +kernel
theorem dd_check_2_15 : expectedRowCheck 2 15 = true := by decide +kernel
theorem list_length_2_15 : (listFactorRows 2 15).length ≤ 197 := by decide +kernel
#check gram_check_2_15

end Hedetniemi.Round4
