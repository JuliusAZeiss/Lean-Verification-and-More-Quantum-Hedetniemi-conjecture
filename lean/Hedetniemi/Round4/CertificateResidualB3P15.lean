import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_120 : ∀ j : Fin 121,
    listResidual 3 120 j.val = expectedResidual 3 120 j.val := by decide +kernel
theorem dd_check_3_120 : expectedRowCheck 3 120 = true := by decide +kernel
theorem list_length_3_120 : (listFactorRows 3 120).length ≤ 197 := by decide +kernel
#check gram_check_3_120

theorem gram_check_3_121 : ∀ j : Fin 122,
    listResidual 3 121 j.val = expectedResidual 3 121 j.val := by decide +kernel
theorem dd_check_3_121 : expectedRowCheck 3 121 = true := by decide +kernel
theorem list_length_3_121 : (listFactorRows 3 121).length ≤ 197 := by decide +kernel
#check gram_check_3_121

theorem gram_check_3_122 : ∀ j : Fin 123,
    listResidual 3 122 j.val = expectedResidual 3 122 j.val := by decide +kernel
theorem dd_check_3_122 : expectedRowCheck 3 122 = true := by decide +kernel
theorem list_length_3_122 : (listFactorRows 3 122).length ≤ 197 := by decide +kernel
#check gram_check_3_122

theorem gram_check_3_123 : ∀ j : Fin 124,
    listResidual 3 123 j.val = expectedResidual 3 123 j.val := by decide +kernel
theorem dd_check_3_123 : expectedRowCheck 3 123 = true := by decide +kernel
theorem list_length_3_123 : (listFactorRows 3 123).length ≤ 197 := by decide +kernel
#check gram_check_3_123

theorem gram_check_3_124 : ∀ j : Fin 125,
    listResidual 3 124 j.val = expectedResidual 3 124 j.val := by decide +kernel
theorem dd_check_3_124 : expectedRowCheck 3 124 = true := by decide +kernel
theorem list_length_3_124 : (listFactorRows 3 124).length ≤ 197 := by decide +kernel
#check gram_check_3_124

theorem gram_check_3_125 : ∀ j : Fin 126,
    listResidual 3 125 j.val = expectedResidual 3 125 j.val := by decide +kernel
theorem dd_check_3_125 : expectedRowCheck 3 125 = true := by decide +kernel
theorem list_length_3_125 : (listFactorRows 3 125).length ≤ 197 := by decide +kernel
#check gram_check_3_125

theorem gram_check_3_126 : ∀ j : Fin 127,
    listResidual 3 126 j.val = expectedResidual 3 126 j.val := by decide +kernel
theorem dd_check_3_126 : expectedRowCheck 3 126 = true := by decide +kernel
theorem list_length_3_126 : (listFactorRows 3 126).length ≤ 197 := by decide +kernel
#check gram_check_3_126

theorem gram_check_3_127 : ∀ j : Fin 128,
    listResidual 3 127 j.val = expectedResidual 3 127 j.val := by decide +kernel
theorem dd_check_3_127 : expectedRowCheck 3 127 = true := by decide +kernel
theorem list_length_3_127 : (listFactorRows 3 127).length ≤ 197 := by decide +kernel
#check gram_check_3_127

end Hedetniemi.Round4
