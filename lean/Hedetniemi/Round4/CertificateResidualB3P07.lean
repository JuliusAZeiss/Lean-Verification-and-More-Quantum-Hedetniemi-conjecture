import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_56 : ∀ j : Fin 57,
    listResidual 3 56 j.val = expectedResidual 3 56 j.val := by decide +kernel
theorem dd_check_3_56 : expectedRowCheck 3 56 = true := by decide +kernel
theorem list_length_3_56 : (listFactorRows 3 56).length ≤ 197 := by decide +kernel
#check gram_check_3_56

theorem gram_check_3_57 : ∀ j : Fin 58,
    listResidual 3 57 j.val = expectedResidual 3 57 j.val := by decide +kernel
theorem dd_check_3_57 : expectedRowCheck 3 57 = true := by decide +kernel
theorem list_length_3_57 : (listFactorRows 3 57).length ≤ 197 := by decide +kernel
#check gram_check_3_57

theorem gram_check_3_58 : ∀ j : Fin 59,
    listResidual 3 58 j.val = expectedResidual 3 58 j.val := by decide +kernel
theorem dd_check_3_58 : expectedRowCheck 3 58 = true := by decide +kernel
theorem list_length_3_58 : (listFactorRows 3 58).length ≤ 197 := by decide +kernel
#check gram_check_3_58

theorem gram_check_3_59 : ∀ j : Fin 60,
    listResidual 3 59 j.val = expectedResidual 3 59 j.val := by decide +kernel
theorem dd_check_3_59 : expectedRowCheck 3 59 = true := by decide +kernel
theorem list_length_3_59 : (listFactorRows 3 59).length ≤ 197 := by decide +kernel
#check gram_check_3_59

theorem gram_check_3_60 : ∀ j : Fin 61,
    listResidual 3 60 j.val = expectedResidual 3 60 j.val := by decide +kernel
theorem dd_check_3_60 : expectedRowCheck 3 60 = true := by decide +kernel
theorem list_length_3_60 : (listFactorRows 3 60).length ≤ 197 := by decide +kernel
#check gram_check_3_60

theorem gram_check_3_61 : ∀ j : Fin 62,
    listResidual 3 61 j.val = expectedResidual 3 61 j.val := by decide +kernel
theorem dd_check_3_61 : expectedRowCheck 3 61 = true := by decide +kernel
theorem list_length_3_61 : (listFactorRows 3 61).length ≤ 197 := by decide +kernel
#check gram_check_3_61

theorem gram_check_3_62 : ∀ j : Fin 63,
    listResidual 3 62 j.val = expectedResidual 3 62 j.val := by decide +kernel
theorem dd_check_3_62 : expectedRowCheck 3 62 = true := by decide +kernel
theorem list_length_3_62 : (listFactorRows 3 62).length ≤ 197 := by decide +kernel
#check gram_check_3_62

theorem gram_check_3_63 : ∀ j : Fin 64,
    listResidual 3 63 j.val = expectedResidual 3 63 j.val := by decide +kernel
theorem dd_check_3_63 : expectedRowCheck 3 63 = true := by decide +kernel
theorem list_length_3_63 : (listFactorRows 3 63).length ≤ 197 := by decide +kernel
#check gram_check_3_63

end Hedetniemi.Round4
