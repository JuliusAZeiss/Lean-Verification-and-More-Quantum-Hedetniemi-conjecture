import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_56 : ∀ j : Fin 57,
    listResidual 2 56 j.val = expectedResidual 2 56 j.val := by decide +kernel
theorem dd_check_2_56 : expectedRowCheck 2 56 = true := by decide +kernel
theorem list_length_2_56 : (listFactorRows 2 56).length ≤ 197 := by decide +kernel
#check gram_check_2_56

theorem gram_check_2_57 : ∀ j : Fin 58,
    listResidual 2 57 j.val = expectedResidual 2 57 j.val := by decide +kernel
theorem dd_check_2_57 : expectedRowCheck 2 57 = true := by decide +kernel
theorem list_length_2_57 : (listFactorRows 2 57).length ≤ 197 := by decide +kernel
#check gram_check_2_57

theorem gram_check_2_58 : ∀ j : Fin 59,
    listResidual 2 58 j.val = expectedResidual 2 58 j.val := by decide +kernel
theorem dd_check_2_58 : expectedRowCheck 2 58 = true := by decide +kernel
theorem list_length_2_58 : (listFactorRows 2 58).length ≤ 197 := by decide +kernel
#check gram_check_2_58

theorem gram_check_2_59 : ∀ j : Fin 60,
    listResidual 2 59 j.val = expectedResidual 2 59 j.val := by decide +kernel
theorem dd_check_2_59 : expectedRowCheck 2 59 = true := by decide +kernel
theorem list_length_2_59 : (listFactorRows 2 59).length ≤ 197 := by decide +kernel
#check gram_check_2_59

theorem gram_check_2_60 : ∀ j : Fin 61,
    listResidual 2 60 j.val = expectedResidual 2 60 j.val := by decide +kernel
theorem dd_check_2_60 : expectedRowCheck 2 60 = true := by decide +kernel
theorem list_length_2_60 : (listFactorRows 2 60).length ≤ 197 := by decide +kernel
#check gram_check_2_60

theorem gram_check_2_61 : ∀ j : Fin 62,
    listResidual 2 61 j.val = expectedResidual 2 61 j.val := by decide +kernel
theorem dd_check_2_61 : expectedRowCheck 2 61 = true := by decide +kernel
theorem list_length_2_61 : (listFactorRows 2 61).length ≤ 197 := by decide +kernel
#check gram_check_2_61

theorem gram_check_2_62 : ∀ j : Fin 63,
    listResidual 2 62 j.val = expectedResidual 2 62 j.val := by decide +kernel
theorem dd_check_2_62 : expectedRowCheck 2 62 = true := by decide +kernel
theorem list_length_2_62 : (listFactorRows 2 62).length ≤ 197 := by decide +kernel
#check gram_check_2_62

theorem gram_check_2_63 : ∀ j : Fin 64,
    listResidual 2 63 j.val = expectedResidual 2 63 j.val := by decide +kernel
theorem dd_check_2_63 : expectedRowCheck 2 63 = true := by decide +kernel
theorem list_length_2_63 : (listFactorRows 2 63).length ≤ 197 := by decide +kernel
#check gram_check_2_63

end Hedetniemi.Round4
