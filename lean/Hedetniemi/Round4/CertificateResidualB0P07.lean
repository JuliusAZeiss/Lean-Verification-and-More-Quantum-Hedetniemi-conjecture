import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_56 : ∀ j : Fin 57,
    listResidual 0 56 j.val = expectedResidual 0 56 j.val := by decide +kernel
theorem dd_check_0_56 : expectedRowCheck 0 56 = true := by decide +kernel
theorem list_length_0_56 : (listFactorRows 0 56).length ≤ 197 := by decide +kernel
#check gram_check_0_56

theorem gram_check_0_57 : ∀ j : Fin 58,
    listResidual 0 57 j.val = expectedResidual 0 57 j.val := by decide +kernel
theorem dd_check_0_57 : expectedRowCheck 0 57 = true := by decide +kernel
theorem list_length_0_57 : (listFactorRows 0 57).length ≤ 197 := by decide +kernel
#check gram_check_0_57

theorem gram_check_0_58 : ∀ j : Fin 59,
    listResidual 0 58 j.val = expectedResidual 0 58 j.val := by decide +kernel
theorem dd_check_0_58 : expectedRowCheck 0 58 = true := by decide +kernel
theorem list_length_0_58 : (listFactorRows 0 58).length ≤ 197 := by decide +kernel
#check gram_check_0_58

theorem gram_check_0_59 : ∀ j : Fin 60,
    listResidual 0 59 j.val = expectedResidual 0 59 j.val := by decide +kernel
theorem dd_check_0_59 : expectedRowCheck 0 59 = true := by decide +kernel
theorem list_length_0_59 : (listFactorRows 0 59).length ≤ 197 := by decide +kernel
#check gram_check_0_59

theorem gram_check_0_60 : ∀ j : Fin 61,
    listResidual 0 60 j.val = expectedResidual 0 60 j.val := by decide +kernel
theorem dd_check_0_60 : expectedRowCheck 0 60 = true := by decide +kernel
theorem list_length_0_60 : (listFactorRows 0 60).length ≤ 197 := by decide +kernel
#check gram_check_0_60

theorem gram_check_0_61 : ∀ j : Fin 62,
    listResidual 0 61 j.val = expectedResidual 0 61 j.val := by decide +kernel
theorem dd_check_0_61 : expectedRowCheck 0 61 = true := by decide +kernel
theorem list_length_0_61 : (listFactorRows 0 61).length ≤ 197 := by decide +kernel
#check gram_check_0_61

theorem gram_check_0_62 : ∀ j : Fin 63,
    listResidual 0 62 j.val = expectedResidual 0 62 j.val := by decide +kernel
theorem dd_check_0_62 : expectedRowCheck 0 62 = true := by decide +kernel
theorem list_length_0_62 : (listFactorRows 0 62).length ≤ 197 := by decide +kernel
#check gram_check_0_62

theorem gram_check_0_63 : ∀ j : Fin 64,
    listResidual 0 63 j.val = expectedResidual 0 63 j.val := by decide +kernel
theorem dd_check_0_63 : expectedRowCheck 0 63 = true := by decide +kernel
theorem list_length_0_63 : (listFactorRows 0 63).length ≤ 197 := by decide +kernel
#check gram_check_0_63

end Hedetniemi.Round4
