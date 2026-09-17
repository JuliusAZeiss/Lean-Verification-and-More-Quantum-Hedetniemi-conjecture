import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_128 : ∀ j : Fin 129,
    listResidual 0 128 j.val = expectedResidual 0 128 j.val := by decide +kernel
theorem dd_check_0_128 : expectedRowCheck 0 128 = true := by decide +kernel
theorem list_length_0_128 : (listFactorRows 0 128).length ≤ 197 := by decide +kernel
#check gram_check_0_128

theorem gram_check_0_129 : ∀ j : Fin 130,
    listResidual 0 129 j.val = expectedResidual 0 129 j.val := by decide +kernel
theorem dd_check_0_129 : expectedRowCheck 0 129 = true := by decide +kernel
theorem list_length_0_129 : (listFactorRows 0 129).length ≤ 197 := by decide +kernel
#check gram_check_0_129

theorem gram_check_0_130 : ∀ j : Fin 131,
    listResidual 0 130 j.val = expectedResidual 0 130 j.val := by decide +kernel
theorem dd_check_0_130 : expectedRowCheck 0 130 = true := by decide +kernel
theorem list_length_0_130 : (listFactorRows 0 130).length ≤ 197 := by decide +kernel
#check gram_check_0_130

theorem gram_check_0_131 : ∀ j : Fin 132,
    listResidual 0 131 j.val = expectedResidual 0 131 j.val := by decide +kernel
theorem dd_check_0_131 : expectedRowCheck 0 131 = true := by decide +kernel
theorem list_length_0_131 : (listFactorRows 0 131).length ≤ 197 := by decide +kernel
#check gram_check_0_131

theorem gram_check_0_132 : ∀ j : Fin 133,
    listResidual 0 132 j.val = expectedResidual 0 132 j.val := by decide +kernel
theorem dd_check_0_132 : expectedRowCheck 0 132 = true := by decide +kernel
theorem list_length_0_132 : (listFactorRows 0 132).length ≤ 197 := by decide +kernel
#check gram_check_0_132

theorem gram_check_0_133 : ∀ j : Fin 134,
    listResidual 0 133 j.val = expectedResidual 0 133 j.val := by decide +kernel
theorem dd_check_0_133 : expectedRowCheck 0 133 = true := by decide +kernel
theorem list_length_0_133 : (listFactorRows 0 133).length ≤ 197 := by decide +kernel
#check gram_check_0_133

theorem gram_check_0_134 : ∀ j : Fin 135,
    listResidual 0 134 j.val = expectedResidual 0 134 j.val := by decide +kernel
theorem dd_check_0_134 : expectedRowCheck 0 134 = true := by decide +kernel
theorem list_length_0_134 : (listFactorRows 0 134).length ≤ 197 := by decide +kernel
#check gram_check_0_134

theorem gram_check_0_135 : ∀ j : Fin 136,
    listResidual 0 135 j.val = expectedResidual 0 135 j.val := by decide +kernel
theorem dd_check_0_135 : expectedRowCheck 0 135 = true := by decide +kernel
theorem list_length_0_135 : (listFactorRows 0 135).length ≤ 197 := by decide +kernel
#check gram_check_0_135

end Hedetniemi.Round4
