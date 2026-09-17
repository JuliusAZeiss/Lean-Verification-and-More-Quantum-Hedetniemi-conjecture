import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_88 : ∀ j : Fin 89,
    listResidual 2 88 j.val = expectedResidual 2 88 j.val := by decide +kernel
theorem dd_check_2_88 : expectedRowCheck 2 88 = true := by decide +kernel
theorem list_length_2_88 : (listFactorRows 2 88).length ≤ 197 := by decide +kernel
#check gram_check_2_88

theorem gram_check_2_89 : ∀ j : Fin 90,
    listResidual 2 89 j.val = expectedResidual 2 89 j.val := by decide +kernel
theorem dd_check_2_89 : expectedRowCheck 2 89 = true := by decide +kernel
theorem list_length_2_89 : (listFactorRows 2 89).length ≤ 197 := by decide +kernel
#check gram_check_2_89

theorem gram_check_2_90 : ∀ j : Fin 91,
    listResidual 2 90 j.val = expectedResidual 2 90 j.val := by decide +kernel
theorem dd_check_2_90 : expectedRowCheck 2 90 = true := by decide +kernel
theorem list_length_2_90 : (listFactorRows 2 90).length ≤ 197 := by decide +kernel
#check gram_check_2_90

theorem gram_check_2_91 : ∀ j : Fin 92,
    listResidual 2 91 j.val = expectedResidual 2 91 j.val := by decide +kernel
theorem dd_check_2_91 : expectedRowCheck 2 91 = true := by decide +kernel
theorem list_length_2_91 : (listFactorRows 2 91).length ≤ 197 := by decide +kernel
#check gram_check_2_91

theorem gram_check_2_92 : ∀ j : Fin 93,
    listResidual 2 92 j.val = expectedResidual 2 92 j.val := by decide +kernel
theorem dd_check_2_92 : expectedRowCheck 2 92 = true := by decide +kernel
theorem list_length_2_92 : (listFactorRows 2 92).length ≤ 197 := by decide +kernel
#check gram_check_2_92

theorem gram_check_2_93 : ∀ j : Fin 94,
    listResidual 2 93 j.val = expectedResidual 2 93 j.val := by decide +kernel
theorem dd_check_2_93 : expectedRowCheck 2 93 = true := by decide +kernel
theorem list_length_2_93 : (listFactorRows 2 93).length ≤ 197 := by decide +kernel
#check gram_check_2_93

theorem gram_check_2_94 : ∀ j : Fin 95,
    listResidual 2 94 j.val = expectedResidual 2 94 j.val := by decide +kernel
theorem dd_check_2_94 : expectedRowCheck 2 94 = true := by decide +kernel
theorem list_length_2_94 : (listFactorRows 2 94).length ≤ 197 := by decide +kernel
#check gram_check_2_94

theorem gram_check_2_95 : ∀ j : Fin 96,
    listResidual 2 95 j.val = expectedResidual 2 95 j.val := by decide +kernel
theorem dd_check_2_95 : expectedRowCheck 2 95 = true := by decide +kernel
theorem list_length_2_95 : (listFactorRows 2 95).length ≤ 197 := by decide +kernel
#check gram_check_2_95

end Hedetniemi.Round4
