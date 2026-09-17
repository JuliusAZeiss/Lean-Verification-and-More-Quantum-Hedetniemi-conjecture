import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_16 : ∀ j : Fin 17,
    listResidual 0 16 j.val = expectedResidual 0 16 j.val := by decide +kernel
theorem dd_check_0_16 : expectedRowCheck 0 16 = true := by decide +kernel
theorem list_length_0_16 : (listFactorRows 0 16).length ≤ 197 := by decide +kernel
#check gram_check_0_16

theorem gram_check_0_17 : ∀ j : Fin 18,
    listResidual 0 17 j.val = expectedResidual 0 17 j.val := by decide +kernel
theorem dd_check_0_17 : expectedRowCheck 0 17 = true := by decide +kernel
theorem list_length_0_17 : (listFactorRows 0 17).length ≤ 197 := by decide +kernel
#check gram_check_0_17

theorem gram_check_0_18 : ∀ j : Fin 19,
    listResidual 0 18 j.val = expectedResidual 0 18 j.val := by decide +kernel
theorem dd_check_0_18 : expectedRowCheck 0 18 = true := by decide +kernel
theorem list_length_0_18 : (listFactorRows 0 18).length ≤ 197 := by decide +kernel
#check gram_check_0_18

theorem gram_check_0_19 : ∀ j : Fin 20,
    listResidual 0 19 j.val = expectedResidual 0 19 j.val := by decide +kernel
theorem dd_check_0_19 : expectedRowCheck 0 19 = true := by decide +kernel
theorem list_length_0_19 : (listFactorRows 0 19).length ≤ 197 := by decide +kernel
#check gram_check_0_19

theorem gram_check_0_20 : ∀ j : Fin 21,
    listResidual 0 20 j.val = expectedResidual 0 20 j.val := by decide +kernel
theorem dd_check_0_20 : expectedRowCheck 0 20 = true := by decide +kernel
theorem list_length_0_20 : (listFactorRows 0 20).length ≤ 197 := by decide +kernel
#check gram_check_0_20

theorem gram_check_0_21 : ∀ j : Fin 22,
    listResidual 0 21 j.val = expectedResidual 0 21 j.val := by decide +kernel
theorem dd_check_0_21 : expectedRowCheck 0 21 = true := by decide +kernel
theorem list_length_0_21 : (listFactorRows 0 21).length ≤ 197 := by decide +kernel
#check gram_check_0_21

theorem gram_check_0_22 : ∀ j : Fin 23,
    listResidual 0 22 j.val = expectedResidual 0 22 j.val := by decide +kernel
theorem dd_check_0_22 : expectedRowCheck 0 22 = true := by decide +kernel
theorem list_length_0_22 : (listFactorRows 0 22).length ≤ 197 := by decide +kernel
#check gram_check_0_22

theorem gram_check_0_23 : ∀ j : Fin 24,
    listResidual 0 23 j.val = expectedResidual 0 23 j.val := by decide +kernel
theorem dd_check_0_23 : expectedRowCheck 0 23 = true := by decide +kernel
theorem list_length_0_23 : (listFactorRows 0 23).length ≤ 197 := by decide +kernel
#check gram_check_0_23

end Hedetniemi.Round4
