import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_88 : ∀ j : Fin 89,
    listResidual 0 88 j.val = expectedResidual 0 88 j.val := by decide +kernel
theorem dd_check_0_88 : expectedRowCheck 0 88 = true := by decide +kernel
theorem list_length_0_88 : (listFactorRows 0 88).length ≤ 197 := by decide +kernel
#check gram_check_0_88

theorem gram_check_0_89 : ∀ j : Fin 90,
    listResidual 0 89 j.val = expectedResidual 0 89 j.val := by decide +kernel
theorem dd_check_0_89 : expectedRowCheck 0 89 = true := by decide +kernel
theorem list_length_0_89 : (listFactorRows 0 89).length ≤ 197 := by decide +kernel
#check gram_check_0_89

theorem gram_check_0_90 : ∀ j : Fin 91,
    listResidual 0 90 j.val = expectedResidual 0 90 j.val := by decide +kernel
theorem dd_check_0_90 : expectedRowCheck 0 90 = true := by decide +kernel
theorem list_length_0_90 : (listFactorRows 0 90).length ≤ 197 := by decide +kernel
#check gram_check_0_90

theorem gram_check_0_91 : ∀ j : Fin 92,
    listResidual 0 91 j.val = expectedResidual 0 91 j.val := by decide +kernel
theorem dd_check_0_91 : expectedRowCheck 0 91 = true := by decide +kernel
theorem list_length_0_91 : (listFactorRows 0 91).length ≤ 197 := by decide +kernel
#check gram_check_0_91

theorem gram_check_0_92 : ∀ j : Fin 93,
    listResidual 0 92 j.val = expectedResidual 0 92 j.val := by decide +kernel
theorem dd_check_0_92 : expectedRowCheck 0 92 = true := by decide +kernel
theorem list_length_0_92 : (listFactorRows 0 92).length ≤ 197 := by decide +kernel
#check gram_check_0_92

theorem gram_check_0_93 : ∀ j : Fin 94,
    listResidual 0 93 j.val = expectedResidual 0 93 j.val := by decide +kernel
theorem dd_check_0_93 : expectedRowCheck 0 93 = true := by decide +kernel
theorem list_length_0_93 : (listFactorRows 0 93).length ≤ 197 := by decide +kernel
#check gram_check_0_93

theorem gram_check_0_94 : ∀ j : Fin 95,
    listResidual 0 94 j.val = expectedResidual 0 94 j.val := by decide +kernel
theorem dd_check_0_94 : expectedRowCheck 0 94 = true := by decide +kernel
theorem list_length_0_94 : (listFactorRows 0 94).length ≤ 197 := by decide +kernel
#check gram_check_0_94

theorem gram_check_0_95 : ∀ j : Fin 96,
    listResidual 0 95 j.val = expectedResidual 0 95 j.val := by decide +kernel
theorem dd_check_0_95 : expectedRowCheck 0 95 = true := by decide +kernel
theorem list_length_0_95 : (listFactorRows 0 95).length ≤ 197 := by decide +kernel
#check gram_check_0_95

end Hedetniemi.Round4
