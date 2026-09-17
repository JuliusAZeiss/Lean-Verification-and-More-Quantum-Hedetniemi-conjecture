import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_120 : ∀ j : Fin 121,
    listResidual 2 120 j.val = expectedResidual 2 120 j.val := by decide +kernel
theorem dd_check_2_120 : expectedRowCheck 2 120 = true := by decide +kernel
theorem list_length_2_120 : (listFactorRows 2 120).length ≤ 197 := by decide +kernel
#check gram_check_2_120

theorem gram_check_2_121 : ∀ j : Fin 122,
    listResidual 2 121 j.val = expectedResidual 2 121 j.val := by decide +kernel
theorem dd_check_2_121 : expectedRowCheck 2 121 = true := by decide +kernel
theorem list_length_2_121 : (listFactorRows 2 121).length ≤ 197 := by decide +kernel
#check gram_check_2_121

theorem gram_check_2_122 : ∀ j : Fin 123,
    listResidual 2 122 j.val = expectedResidual 2 122 j.val := by decide +kernel
theorem dd_check_2_122 : expectedRowCheck 2 122 = true := by decide +kernel
theorem list_length_2_122 : (listFactorRows 2 122).length ≤ 197 := by decide +kernel
#check gram_check_2_122

theorem gram_check_2_123 : ∀ j : Fin 124,
    listResidual 2 123 j.val = expectedResidual 2 123 j.val := by decide +kernel
theorem dd_check_2_123 : expectedRowCheck 2 123 = true := by decide +kernel
theorem list_length_2_123 : (listFactorRows 2 123).length ≤ 197 := by decide +kernel
#check gram_check_2_123

theorem gram_check_2_124 : ∀ j : Fin 125,
    listResidual 2 124 j.val = expectedResidual 2 124 j.val := by decide +kernel
theorem dd_check_2_124 : expectedRowCheck 2 124 = true := by decide +kernel
theorem list_length_2_124 : (listFactorRows 2 124).length ≤ 197 := by decide +kernel
#check gram_check_2_124

theorem gram_check_2_125 : ∀ j : Fin 126,
    listResidual 2 125 j.val = expectedResidual 2 125 j.val := by decide +kernel
theorem dd_check_2_125 : expectedRowCheck 2 125 = true := by decide +kernel
theorem list_length_2_125 : (listFactorRows 2 125).length ≤ 197 := by decide +kernel
#check gram_check_2_125

theorem gram_check_2_126 : ∀ j : Fin 127,
    listResidual 2 126 j.val = expectedResidual 2 126 j.val := by decide +kernel
theorem dd_check_2_126 : expectedRowCheck 2 126 = true := by decide +kernel
theorem list_length_2_126 : (listFactorRows 2 126).length ≤ 197 := by decide +kernel
#check gram_check_2_126

theorem gram_check_2_127 : ∀ j : Fin 128,
    listResidual 2 127 j.val = expectedResidual 2 127 j.val := by decide +kernel
theorem dd_check_2_127 : expectedRowCheck 2 127 = true := by decide +kernel
theorem list_length_2_127 : (listFactorRows 2 127).length ≤ 197 := by decide +kernel
#check gram_check_2_127

end Hedetniemi.Round4
