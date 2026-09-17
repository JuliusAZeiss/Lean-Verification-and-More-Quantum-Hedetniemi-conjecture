import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_80 : ∀ j : Fin 81,
    listResidual 2 80 j.val = expectedResidual 2 80 j.val := by decide +kernel
theorem dd_check_2_80 : expectedRowCheck 2 80 = true := by decide +kernel
theorem list_length_2_80 : (listFactorRows 2 80).length ≤ 197 := by decide +kernel
#check gram_check_2_80

theorem gram_check_2_81 : ∀ j : Fin 82,
    listResidual 2 81 j.val = expectedResidual 2 81 j.val := by decide +kernel
theorem dd_check_2_81 : expectedRowCheck 2 81 = true := by decide +kernel
theorem list_length_2_81 : (listFactorRows 2 81).length ≤ 197 := by decide +kernel
#check gram_check_2_81

theorem gram_check_2_82 : ∀ j : Fin 83,
    listResidual 2 82 j.val = expectedResidual 2 82 j.val := by decide +kernel
theorem dd_check_2_82 : expectedRowCheck 2 82 = true := by decide +kernel
theorem list_length_2_82 : (listFactorRows 2 82).length ≤ 197 := by decide +kernel
#check gram_check_2_82

theorem gram_check_2_83 : ∀ j : Fin 84,
    listResidual 2 83 j.val = expectedResidual 2 83 j.val := by decide +kernel
theorem dd_check_2_83 : expectedRowCheck 2 83 = true := by decide +kernel
theorem list_length_2_83 : (listFactorRows 2 83).length ≤ 197 := by decide +kernel
#check gram_check_2_83

theorem gram_check_2_84 : ∀ j : Fin 85,
    listResidual 2 84 j.val = expectedResidual 2 84 j.val := by decide +kernel
theorem dd_check_2_84 : expectedRowCheck 2 84 = true := by decide +kernel
theorem list_length_2_84 : (listFactorRows 2 84).length ≤ 197 := by decide +kernel
#check gram_check_2_84

theorem gram_check_2_85 : ∀ j : Fin 86,
    listResidual 2 85 j.val = expectedResidual 2 85 j.val := by decide +kernel
theorem dd_check_2_85 : expectedRowCheck 2 85 = true := by decide +kernel
theorem list_length_2_85 : (listFactorRows 2 85).length ≤ 197 := by decide +kernel
#check gram_check_2_85

theorem gram_check_2_86 : ∀ j : Fin 87,
    listResidual 2 86 j.val = expectedResidual 2 86 j.val := by decide +kernel
theorem dd_check_2_86 : expectedRowCheck 2 86 = true := by decide +kernel
theorem list_length_2_86 : (listFactorRows 2 86).length ≤ 197 := by decide +kernel
#check gram_check_2_86

theorem gram_check_2_87 : ∀ j : Fin 88,
    listResidual 2 87 j.val = expectedResidual 2 87 j.val := by decide +kernel
theorem dd_check_2_87 : expectedRowCheck 2 87 = true := by decide +kernel
theorem list_length_2_87 : (listFactorRows 2 87).length ≤ 197 := by decide +kernel
#check gram_check_2_87

end Hedetniemi.Round4
