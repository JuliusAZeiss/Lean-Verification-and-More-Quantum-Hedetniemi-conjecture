import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_88 : ∀ j : Fin 89,
    listResidual 1 88 j.val = expectedResidual 1 88 j.val := by decide +kernel
theorem dd_check_1_88 : expectedRowCheck 1 88 = true := by decide +kernel
theorem list_length_1_88 : (listFactorRows 1 88).length ≤ 197 := by decide +kernel
#check gram_check_1_88

theorem gram_check_1_89 : ∀ j : Fin 90,
    listResidual 1 89 j.val = expectedResidual 1 89 j.val := by decide +kernel
theorem dd_check_1_89 : expectedRowCheck 1 89 = true := by decide +kernel
theorem list_length_1_89 : (listFactorRows 1 89).length ≤ 197 := by decide +kernel
#check gram_check_1_89

theorem gram_check_1_90 : ∀ j : Fin 91,
    listResidual 1 90 j.val = expectedResidual 1 90 j.val := by decide +kernel
theorem dd_check_1_90 : expectedRowCheck 1 90 = true := by decide +kernel
theorem list_length_1_90 : (listFactorRows 1 90).length ≤ 197 := by decide +kernel
#check gram_check_1_90

theorem gram_check_1_91 : ∀ j : Fin 92,
    listResidual 1 91 j.val = expectedResidual 1 91 j.val := by decide +kernel
theorem dd_check_1_91 : expectedRowCheck 1 91 = true := by decide +kernel
theorem list_length_1_91 : (listFactorRows 1 91).length ≤ 197 := by decide +kernel
#check gram_check_1_91

theorem gram_check_1_92 : ∀ j : Fin 93,
    listResidual 1 92 j.val = expectedResidual 1 92 j.val := by decide +kernel
theorem dd_check_1_92 : expectedRowCheck 1 92 = true := by decide +kernel
theorem list_length_1_92 : (listFactorRows 1 92).length ≤ 197 := by decide +kernel
#check gram_check_1_92

theorem gram_check_1_93 : ∀ j : Fin 94,
    listResidual 1 93 j.val = expectedResidual 1 93 j.val := by decide +kernel
theorem dd_check_1_93 : expectedRowCheck 1 93 = true := by decide +kernel
theorem list_length_1_93 : (listFactorRows 1 93).length ≤ 197 := by decide +kernel
#check gram_check_1_93

theorem gram_check_1_94 : ∀ j : Fin 95,
    listResidual 1 94 j.val = expectedResidual 1 94 j.val := by decide +kernel
theorem dd_check_1_94 : expectedRowCheck 1 94 = true := by decide +kernel
theorem list_length_1_94 : (listFactorRows 1 94).length ≤ 197 := by decide +kernel
#check gram_check_1_94

theorem gram_check_1_95 : ∀ j : Fin 96,
    listResidual 1 95 j.val = expectedResidual 1 95 j.val := by decide +kernel
theorem dd_check_1_95 : expectedRowCheck 1 95 = true := by decide +kernel
theorem list_length_1_95 : (listFactorRows 1 95).length ≤ 197 := by decide +kernel
#check gram_check_1_95

end Hedetniemi.Round4
