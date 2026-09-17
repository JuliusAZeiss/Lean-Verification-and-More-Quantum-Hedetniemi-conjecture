import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_64 : ∀ j : Fin 65,
    listResidual 3 64 j.val = expectedResidual 3 64 j.val := by decide +kernel
theorem dd_check_3_64 : expectedRowCheck 3 64 = true := by decide +kernel
theorem list_length_3_64 : (listFactorRows 3 64).length ≤ 197 := by decide +kernel
#check gram_check_3_64

theorem gram_check_3_65 : ∀ j : Fin 66,
    listResidual 3 65 j.val = expectedResidual 3 65 j.val := by decide +kernel
theorem dd_check_3_65 : expectedRowCheck 3 65 = true := by decide +kernel
theorem list_length_3_65 : (listFactorRows 3 65).length ≤ 197 := by decide +kernel
#check gram_check_3_65

theorem gram_check_3_66 : ∀ j : Fin 67,
    listResidual 3 66 j.val = expectedResidual 3 66 j.val := by decide +kernel
theorem dd_check_3_66 : expectedRowCheck 3 66 = true := by decide +kernel
theorem list_length_3_66 : (listFactorRows 3 66).length ≤ 197 := by decide +kernel
#check gram_check_3_66

theorem gram_check_3_67 : ∀ j : Fin 68,
    listResidual 3 67 j.val = expectedResidual 3 67 j.val := by decide +kernel
theorem dd_check_3_67 : expectedRowCheck 3 67 = true := by decide +kernel
theorem list_length_3_67 : (listFactorRows 3 67).length ≤ 197 := by decide +kernel
#check gram_check_3_67

theorem gram_check_3_68 : ∀ j : Fin 69,
    listResidual 3 68 j.val = expectedResidual 3 68 j.val := by decide +kernel
theorem dd_check_3_68 : expectedRowCheck 3 68 = true := by decide +kernel
theorem list_length_3_68 : (listFactorRows 3 68).length ≤ 197 := by decide +kernel
#check gram_check_3_68

theorem gram_check_3_69 : ∀ j : Fin 70,
    listResidual 3 69 j.val = expectedResidual 3 69 j.val := by decide +kernel
theorem dd_check_3_69 : expectedRowCheck 3 69 = true := by decide +kernel
theorem list_length_3_69 : (listFactorRows 3 69).length ≤ 197 := by decide +kernel
#check gram_check_3_69

theorem gram_check_3_70 : ∀ j : Fin 71,
    listResidual 3 70 j.val = expectedResidual 3 70 j.val := by decide +kernel
theorem dd_check_3_70 : expectedRowCheck 3 70 = true := by decide +kernel
theorem list_length_3_70 : (listFactorRows 3 70).length ≤ 197 := by decide +kernel
#check gram_check_3_70

theorem gram_check_3_71 : ∀ j : Fin 72,
    listResidual 3 71 j.val = expectedResidual 3 71 j.val := by decide +kernel
theorem dd_check_3_71 : expectedRowCheck 3 71 = true := by decide +kernel
theorem list_length_3_71 : (listFactorRows 3 71).length ≤ 197 := by decide +kernel
#check gram_check_3_71

end Hedetniemi.Round4
