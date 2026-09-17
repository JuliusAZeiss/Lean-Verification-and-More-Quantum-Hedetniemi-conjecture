import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_96 : ∀ j : Fin 97,
    listResidual 0 96 j.val = expectedResidual 0 96 j.val := by decide +kernel
theorem dd_check_0_96 : expectedRowCheck 0 96 = true := by decide +kernel
theorem list_length_0_96 : (listFactorRows 0 96).length ≤ 197 := by decide +kernel
#check gram_check_0_96

theorem gram_check_0_97 : ∀ j : Fin 98,
    listResidual 0 97 j.val = expectedResidual 0 97 j.val := by decide +kernel
theorem dd_check_0_97 : expectedRowCheck 0 97 = true := by decide +kernel
theorem list_length_0_97 : (listFactorRows 0 97).length ≤ 197 := by decide +kernel
#check gram_check_0_97

theorem gram_check_0_98 : ∀ j : Fin 99,
    listResidual 0 98 j.val = expectedResidual 0 98 j.val := by decide +kernel
theorem dd_check_0_98 : expectedRowCheck 0 98 = true := by decide +kernel
theorem list_length_0_98 : (listFactorRows 0 98).length ≤ 197 := by decide +kernel
#check gram_check_0_98

theorem gram_check_0_99 : ∀ j : Fin 100,
    listResidual 0 99 j.val = expectedResidual 0 99 j.val := by decide +kernel
theorem dd_check_0_99 : expectedRowCheck 0 99 = true := by decide +kernel
theorem list_length_0_99 : (listFactorRows 0 99).length ≤ 197 := by decide +kernel
#check gram_check_0_99

theorem gram_check_0_100 : ∀ j : Fin 101,
    listResidual 0 100 j.val = expectedResidual 0 100 j.val := by decide +kernel
theorem dd_check_0_100 : expectedRowCheck 0 100 = true := by decide +kernel
theorem list_length_0_100 : (listFactorRows 0 100).length ≤ 197 := by decide +kernel
#check gram_check_0_100

theorem gram_check_0_101 : ∀ j : Fin 102,
    listResidual 0 101 j.val = expectedResidual 0 101 j.val := by decide +kernel
theorem dd_check_0_101 : expectedRowCheck 0 101 = true := by decide +kernel
theorem list_length_0_101 : (listFactorRows 0 101).length ≤ 197 := by decide +kernel
#check gram_check_0_101

theorem gram_check_0_102 : ∀ j : Fin 103,
    listResidual 0 102 j.val = expectedResidual 0 102 j.val := by decide +kernel
theorem dd_check_0_102 : expectedRowCheck 0 102 = true := by decide +kernel
theorem list_length_0_102 : (listFactorRows 0 102).length ≤ 197 := by decide +kernel
#check gram_check_0_102

theorem gram_check_0_103 : ∀ j : Fin 104,
    listResidual 0 103 j.val = expectedResidual 0 103 j.val := by decide +kernel
theorem dd_check_0_103 : expectedRowCheck 0 103 = true := by decide +kernel
theorem list_length_0_103 : (listFactorRows 0 103).length ≤ 197 := by decide +kernel
#check gram_check_0_103

end Hedetniemi.Round4
