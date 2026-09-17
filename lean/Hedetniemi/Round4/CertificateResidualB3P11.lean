import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_88 : ∀ j : Fin 89,
    listResidual 3 88 j.val = expectedResidual 3 88 j.val := by decide +kernel
theorem dd_check_3_88 : expectedRowCheck 3 88 = true := by decide +kernel
theorem list_length_3_88 : (listFactorRows 3 88).length ≤ 197 := by decide +kernel
#check gram_check_3_88

theorem gram_check_3_89 : ∀ j : Fin 90,
    listResidual 3 89 j.val = expectedResidual 3 89 j.val := by decide +kernel
theorem dd_check_3_89 : expectedRowCheck 3 89 = true := by decide +kernel
theorem list_length_3_89 : (listFactorRows 3 89).length ≤ 197 := by decide +kernel
#check gram_check_3_89

theorem gram_check_3_90 : ∀ j : Fin 91,
    listResidual 3 90 j.val = expectedResidual 3 90 j.val := by decide +kernel
theorem dd_check_3_90 : expectedRowCheck 3 90 = true := by decide +kernel
theorem list_length_3_90 : (listFactorRows 3 90).length ≤ 197 := by decide +kernel
#check gram_check_3_90

theorem gram_check_3_91 : ∀ j : Fin 92,
    listResidual 3 91 j.val = expectedResidual 3 91 j.val := by decide +kernel
theorem dd_check_3_91 : expectedRowCheck 3 91 = true := by decide +kernel
theorem list_length_3_91 : (listFactorRows 3 91).length ≤ 197 := by decide +kernel
#check gram_check_3_91

theorem gram_check_3_92 : ∀ j : Fin 93,
    listResidual 3 92 j.val = expectedResidual 3 92 j.val := by decide +kernel
theorem dd_check_3_92 : expectedRowCheck 3 92 = true := by decide +kernel
theorem list_length_3_92 : (listFactorRows 3 92).length ≤ 197 := by decide +kernel
#check gram_check_3_92

theorem gram_check_3_93 : ∀ j : Fin 94,
    listResidual 3 93 j.val = expectedResidual 3 93 j.val := by decide +kernel
theorem dd_check_3_93 : expectedRowCheck 3 93 = true := by decide +kernel
theorem list_length_3_93 : (listFactorRows 3 93).length ≤ 197 := by decide +kernel
#check gram_check_3_93

theorem gram_check_3_94 : ∀ j : Fin 95,
    listResidual 3 94 j.val = expectedResidual 3 94 j.val := by decide +kernel
theorem dd_check_3_94 : expectedRowCheck 3 94 = true := by decide +kernel
theorem list_length_3_94 : (listFactorRows 3 94).length ≤ 197 := by decide +kernel
#check gram_check_3_94

theorem gram_check_3_95 : ∀ j : Fin 96,
    listResidual 3 95 j.val = expectedResidual 3 95 j.val := by decide +kernel
theorem dd_check_3_95 : expectedRowCheck 3 95 = true := by decide +kernel
theorem list_length_3_95 : (listFactorRows 3 95).length ≤ 197 := by decide +kernel
#check gram_check_3_95

end Hedetniemi.Round4
