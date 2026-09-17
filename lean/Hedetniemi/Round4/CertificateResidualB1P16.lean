import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_128 : ∀ j : Fin 129,
    listResidual 1 128 j.val = expectedResidual 1 128 j.val := by decide +kernel
theorem dd_check_1_128 : expectedRowCheck 1 128 = true := by decide +kernel
theorem list_length_1_128 : (listFactorRows 1 128).length ≤ 197 := by decide +kernel
#check gram_check_1_128

theorem gram_check_1_129 : ∀ j : Fin 130,
    listResidual 1 129 j.val = expectedResidual 1 129 j.val := by decide +kernel
theorem dd_check_1_129 : expectedRowCheck 1 129 = true := by decide +kernel
theorem list_length_1_129 : (listFactorRows 1 129).length ≤ 197 := by decide +kernel
#check gram_check_1_129

theorem gram_check_1_130 : ∀ j : Fin 131,
    listResidual 1 130 j.val = expectedResidual 1 130 j.val := by decide +kernel
theorem dd_check_1_130 : expectedRowCheck 1 130 = true := by decide +kernel
theorem list_length_1_130 : (listFactorRows 1 130).length ≤ 197 := by decide +kernel
#check gram_check_1_130

theorem gram_check_1_131 : ∀ j : Fin 132,
    listResidual 1 131 j.val = expectedResidual 1 131 j.val := by decide +kernel
theorem dd_check_1_131 : expectedRowCheck 1 131 = true := by decide +kernel
theorem list_length_1_131 : (listFactorRows 1 131).length ≤ 197 := by decide +kernel
#check gram_check_1_131

theorem gram_check_1_132 : ∀ j : Fin 133,
    listResidual 1 132 j.val = expectedResidual 1 132 j.val := by decide +kernel
theorem dd_check_1_132 : expectedRowCheck 1 132 = true := by decide +kernel
theorem list_length_1_132 : (listFactorRows 1 132).length ≤ 197 := by decide +kernel
#check gram_check_1_132

theorem gram_check_1_133 : ∀ j : Fin 134,
    listResidual 1 133 j.val = expectedResidual 1 133 j.val := by decide +kernel
theorem dd_check_1_133 : expectedRowCheck 1 133 = true := by decide +kernel
theorem list_length_1_133 : (listFactorRows 1 133).length ≤ 197 := by decide +kernel
#check gram_check_1_133

theorem gram_check_1_134 : ∀ j : Fin 135,
    listResidual 1 134 j.val = expectedResidual 1 134 j.val := by decide +kernel
theorem dd_check_1_134 : expectedRowCheck 1 134 = true := by decide +kernel
theorem list_length_1_134 : (listFactorRows 1 134).length ≤ 197 := by decide +kernel
#check gram_check_1_134

theorem gram_check_1_135 : ∀ j : Fin 136,
    listResidual 1 135 j.val = expectedResidual 1 135 j.val := by decide +kernel
theorem dd_check_1_135 : expectedRowCheck 1 135 = true := by decide +kernel
theorem list_length_1_135 : (listFactorRows 1 135).length ≤ 197 := by decide +kernel
#check gram_check_1_135

end Hedetniemi.Round4
