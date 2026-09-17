import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_8 : ∀ j : Fin 9,
    listResidual 0 8 j.val = expectedResidual 0 8 j.val := by decide +kernel
theorem dd_check_0_8 : expectedRowCheck 0 8 = true := by decide +kernel
theorem list_length_0_8 : (listFactorRows 0 8).length ≤ 197 := by decide +kernel
#check gram_check_0_8

theorem gram_check_0_9 : ∀ j : Fin 10,
    listResidual 0 9 j.val = expectedResidual 0 9 j.val := by decide +kernel
theorem dd_check_0_9 : expectedRowCheck 0 9 = true := by decide +kernel
theorem list_length_0_9 : (listFactorRows 0 9).length ≤ 197 := by decide +kernel
#check gram_check_0_9

theorem gram_check_0_10 : ∀ j : Fin 11,
    listResidual 0 10 j.val = expectedResidual 0 10 j.val := by decide +kernel
theorem dd_check_0_10 : expectedRowCheck 0 10 = true := by decide +kernel
theorem list_length_0_10 : (listFactorRows 0 10).length ≤ 197 := by decide +kernel
#check gram_check_0_10

theorem gram_check_0_11 : ∀ j : Fin 12,
    listResidual 0 11 j.val = expectedResidual 0 11 j.val := by decide +kernel
theorem dd_check_0_11 : expectedRowCheck 0 11 = true := by decide +kernel
theorem list_length_0_11 : (listFactorRows 0 11).length ≤ 197 := by decide +kernel
#check gram_check_0_11

theorem gram_check_0_12 : ∀ j : Fin 13,
    listResidual 0 12 j.val = expectedResidual 0 12 j.val := by decide +kernel
theorem dd_check_0_12 : expectedRowCheck 0 12 = true := by decide +kernel
theorem list_length_0_12 : (listFactorRows 0 12).length ≤ 197 := by decide +kernel
#check gram_check_0_12

theorem gram_check_0_13 : ∀ j : Fin 14,
    listResidual 0 13 j.val = expectedResidual 0 13 j.val := by decide +kernel
theorem dd_check_0_13 : expectedRowCheck 0 13 = true := by decide +kernel
theorem list_length_0_13 : (listFactorRows 0 13).length ≤ 197 := by decide +kernel
#check gram_check_0_13

theorem gram_check_0_14 : ∀ j : Fin 15,
    listResidual 0 14 j.val = expectedResidual 0 14 j.val := by decide +kernel
theorem dd_check_0_14 : expectedRowCheck 0 14 = true := by decide +kernel
theorem list_length_0_14 : (listFactorRows 0 14).length ≤ 197 := by decide +kernel
#check gram_check_0_14

theorem gram_check_0_15 : ∀ j : Fin 16,
    listResidual 0 15 j.val = expectedResidual 0 15 j.val := by decide +kernel
theorem dd_check_0_15 : expectedRowCheck 0 15 = true := by decide +kernel
theorem list_length_0_15 : (listFactorRows 0 15).length ≤ 197 := by decide +kernel
#check gram_check_0_15

end Hedetniemi.Round4
