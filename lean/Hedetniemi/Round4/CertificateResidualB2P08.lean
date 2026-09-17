import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_64 : ∀ j : Fin 65,
    listResidual 2 64 j.val = expectedResidual 2 64 j.val := by decide +kernel
theorem dd_check_2_64 : expectedRowCheck 2 64 = true := by decide +kernel
theorem list_length_2_64 : (listFactorRows 2 64).length ≤ 197 := by decide +kernel
#check gram_check_2_64

theorem gram_check_2_65 : ∀ j : Fin 66,
    listResidual 2 65 j.val = expectedResidual 2 65 j.val := by decide +kernel
theorem dd_check_2_65 : expectedRowCheck 2 65 = true := by decide +kernel
theorem list_length_2_65 : (listFactorRows 2 65).length ≤ 197 := by decide +kernel
#check gram_check_2_65

theorem gram_check_2_66 : ∀ j : Fin 67,
    listResidual 2 66 j.val = expectedResidual 2 66 j.val := by decide +kernel
theorem dd_check_2_66 : expectedRowCheck 2 66 = true := by decide +kernel
theorem list_length_2_66 : (listFactorRows 2 66).length ≤ 197 := by decide +kernel
#check gram_check_2_66

theorem gram_check_2_67 : ∀ j : Fin 68,
    listResidual 2 67 j.val = expectedResidual 2 67 j.val := by decide +kernel
theorem dd_check_2_67 : expectedRowCheck 2 67 = true := by decide +kernel
theorem list_length_2_67 : (listFactorRows 2 67).length ≤ 197 := by decide +kernel
#check gram_check_2_67

theorem gram_check_2_68 : ∀ j : Fin 69,
    listResidual 2 68 j.val = expectedResidual 2 68 j.val := by decide +kernel
theorem dd_check_2_68 : expectedRowCheck 2 68 = true := by decide +kernel
theorem list_length_2_68 : (listFactorRows 2 68).length ≤ 197 := by decide +kernel
#check gram_check_2_68

theorem gram_check_2_69 : ∀ j : Fin 70,
    listResidual 2 69 j.val = expectedResidual 2 69 j.val := by decide +kernel
theorem dd_check_2_69 : expectedRowCheck 2 69 = true := by decide +kernel
theorem list_length_2_69 : (listFactorRows 2 69).length ≤ 197 := by decide +kernel
#check gram_check_2_69

theorem gram_check_2_70 : ∀ j : Fin 71,
    listResidual 2 70 j.val = expectedResidual 2 70 j.val := by decide +kernel
theorem dd_check_2_70 : expectedRowCheck 2 70 = true := by decide +kernel
theorem list_length_2_70 : (listFactorRows 2 70).length ≤ 197 := by decide +kernel
#check gram_check_2_70

theorem gram_check_2_71 : ∀ j : Fin 72,
    listResidual 2 71 j.val = expectedResidual 2 71 j.val := by decide +kernel
theorem dd_check_2_71 : expectedRowCheck 2 71 = true := by decide +kernel
theorem list_length_2_71 : (listFactorRows 2 71).length ≤ 197 := by decide +kernel
#check gram_check_2_71

end Hedetniemi.Round4
