import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_80 : ∀ j : Fin 81,
    listResidual 0 80 j.val = expectedResidual 0 80 j.val := by decide +kernel
theorem dd_check_0_80 : expectedRowCheck 0 80 = true := by decide +kernel
theorem list_length_0_80 : (listFactorRows 0 80).length ≤ 197 := by decide +kernel
#check gram_check_0_80

theorem gram_check_0_81 : ∀ j : Fin 82,
    listResidual 0 81 j.val = expectedResidual 0 81 j.val := by decide +kernel
theorem dd_check_0_81 : expectedRowCheck 0 81 = true := by decide +kernel
theorem list_length_0_81 : (listFactorRows 0 81).length ≤ 197 := by decide +kernel
#check gram_check_0_81

theorem gram_check_0_82 : ∀ j : Fin 83,
    listResidual 0 82 j.val = expectedResidual 0 82 j.val := by decide +kernel
theorem dd_check_0_82 : expectedRowCheck 0 82 = true := by decide +kernel
theorem list_length_0_82 : (listFactorRows 0 82).length ≤ 197 := by decide +kernel
#check gram_check_0_82

theorem gram_check_0_83 : ∀ j : Fin 84,
    listResidual 0 83 j.val = expectedResidual 0 83 j.val := by decide +kernel
theorem dd_check_0_83 : expectedRowCheck 0 83 = true := by decide +kernel
theorem list_length_0_83 : (listFactorRows 0 83).length ≤ 197 := by decide +kernel
#check gram_check_0_83

theorem gram_check_0_84 : ∀ j : Fin 85,
    listResidual 0 84 j.val = expectedResidual 0 84 j.val := by decide +kernel
theorem dd_check_0_84 : expectedRowCheck 0 84 = true := by decide +kernel
theorem list_length_0_84 : (listFactorRows 0 84).length ≤ 197 := by decide +kernel
#check gram_check_0_84

theorem gram_check_0_85 : ∀ j : Fin 86,
    listResidual 0 85 j.val = expectedResidual 0 85 j.val := by decide +kernel
theorem dd_check_0_85 : expectedRowCheck 0 85 = true := by decide +kernel
theorem list_length_0_85 : (listFactorRows 0 85).length ≤ 197 := by decide +kernel
#check gram_check_0_85

theorem gram_check_0_86 : ∀ j : Fin 87,
    listResidual 0 86 j.val = expectedResidual 0 86 j.val := by decide +kernel
theorem dd_check_0_86 : expectedRowCheck 0 86 = true := by decide +kernel
theorem list_length_0_86 : (listFactorRows 0 86).length ≤ 197 := by decide +kernel
#check gram_check_0_86

theorem gram_check_0_87 : ∀ j : Fin 88,
    listResidual 0 87 j.val = expectedResidual 0 87 j.val := by decide +kernel
theorem dd_check_0_87 : expectedRowCheck 0 87 = true := by decide +kernel
theorem list_length_0_87 : (listFactorRows 0 87).length ≤ 197 := by decide +kernel
#check gram_check_0_87

end Hedetniemi.Round4
