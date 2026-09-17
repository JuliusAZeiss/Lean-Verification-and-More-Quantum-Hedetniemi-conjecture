import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_64 : ∀ j : Fin 65,
    listResidual 1 64 j.val = expectedResidual 1 64 j.val := by decide +kernel
theorem dd_check_1_64 : expectedRowCheck 1 64 = true := by decide +kernel
theorem list_length_1_64 : (listFactorRows 1 64).length ≤ 197 := by decide +kernel
#check gram_check_1_64

theorem gram_check_1_65 : ∀ j : Fin 66,
    listResidual 1 65 j.val = expectedResidual 1 65 j.val := by decide +kernel
theorem dd_check_1_65 : expectedRowCheck 1 65 = true := by decide +kernel
theorem list_length_1_65 : (listFactorRows 1 65).length ≤ 197 := by decide +kernel
#check gram_check_1_65

theorem gram_check_1_66 : ∀ j : Fin 67,
    listResidual 1 66 j.val = expectedResidual 1 66 j.val := by decide +kernel
theorem dd_check_1_66 : expectedRowCheck 1 66 = true := by decide +kernel
theorem list_length_1_66 : (listFactorRows 1 66).length ≤ 197 := by decide +kernel
#check gram_check_1_66

theorem gram_check_1_67 : ∀ j : Fin 68,
    listResidual 1 67 j.val = expectedResidual 1 67 j.val := by decide +kernel
theorem dd_check_1_67 : expectedRowCheck 1 67 = true := by decide +kernel
theorem list_length_1_67 : (listFactorRows 1 67).length ≤ 197 := by decide +kernel
#check gram_check_1_67

theorem gram_check_1_68 : ∀ j : Fin 69,
    listResidual 1 68 j.val = expectedResidual 1 68 j.val := by decide +kernel
theorem dd_check_1_68 : expectedRowCheck 1 68 = true := by decide +kernel
theorem list_length_1_68 : (listFactorRows 1 68).length ≤ 197 := by decide +kernel
#check gram_check_1_68

theorem gram_check_1_69 : ∀ j : Fin 70,
    listResidual 1 69 j.val = expectedResidual 1 69 j.val := by decide +kernel
theorem dd_check_1_69 : expectedRowCheck 1 69 = true := by decide +kernel
theorem list_length_1_69 : (listFactorRows 1 69).length ≤ 197 := by decide +kernel
#check gram_check_1_69

theorem gram_check_1_70 : ∀ j : Fin 71,
    listResidual 1 70 j.val = expectedResidual 1 70 j.val := by decide +kernel
theorem dd_check_1_70 : expectedRowCheck 1 70 = true := by decide +kernel
theorem list_length_1_70 : (listFactorRows 1 70).length ≤ 197 := by decide +kernel
#check gram_check_1_70

theorem gram_check_1_71 : ∀ j : Fin 72,
    listResidual 1 71 j.val = expectedResidual 1 71 j.val := by decide +kernel
theorem dd_check_1_71 : expectedRowCheck 1 71 = true := by decide +kernel
theorem list_length_1_71 : (listFactorRows 1 71).length ≤ 197 := by decide +kernel
#check gram_check_1_71

end Hedetniemi.Round4
