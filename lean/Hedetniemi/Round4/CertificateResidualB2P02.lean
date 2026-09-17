import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_16 : ∀ j : Fin 17,
    listResidual 2 16 j.val = expectedResidual 2 16 j.val := by decide +kernel
theorem dd_check_2_16 : expectedRowCheck 2 16 = true := by decide +kernel
theorem list_length_2_16 : (listFactorRows 2 16).length ≤ 197 := by decide +kernel
#check gram_check_2_16

theorem gram_check_2_17 : ∀ j : Fin 18,
    listResidual 2 17 j.val = expectedResidual 2 17 j.val := by decide +kernel
theorem dd_check_2_17 : expectedRowCheck 2 17 = true := by decide +kernel
theorem list_length_2_17 : (listFactorRows 2 17).length ≤ 197 := by decide +kernel
#check gram_check_2_17

theorem gram_check_2_18 : ∀ j : Fin 19,
    listResidual 2 18 j.val = expectedResidual 2 18 j.val := by decide +kernel
theorem dd_check_2_18 : expectedRowCheck 2 18 = true := by decide +kernel
theorem list_length_2_18 : (listFactorRows 2 18).length ≤ 197 := by decide +kernel
#check gram_check_2_18

theorem gram_check_2_19 : ∀ j : Fin 20,
    listResidual 2 19 j.val = expectedResidual 2 19 j.val := by decide +kernel
theorem dd_check_2_19 : expectedRowCheck 2 19 = true := by decide +kernel
theorem list_length_2_19 : (listFactorRows 2 19).length ≤ 197 := by decide +kernel
#check gram_check_2_19

theorem gram_check_2_20 : ∀ j : Fin 21,
    listResidual 2 20 j.val = expectedResidual 2 20 j.val := by decide +kernel
theorem dd_check_2_20 : expectedRowCheck 2 20 = true := by decide +kernel
theorem list_length_2_20 : (listFactorRows 2 20).length ≤ 197 := by decide +kernel
#check gram_check_2_20

theorem gram_check_2_21 : ∀ j : Fin 22,
    listResidual 2 21 j.val = expectedResidual 2 21 j.val := by decide +kernel
theorem dd_check_2_21 : expectedRowCheck 2 21 = true := by decide +kernel
theorem list_length_2_21 : (listFactorRows 2 21).length ≤ 197 := by decide +kernel
#check gram_check_2_21

theorem gram_check_2_22 : ∀ j : Fin 23,
    listResidual 2 22 j.val = expectedResidual 2 22 j.val := by decide +kernel
theorem dd_check_2_22 : expectedRowCheck 2 22 = true := by decide +kernel
theorem list_length_2_22 : (listFactorRows 2 22).length ≤ 197 := by decide +kernel
#check gram_check_2_22

theorem gram_check_2_23 : ∀ j : Fin 24,
    listResidual 2 23 j.val = expectedResidual 2 23 j.val := by decide +kernel
theorem dd_check_2_23 : expectedRowCheck 2 23 = true := by decide +kernel
theorem list_length_2_23 : (listFactorRows 2 23).length ≤ 197 := by decide +kernel
#check gram_check_2_23

end Hedetniemi.Round4
