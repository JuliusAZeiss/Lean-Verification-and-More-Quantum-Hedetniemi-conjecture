import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_80 : ∀ j : Fin 81,
    listResidual 1 80 j.val = expectedResidual 1 80 j.val := by decide +kernel
theorem dd_check_1_80 : expectedRowCheck 1 80 = true := by decide +kernel
theorem list_length_1_80 : (listFactorRows 1 80).length ≤ 197 := by decide +kernel
#check gram_check_1_80

theorem gram_check_1_81 : ∀ j : Fin 82,
    listResidual 1 81 j.val = expectedResidual 1 81 j.val := by decide +kernel
theorem dd_check_1_81 : expectedRowCheck 1 81 = true := by decide +kernel
theorem list_length_1_81 : (listFactorRows 1 81).length ≤ 197 := by decide +kernel
#check gram_check_1_81

theorem gram_check_1_82 : ∀ j : Fin 83,
    listResidual 1 82 j.val = expectedResidual 1 82 j.val := by decide +kernel
theorem dd_check_1_82 : expectedRowCheck 1 82 = true := by decide +kernel
theorem list_length_1_82 : (listFactorRows 1 82).length ≤ 197 := by decide +kernel
#check gram_check_1_82

theorem gram_check_1_83 : ∀ j : Fin 84,
    listResidual 1 83 j.val = expectedResidual 1 83 j.val := by decide +kernel
theorem dd_check_1_83 : expectedRowCheck 1 83 = true := by decide +kernel
theorem list_length_1_83 : (listFactorRows 1 83).length ≤ 197 := by decide +kernel
#check gram_check_1_83

theorem gram_check_1_84 : ∀ j : Fin 85,
    listResidual 1 84 j.val = expectedResidual 1 84 j.val := by decide +kernel
theorem dd_check_1_84 : expectedRowCheck 1 84 = true := by decide +kernel
theorem list_length_1_84 : (listFactorRows 1 84).length ≤ 197 := by decide +kernel
#check gram_check_1_84

theorem gram_check_1_85 : ∀ j : Fin 86,
    listResidual 1 85 j.val = expectedResidual 1 85 j.val := by decide +kernel
theorem dd_check_1_85 : expectedRowCheck 1 85 = true := by decide +kernel
theorem list_length_1_85 : (listFactorRows 1 85).length ≤ 197 := by decide +kernel
#check gram_check_1_85

theorem gram_check_1_86 : ∀ j : Fin 87,
    listResidual 1 86 j.val = expectedResidual 1 86 j.val := by decide +kernel
theorem dd_check_1_86 : expectedRowCheck 1 86 = true := by decide +kernel
theorem list_length_1_86 : (listFactorRows 1 86).length ≤ 197 := by decide +kernel
#check gram_check_1_86

theorem gram_check_1_87 : ∀ j : Fin 88,
    listResidual 1 87 j.val = expectedResidual 1 87 j.val := by decide +kernel
theorem dd_check_1_87 : expectedRowCheck 1 87 = true := by decide +kernel
theorem list_length_1_87 : (listFactorRows 1 87).length ≤ 197 := by decide +kernel
#check gram_check_1_87

end Hedetniemi.Round4
