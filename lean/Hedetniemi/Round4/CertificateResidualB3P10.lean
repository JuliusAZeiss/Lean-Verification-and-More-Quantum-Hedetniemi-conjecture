import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_80 : ∀ j : Fin 81,
    listResidual 3 80 j.val = expectedResidual 3 80 j.val := by decide +kernel
theorem dd_check_3_80 : expectedRowCheck 3 80 = true := by decide +kernel
theorem list_length_3_80 : (listFactorRows 3 80).length ≤ 197 := by decide +kernel
#check gram_check_3_80

theorem gram_check_3_81 : ∀ j : Fin 82,
    listResidual 3 81 j.val = expectedResidual 3 81 j.val := by decide +kernel
theorem dd_check_3_81 : expectedRowCheck 3 81 = true := by decide +kernel
theorem list_length_3_81 : (listFactorRows 3 81).length ≤ 197 := by decide +kernel
#check gram_check_3_81

theorem gram_check_3_82 : ∀ j : Fin 83,
    listResidual 3 82 j.val = expectedResidual 3 82 j.val := by decide +kernel
theorem dd_check_3_82 : expectedRowCheck 3 82 = true := by decide +kernel
theorem list_length_3_82 : (listFactorRows 3 82).length ≤ 197 := by decide +kernel
#check gram_check_3_82

theorem gram_check_3_83 : ∀ j : Fin 84,
    listResidual 3 83 j.val = expectedResidual 3 83 j.val := by decide +kernel
theorem dd_check_3_83 : expectedRowCheck 3 83 = true := by decide +kernel
theorem list_length_3_83 : (listFactorRows 3 83).length ≤ 197 := by decide +kernel
#check gram_check_3_83

theorem gram_check_3_84 : ∀ j : Fin 85,
    listResidual 3 84 j.val = expectedResidual 3 84 j.val := by decide +kernel
theorem dd_check_3_84 : expectedRowCheck 3 84 = true := by decide +kernel
theorem list_length_3_84 : (listFactorRows 3 84).length ≤ 197 := by decide +kernel
#check gram_check_3_84

theorem gram_check_3_85 : ∀ j : Fin 86,
    listResidual 3 85 j.val = expectedResidual 3 85 j.val := by decide +kernel
theorem dd_check_3_85 : expectedRowCheck 3 85 = true := by decide +kernel
theorem list_length_3_85 : (listFactorRows 3 85).length ≤ 197 := by decide +kernel
#check gram_check_3_85

theorem gram_check_3_86 : ∀ j : Fin 87,
    listResidual 3 86 j.val = expectedResidual 3 86 j.val := by decide +kernel
theorem dd_check_3_86 : expectedRowCheck 3 86 = true := by decide +kernel
theorem list_length_3_86 : (listFactorRows 3 86).length ≤ 197 := by decide +kernel
#check gram_check_3_86

theorem gram_check_3_87 : ∀ j : Fin 88,
    listResidual 3 87 j.val = expectedResidual 3 87 j.val := by decide +kernel
theorem dd_check_3_87 : expectedRowCheck 3 87 = true := by decide +kernel
theorem list_length_3_87 : (listFactorRows 3 87).length ≤ 197 := by decide +kernel
#check gram_check_3_87

end Hedetniemi.Round4
