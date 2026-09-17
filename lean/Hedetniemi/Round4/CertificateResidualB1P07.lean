import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_56 : ∀ j : Fin 57,
    listResidual 1 56 j.val = expectedResidual 1 56 j.val := by decide +kernel
theorem dd_check_1_56 : expectedRowCheck 1 56 = true := by decide +kernel
theorem list_length_1_56 : (listFactorRows 1 56).length ≤ 197 := by decide +kernel
#check gram_check_1_56

theorem gram_check_1_57 : ∀ j : Fin 58,
    listResidual 1 57 j.val = expectedResidual 1 57 j.val := by decide +kernel
theorem dd_check_1_57 : expectedRowCheck 1 57 = true := by decide +kernel
theorem list_length_1_57 : (listFactorRows 1 57).length ≤ 197 := by decide +kernel
#check gram_check_1_57

theorem gram_check_1_58 : ∀ j : Fin 59,
    listResidual 1 58 j.val = expectedResidual 1 58 j.val := by decide +kernel
theorem dd_check_1_58 : expectedRowCheck 1 58 = true := by decide +kernel
theorem list_length_1_58 : (listFactorRows 1 58).length ≤ 197 := by decide +kernel
#check gram_check_1_58

theorem gram_check_1_59 : ∀ j : Fin 60,
    listResidual 1 59 j.val = expectedResidual 1 59 j.val := by decide +kernel
theorem dd_check_1_59 : expectedRowCheck 1 59 = true := by decide +kernel
theorem list_length_1_59 : (listFactorRows 1 59).length ≤ 197 := by decide +kernel
#check gram_check_1_59

theorem gram_check_1_60 : ∀ j : Fin 61,
    listResidual 1 60 j.val = expectedResidual 1 60 j.val := by decide +kernel
theorem dd_check_1_60 : expectedRowCheck 1 60 = true := by decide +kernel
theorem list_length_1_60 : (listFactorRows 1 60).length ≤ 197 := by decide +kernel
#check gram_check_1_60

theorem gram_check_1_61 : ∀ j : Fin 62,
    listResidual 1 61 j.val = expectedResidual 1 61 j.val := by decide +kernel
theorem dd_check_1_61 : expectedRowCheck 1 61 = true := by decide +kernel
theorem list_length_1_61 : (listFactorRows 1 61).length ≤ 197 := by decide +kernel
#check gram_check_1_61

theorem gram_check_1_62 : ∀ j : Fin 63,
    listResidual 1 62 j.val = expectedResidual 1 62 j.val := by decide +kernel
theorem dd_check_1_62 : expectedRowCheck 1 62 = true := by decide +kernel
theorem list_length_1_62 : (listFactorRows 1 62).length ≤ 197 := by decide +kernel
#check gram_check_1_62

theorem gram_check_1_63 : ∀ j : Fin 64,
    listResidual 1 63 j.val = expectedResidual 1 63 j.val := by decide +kernel
theorem dd_check_1_63 : expectedRowCheck 1 63 = true := by decide +kernel
theorem list_length_1_63 : (listFactorRows 1 63).length ≤ 197 := by decide +kernel
#check gram_check_1_63

end Hedetniemi.Round4
