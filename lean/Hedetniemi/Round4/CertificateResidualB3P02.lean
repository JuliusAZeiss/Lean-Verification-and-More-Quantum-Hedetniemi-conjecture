import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_16 : ∀ j : Fin 17,
    listResidual 3 16 j.val = expectedResidual 3 16 j.val := by decide +kernel
theorem dd_check_3_16 : expectedRowCheck 3 16 = true := by decide +kernel
theorem list_length_3_16 : (listFactorRows 3 16).length ≤ 197 := by decide +kernel
#check gram_check_3_16

theorem gram_check_3_17 : ∀ j : Fin 18,
    listResidual 3 17 j.val = expectedResidual 3 17 j.val := by decide +kernel
theorem dd_check_3_17 : expectedRowCheck 3 17 = true := by decide +kernel
theorem list_length_3_17 : (listFactorRows 3 17).length ≤ 197 := by decide +kernel
#check gram_check_3_17

theorem gram_check_3_18 : ∀ j : Fin 19,
    listResidual 3 18 j.val = expectedResidual 3 18 j.val := by decide +kernel
theorem dd_check_3_18 : expectedRowCheck 3 18 = true := by decide +kernel
theorem list_length_3_18 : (listFactorRows 3 18).length ≤ 197 := by decide +kernel
#check gram_check_3_18

theorem gram_check_3_19 : ∀ j : Fin 20,
    listResidual 3 19 j.val = expectedResidual 3 19 j.val := by decide +kernel
theorem dd_check_3_19 : expectedRowCheck 3 19 = true := by decide +kernel
theorem list_length_3_19 : (listFactorRows 3 19).length ≤ 197 := by decide +kernel
#check gram_check_3_19

theorem gram_check_3_20 : ∀ j : Fin 21,
    listResidual 3 20 j.val = expectedResidual 3 20 j.val := by decide +kernel
theorem dd_check_3_20 : expectedRowCheck 3 20 = true := by decide +kernel
theorem list_length_3_20 : (listFactorRows 3 20).length ≤ 197 := by decide +kernel
#check gram_check_3_20

theorem gram_check_3_21 : ∀ j : Fin 22,
    listResidual 3 21 j.val = expectedResidual 3 21 j.val := by decide +kernel
theorem dd_check_3_21 : expectedRowCheck 3 21 = true := by decide +kernel
theorem list_length_3_21 : (listFactorRows 3 21).length ≤ 197 := by decide +kernel
#check gram_check_3_21

theorem gram_check_3_22 : ∀ j : Fin 23,
    listResidual 3 22 j.val = expectedResidual 3 22 j.val := by decide +kernel
theorem dd_check_3_22 : expectedRowCheck 3 22 = true := by decide +kernel
theorem list_length_3_22 : (listFactorRows 3 22).length ≤ 197 := by decide +kernel
#check gram_check_3_22

theorem gram_check_3_23 : ∀ j : Fin 24,
    listResidual 3 23 j.val = expectedResidual 3 23 j.val := by decide +kernel
theorem dd_check_3_23 : expectedRowCheck 3 23 = true := by decide +kernel
theorem list_length_3_23 : (listFactorRows 3 23).length ≤ 197 := by decide +kernel
#check gram_check_3_23

end Hedetniemi.Round4
