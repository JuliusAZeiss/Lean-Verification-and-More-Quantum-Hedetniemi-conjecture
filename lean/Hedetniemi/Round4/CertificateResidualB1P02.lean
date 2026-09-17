import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_16 : ∀ j : Fin 17,
    listResidual 1 16 j.val = expectedResidual 1 16 j.val := by decide +kernel
theorem dd_check_1_16 : expectedRowCheck 1 16 = true := by decide +kernel
theorem list_length_1_16 : (listFactorRows 1 16).length ≤ 197 := by decide +kernel
#check gram_check_1_16

theorem gram_check_1_17 : ∀ j : Fin 18,
    listResidual 1 17 j.val = expectedResidual 1 17 j.val := by decide +kernel
theorem dd_check_1_17 : expectedRowCheck 1 17 = true := by decide +kernel
theorem list_length_1_17 : (listFactorRows 1 17).length ≤ 197 := by decide +kernel
#check gram_check_1_17

theorem gram_check_1_18 : ∀ j : Fin 19,
    listResidual 1 18 j.val = expectedResidual 1 18 j.val := by decide +kernel
theorem dd_check_1_18 : expectedRowCheck 1 18 = true := by decide +kernel
theorem list_length_1_18 : (listFactorRows 1 18).length ≤ 197 := by decide +kernel
#check gram_check_1_18

theorem gram_check_1_19 : ∀ j : Fin 20,
    listResidual 1 19 j.val = expectedResidual 1 19 j.val := by decide +kernel
theorem dd_check_1_19 : expectedRowCheck 1 19 = true := by decide +kernel
theorem list_length_1_19 : (listFactorRows 1 19).length ≤ 197 := by decide +kernel
#check gram_check_1_19

theorem gram_check_1_20 : ∀ j : Fin 21,
    listResidual 1 20 j.val = expectedResidual 1 20 j.val := by decide +kernel
theorem dd_check_1_20 : expectedRowCheck 1 20 = true := by decide +kernel
theorem list_length_1_20 : (listFactorRows 1 20).length ≤ 197 := by decide +kernel
#check gram_check_1_20

theorem gram_check_1_21 : ∀ j : Fin 22,
    listResidual 1 21 j.val = expectedResidual 1 21 j.val := by decide +kernel
theorem dd_check_1_21 : expectedRowCheck 1 21 = true := by decide +kernel
theorem list_length_1_21 : (listFactorRows 1 21).length ≤ 197 := by decide +kernel
#check gram_check_1_21

theorem gram_check_1_22 : ∀ j : Fin 23,
    listResidual 1 22 j.val = expectedResidual 1 22 j.val := by decide +kernel
theorem dd_check_1_22 : expectedRowCheck 1 22 = true := by decide +kernel
theorem list_length_1_22 : (listFactorRows 1 22).length ≤ 197 := by decide +kernel
#check gram_check_1_22

theorem gram_check_1_23 : ∀ j : Fin 24,
    listResidual 1 23 j.val = expectedResidual 1 23 j.val := by decide +kernel
theorem dd_check_1_23 : expectedRowCheck 1 23 = true := by decide +kernel
theorem list_length_1_23 : (listFactorRows 1 23).length ≤ 197 := by decide +kernel
#check gram_check_1_23

end Hedetniemi.Round4
