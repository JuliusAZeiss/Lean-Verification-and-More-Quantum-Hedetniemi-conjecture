import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_96 : ∀ j : Fin 97,
    listResidual 1 96 j.val = expectedResidual 1 96 j.val := by decide +kernel
theorem dd_check_1_96 : expectedRowCheck 1 96 = true := by decide +kernel
theorem list_length_1_96 : (listFactorRows 1 96).length ≤ 197 := by decide +kernel
#check gram_check_1_96

theorem gram_check_1_97 : ∀ j : Fin 98,
    listResidual 1 97 j.val = expectedResidual 1 97 j.val := by decide +kernel
theorem dd_check_1_97 : expectedRowCheck 1 97 = true := by decide +kernel
theorem list_length_1_97 : (listFactorRows 1 97).length ≤ 197 := by decide +kernel
#check gram_check_1_97

theorem gram_check_1_98 : ∀ j : Fin 99,
    listResidual 1 98 j.val = expectedResidual 1 98 j.val := by decide +kernel
theorem dd_check_1_98 : expectedRowCheck 1 98 = true := by decide +kernel
theorem list_length_1_98 : (listFactorRows 1 98).length ≤ 197 := by decide +kernel
#check gram_check_1_98

theorem gram_check_1_99 : ∀ j : Fin 100,
    listResidual 1 99 j.val = expectedResidual 1 99 j.val := by decide +kernel
theorem dd_check_1_99 : expectedRowCheck 1 99 = true := by decide +kernel
theorem list_length_1_99 : (listFactorRows 1 99).length ≤ 197 := by decide +kernel
#check gram_check_1_99

theorem gram_check_1_100 : ∀ j : Fin 101,
    listResidual 1 100 j.val = expectedResidual 1 100 j.val := by decide +kernel
theorem dd_check_1_100 : expectedRowCheck 1 100 = true := by decide +kernel
theorem list_length_1_100 : (listFactorRows 1 100).length ≤ 197 := by decide +kernel
#check gram_check_1_100

theorem gram_check_1_101 : ∀ j : Fin 102,
    listResidual 1 101 j.val = expectedResidual 1 101 j.val := by decide +kernel
theorem dd_check_1_101 : expectedRowCheck 1 101 = true := by decide +kernel
theorem list_length_1_101 : (listFactorRows 1 101).length ≤ 197 := by decide +kernel
#check gram_check_1_101

theorem gram_check_1_102 : ∀ j : Fin 103,
    listResidual 1 102 j.val = expectedResidual 1 102 j.val := by decide +kernel
theorem dd_check_1_102 : expectedRowCheck 1 102 = true := by decide +kernel
theorem list_length_1_102 : (listFactorRows 1 102).length ≤ 197 := by decide +kernel
#check gram_check_1_102

theorem gram_check_1_103 : ∀ j : Fin 104,
    listResidual 1 103 j.val = expectedResidual 1 103 j.val := by decide +kernel
theorem dd_check_1_103 : expectedRowCheck 1 103 = true := by decide +kernel
theorem list_length_1_103 : (listFactorRows 1 103).length ≤ 197 := by decide +kernel
#check gram_check_1_103

end Hedetniemi.Round4
