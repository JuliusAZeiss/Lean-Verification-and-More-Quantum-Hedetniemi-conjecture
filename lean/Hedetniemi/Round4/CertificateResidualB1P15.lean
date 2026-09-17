import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_120 : ∀ j : Fin 121,
    listResidual 1 120 j.val = expectedResidual 1 120 j.val := by decide +kernel
theorem dd_check_1_120 : expectedRowCheck 1 120 = true := by decide +kernel
theorem list_length_1_120 : (listFactorRows 1 120).length ≤ 197 := by decide +kernel
#check gram_check_1_120

theorem gram_check_1_121 : ∀ j : Fin 122,
    listResidual 1 121 j.val = expectedResidual 1 121 j.val := by decide +kernel
theorem dd_check_1_121 : expectedRowCheck 1 121 = true := by decide +kernel
theorem list_length_1_121 : (listFactorRows 1 121).length ≤ 197 := by decide +kernel
#check gram_check_1_121

theorem gram_check_1_122 : ∀ j : Fin 123,
    listResidual 1 122 j.val = expectedResidual 1 122 j.val := by decide +kernel
theorem dd_check_1_122 : expectedRowCheck 1 122 = true := by decide +kernel
theorem list_length_1_122 : (listFactorRows 1 122).length ≤ 197 := by decide +kernel
#check gram_check_1_122

theorem gram_check_1_123 : ∀ j : Fin 124,
    listResidual 1 123 j.val = expectedResidual 1 123 j.val := by decide +kernel
theorem dd_check_1_123 : expectedRowCheck 1 123 = true := by decide +kernel
theorem list_length_1_123 : (listFactorRows 1 123).length ≤ 197 := by decide +kernel
#check gram_check_1_123

theorem gram_check_1_124 : ∀ j : Fin 125,
    listResidual 1 124 j.val = expectedResidual 1 124 j.val := by decide +kernel
theorem dd_check_1_124 : expectedRowCheck 1 124 = true := by decide +kernel
theorem list_length_1_124 : (listFactorRows 1 124).length ≤ 197 := by decide +kernel
#check gram_check_1_124

theorem gram_check_1_125 : ∀ j : Fin 126,
    listResidual 1 125 j.val = expectedResidual 1 125 j.val := by decide +kernel
theorem dd_check_1_125 : expectedRowCheck 1 125 = true := by decide +kernel
theorem list_length_1_125 : (listFactorRows 1 125).length ≤ 197 := by decide +kernel
#check gram_check_1_125

theorem gram_check_1_126 : ∀ j : Fin 127,
    listResidual 1 126 j.val = expectedResidual 1 126 j.val := by decide +kernel
theorem dd_check_1_126 : expectedRowCheck 1 126 = true := by decide +kernel
theorem list_length_1_126 : (listFactorRows 1 126).length ≤ 197 := by decide +kernel
#check gram_check_1_126

theorem gram_check_1_127 : ∀ j : Fin 128,
    listResidual 1 127 j.val = expectedResidual 1 127 j.val := by decide +kernel
theorem dd_check_1_127 : expectedRowCheck 1 127 = true := by decide +kernel
theorem list_length_1_127 : (listFactorRows 1 127).length ≤ 197 := by decide +kernel
#check gram_check_1_127

end Hedetniemi.Round4
