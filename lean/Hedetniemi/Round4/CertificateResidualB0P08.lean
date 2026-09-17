import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_64 : ∀ j : Fin 65,
    listResidual 0 64 j.val = expectedResidual 0 64 j.val := by decide +kernel
theorem dd_check_0_64 : expectedRowCheck 0 64 = true := by decide +kernel
theorem list_length_0_64 : (listFactorRows 0 64).length ≤ 197 := by decide +kernel
#check gram_check_0_64

theorem gram_check_0_65 : ∀ j : Fin 66,
    listResidual 0 65 j.val = expectedResidual 0 65 j.val := by decide +kernel
theorem dd_check_0_65 : expectedRowCheck 0 65 = true := by decide +kernel
theorem list_length_0_65 : (listFactorRows 0 65).length ≤ 197 := by decide +kernel
#check gram_check_0_65

theorem gram_check_0_66 : ∀ j : Fin 67,
    listResidual 0 66 j.val = expectedResidual 0 66 j.val := by decide +kernel
theorem dd_check_0_66 : expectedRowCheck 0 66 = true := by decide +kernel
theorem list_length_0_66 : (listFactorRows 0 66).length ≤ 197 := by decide +kernel
#check gram_check_0_66

theorem gram_check_0_67 : ∀ j : Fin 68,
    listResidual 0 67 j.val = expectedResidual 0 67 j.val := by decide +kernel
theorem dd_check_0_67 : expectedRowCheck 0 67 = true := by decide +kernel
theorem list_length_0_67 : (listFactorRows 0 67).length ≤ 197 := by decide +kernel
#check gram_check_0_67

theorem gram_check_0_68 : ∀ j : Fin 69,
    listResidual 0 68 j.val = expectedResidual 0 68 j.val := by decide +kernel
theorem dd_check_0_68 : expectedRowCheck 0 68 = true := by decide +kernel
theorem list_length_0_68 : (listFactorRows 0 68).length ≤ 197 := by decide +kernel
#check gram_check_0_68

theorem gram_check_0_69 : ∀ j : Fin 70,
    listResidual 0 69 j.val = expectedResidual 0 69 j.val := by decide +kernel
theorem dd_check_0_69 : expectedRowCheck 0 69 = true := by decide +kernel
theorem list_length_0_69 : (listFactorRows 0 69).length ≤ 197 := by decide +kernel
#check gram_check_0_69

theorem gram_check_0_70 : ∀ j : Fin 71,
    listResidual 0 70 j.val = expectedResidual 0 70 j.val := by decide +kernel
theorem dd_check_0_70 : expectedRowCheck 0 70 = true := by decide +kernel
theorem list_length_0_70 : (listFactorRows 0 70).length ≤ 197 := by decide +kernel
#check gram_check_0_70

theorem gram_check_0_71 : ∀ j : Fin 72,
    listResidual 0 71 j.val = expectedResidual 0 71 j.val := by decide +kernel
theorem dd_check_0_71 : expectedRowCheck 0 71 = true := by decide +kernel
theorem list_length_0_71 : (listFactorRows 0 71).length ≤ 197 := by decide +kernel
#check gram_check_0_71

end Hedetniemi.Round4
