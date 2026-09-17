import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_120 : ∀ j : Fin 121,
    listResidual 0 120 j.val = expectedResidual 0 120 j.val := by decide +kernel
theorem dd_check_0_120 : expectedRowCheck 0 120 = true := by decide +kernel
theorem list_length_0_120 : (listFactorRows 0 120).length ≤ 197 := by decide +kernel
#check gram_check_0_120

theorem gram_check_0_121 : ∀ j : Fin 122,
    listResidual 0 121 j.val = expectedResidual 0 121 j.val := by decide +kernel
theorem dd_check_0_121 : expectedRowCheck 0 121 = true := by decide +kernel
theorem list_length_0_121 : (listFactorRows 0 121).length ≤ 197 := by decide +kernel
#check gram_check_0_121

theorem gram_check_0_122 : ∀ j : Fin 123,
    listResidual 0 122 j.val = expectedResidual 0 122 j.val := by decide +kernel
theorem dd_check_0_122 : expectedRowCheck 0 122 = true := by decide +kernel
theorem list_length_0_122 : (listFactorRows 0 122).length ≤ 197 := by decide +kernel
#check gram_check_0_122

theorem gram_check_0_123 : ∀ j : Fin 124,
    listResidual 0 123 j.val = expectedResidual 0 123 j.val := by decide +kernel
theorem dd_check_0_123 : expectedRowCheck 0 123 = true := by decide +kernel
theorem list_length_0_123 : (listFactorRows 0 123).length ≤ 197 := by decide +kernel
#check gram_check_0_123

theorem gram_check_0_124 : ∀ j : Fin 125,
    listResidual 0 124 j.val = expectedResidual 0 124 j.val := by decide +kernel
theorem dd_check_0_124 : expectedRowCheck 0 124 = true := by decide +kernel
theorem list_length_0_124 : (listFactorRows 0 124).length ≤ 197 := by decide +kernel
#check gram_check_0_124

theorem gram_check_0_125 : ∀ j : Fin 126,
    listResidual 0 125 j.val = expectedResidual 0 125 j.val := by decide +kernel
theorem dd_check_0_125 : expectedRowCheck 0 125 = true := by decide +kernel
theorem list_length_0_125 : (listFactorRows 0 125).length ≤ 197 := by decide +kernel
#check gram_check_0_125

theorem gram_check_0_126 : ∀ j : Fin 127,
    listResidual 0 126 j.val = expectedResidual 0 126 j.val := by decide +kernel
theorem dd_check_0_126 : expectedRowCheck 0 126 = true := by decide +kernel
theorem list_length_0_126 : (listFactorRows 0 126).length ≤ 197 := by decide +kernel
#check gram_check_0_126

theorem gram_check_0_127 : ∀ j : Fin 128,
    listResidual 0 127 j.val = expectedResidual 0 127 j.val := by decide +kernel
theorem dd_check_0_127 : expectedRowCheck 0 127 = true := by decide +kernel
theorem list_length_0_127 : (listFactorRows 0 127).length ≤ 197 := by decide +kernel
#check gram_check_0_127

end Hedetniemi.Round4
