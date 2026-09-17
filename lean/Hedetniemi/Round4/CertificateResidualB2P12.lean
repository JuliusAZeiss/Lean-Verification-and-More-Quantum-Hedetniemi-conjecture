import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_96 : ∀ j : Fin 97,
    listResidual 2 96 j.val = expectedResidual 2 96 j.val := by decide +kernel
theorem dd_check_2_96 : expectedRowCheck 2 96 = true := by decide +kernel
theorem list_length_2_96 : (listFactorRows 2 96).length ≤ 197 := by decide +kernel
#check gram_check_2_96

theorem gram_check_2_97 : ∀ j : Fin 98,
    listResidual 2 97 j.val = expectedResidual 2 97 j.val := by decide +kernel
theorem dd_check_2_97 : expectedRowCheck 2 97 = true := by decide +kernel
theorem list_length_2_97 : (listFactorRows 2 97).length ≤ 197 := by decide +kernel
#check gram_check_2_97

theorem gram_check_2_98 : ∀ j : Fin 99,
    listResidual 2 98 j.val = expectedResidual 2 98 j.val := by decide +kernel
theorem dd_check_2_98 : expectedRowCheck 2 98 = true := by decide +kernel
theorem list_length_2_98 : (listFactorRows 2 98).length ≤ 197 := by decide +kernel
#check gram_check_2_98

theorem gram_check_2_99 : ∀ j : Fin 100,
    listResidual 2 99 j.val = expectedResidual 2 99 j.val := by decide +kernel
theorem dd_check_2_99 : expectedRowCheck 2 99 = true := by decide +kernel
theorem list_length_2_99 : (listFactorRows 2 99).length ≤ 197 := by decide +kernel
#check gram_check_2_99

theorem gram_check_2_100 : ∀ j : Fin 101,
    listResidual 2 100 j.val = expectedResidual 2 100 j.val := by decide +kernel
theorem dd_check_2_100 : expectedRowCheck 2 100 = true := by decide +kernel
theorem list_length_2_100 : (listFactorRows 2 100).length ≤ 197 := by decide +kernel
#check gram_check_2_100

theorem gram_check_2_101 : ∀ j : Fin 102,
    listResidual 2 101 j.val = expectedResidual 2 101 j.val := by decide +kernel
theorem dd_check_2_101 : expectedRowCheck 2 101 = true := by decide +kernel
theorem list_length_2_101 : (listFactorRows 2 101).length ≤ 197 := by decide +kernel
#check gram_check_2_101

theorem gram_check_2_102 : ∀ j : Fin 103,
    listResidual 2 102 j.val = expectedResidual 2 102 j.val := by decide +kernel
theorem dd_check_2_102 : expectedRowCheck 2 102 = true := by decide +kernel
theorem list_length_2_102 : (listFactorRows 2 102).length ≤ 197 := by decide +kernel
#check gram_check_2_102

theorem gram_check_2_103 : ∀ j : Fin 104,
    listResidual 2 103 j.val = expectedResidual 2 103 j.val := by decide +kernel
theorem dd_check_2_103 : expectedRowCheck 2 103 = true := by decide +kernel
theorem list_length_2_103 : (listFactorRows 2 103).length ≤ 197 := by decide +kernel
#check gram_check_2_103

end Hedetniemi.Round4
