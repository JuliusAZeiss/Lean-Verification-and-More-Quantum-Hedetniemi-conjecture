import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_96 : ∀ j : Fin 97,
    listResidual 3 96 j.val = expectedResidual 3 96 j.val := by decide +kernel
theorem dd_check_3_96 : expectedRowCheck 3 96 = true := by decide +kernel
theorem list_length_3_96 : (listFactorRows 3 96).length ≤ 197 := by decide +kernel
#check gram_check_3_96

theorem gram_check_3_97 : ∀ j : Fin 98,
    listResidual 3 97 j.val = expectedResidual 3 97 j.val := by decide +kernel
theorem dd_check_3_97 : expectedRowCheck 3 97 = true := by decide +kernel
theorem list_length_3_97 : (listFactorRows 3 97).length ≤ 197 := by decide +kernel
#check gram_check_3_97

theorem gram_check_3_98 : ∀ j : Fin 99,
    listResidual 3 98 j.val = expectedResidual 3 98 j.val := by decide +kernel
theorem dd_check_3_98 : expectedRowCheck 3 98 = true := by decide +kernel
theorem list_length_3_98 : (listFactorRows 3 98).length ≤ 197 := by decide +kernel
#check gram_check_3_98

theorem gram_check_3_99 : ∀ j : Fin 100,
    listResidual 3 99 j.val = expectedResidual 3 99 j.val := by decide +kernel
theorem dd_check_3_99 : expectedRowCheck 3 99 = true := by decide +kernel
theorem list_length_3_99 : (listFactorRows 3 99).length ≤ 197 := by decide +kernel
#check gram_check_3_99

theorem gram_check_3_100 : ∀ j : Fin 101,
    listResidual 3 100 j.val = expectedResidual 3 100 j.val := by decide +kernel
theorem dd_check_3_100 : expectedRowCheck 3 100 = true := by decide +kernel
theorem list_length_3_100 : (listFactorRows 3 100).length ≤ 197 := by decide +kernel
#check gram_check_3_100

theorem gram_check_3_101 : ∀ j : Fin 102,
    listResidual 3 101 j.val = expectedResidual 3 101 j.val := by decide +kernel
theorem dd_check_3_101 : expectedRowCheck 3 101 = true := by decide +kernel
theorem list_length_3_101 : (listFactorRows 3 101).length ≤ 197 := by decide +kernel
#check gram_check_3_101

theorem gram_check_3_102 : ∀ j : Fin 103,
    listResidual 3 102 j.val = expectedResidual 3 102 j.val := by decide +kernel
theorem dd_check_3_102 : expectedRowCheck 3 102 = true := by decide +kernel
theorem list_length_3_102 : (listFactorRows 3 102).length ≤ 197 := by decide +kernel
#check gram_check_3_102

theorem gram_check_3_103 : ∀ j : Fin 104,
    listResidual 3 103 j.val = expectedResidual 3 103 j.val := by decide +kernel
theorem dd_check_3_103 : expectedRowCheck 3 103 = true := by decide +kernel
theorem list_length_3_103 : (listFactorRows 3 103).length ≤ 197 := by decide +kernel
#check gram_check_3_103

end Hedetniemi.Round4
