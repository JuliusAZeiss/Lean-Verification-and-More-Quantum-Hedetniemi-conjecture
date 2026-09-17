import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_8 : ∀ j : Fin 9,
    listResidual 3 8 j.val = expectedResidual 3 8 j.val := by decide +kernel
theorem dd_check_3_8 : expectedRowCheck 3 8 = true := by decide +kernel
theorem list_length_3_8 : (listFactorRows 3 8).length ≤ 197 := by decide +kernel
#check gram_check_3_8

theorem gram_check_3_9 : ∀ j : Fin 10,
    listResidual 3 9 j.val = expectedResidual 3 9 j.val := by decide +kernel
theorem dd_check_3_9 : expectedRowCheck 3 9 = true := by decide +kernel
theorem list_length_3_9 : (listFactorRows 3 9).length ≤ 197 := by decide +kernel
#check gram_check_3_9

theorem gram_check_3_10 : ∀ j : Fin 11,
    listResidual 3 10 j.val = expectedResidual 3 10 j.val := by decide +kernel
theorem dd_check_3_10 : expectedRowCheck 3 10 = true := by decide +kernel
theorem list_length_3_10 : (listFactorRows 3 10).length ≤ 197 := by decide +kernel
#check gram_check_3_10

theorem gram_check_3_11 : ∀ j : Fin 12,
    listResidual 3 11 j.val = expectedResidual 3 11 j.val := by decide +kernel
theorem dd_check_3_11 : expectedRowCheck 3 11 = true := by decide +kernel
theorem list_length_3_11 : (listFactorRows 3 11).length ≤ 197 := by decide +kernel
#check gram_check_3_11

theorem gram_check_3_12 : ∀ j : Fin 13,
    listResidual 3 12 j.val = expectedResidual 3 12 j.val := by decide +kernel
theorem dd_check_3_12 : expectedRowCheck 3 12 = true := by decide +kernel
theorem list_length_3_12 : (listFactorRows 3 12).length ≤ 197 := by decide +kernel
#check gram_check_3_12

theorem gram_check_3_13 : ∀ j : Fin 14,
    listResidual 3 13 j.val = expectedResidual 3 13 j.val := by decide +kernel
theorem dd_check_3_13 : expectedRowCheck 3 13 = true := by decide +kernel
theorem list_length_3_13 : (listFactorRows 3 13).length ≤ 197 := by decide +kernel
#check gram_check_3_13

theorem gram_check_3_14 : ∀ j : Fin 15,
    listResidual 3 14 j.val = expectedResidual 3 14 j.val := by decide +kernel
theorem dd_check_3_14 : expectedRowCheck 3 14 = true := by decide +kernel
theorem list_length_3_14 : (listFactorRows 3 14).length ≤ 197 := by decide +kernel
#check gram_check_3_14

theorem gram_check_3_15 : ∀ j : Fin 16,
    listResidual 3 15 j.val = expectedResidual 3 15 j.val := by decide +kernel
theorem dd_check_3_15 : expectedRowCheck 3 15 = true := by decide +kernel
theorem list_length_3_15 : (listFactorRows 3 15).length ≤ 197 := by decide +kernel
#check gram_check_3_15

end Hedetniemi.Round4
