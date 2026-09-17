import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_128 : ∀ j : Fin 129,
    listResidual 2 128 j.val = expectedResidual 2 128 j.val := by decide +kernel
theorem dd_check_2_128 : expectedRowCheck 2 128 = true := by decide +kernel
theorem list_length_2_128 : (listFactorRows 2 128).length ≤ 197 := by decide +kernel
#check gram_check_2_128

theorem gram_check_2_129 : ∀ j : Fin 130,
    listResidual 2 129 j.val = expectedResidual 2 129 j.val := by decide +kernel
theorem dd_check_2_129 : expectedRowCheck 2 129 = true := by decide +kernel
theorem list_length_2_129 : (listFactorRows 2 129).length ≤ 197 := by decide +kernel
#check gram_check_2_129

theorem gram_check_2_130 : ∀ j : Fin 131,
    listResidual 2 130 j.val = expectedResidual 2 130 j.val := by decide +kernel
theorem dd_check_2_130 : expectedRowCheck 2 130 = true := by decide +kernel
theorem list_length_2_130 : (listFactorRows 2 130).length ≤ 197 := by decide +kernel
#check gram_check_2_130

theorem gram_check_2_131 : ∀ j : Fin 132,
    listResidual 2 131 j.val = expectedResidual 2 131 j.val := by decide +kernel
theorem dd_check_2_131 : expectedRowCheck 2 131 = true := by decide +kernel
theorem list_length_2_131 : (listFactorRows 2 131).length ≤ 197 := by decide +kernel
#check gram_check_2_131

theorem gram_check_2_132 : ∀ j : Fin 133,
    listResidual 2 132 j.val = expectedResidual 2 132 j.val := by decide +kernel
theorem dd_check_2_132 : expectedRowCheck 2 132 = true := by decide +kernel
theorem list_length_2_132 : (listFactorRows 2 132).length ≤ 197 := by decide +kernel
#check gram_check_2_132

theorem gram_check_2_133 : ∀ j : Fin 134,
    listResidual 2 133 j.val = expectedResidual 2 133 j.val := by decide +kernel
theorem dd_check_2_133 : expectedRowCheck 2 133 = true := by decide +kernel
theorem list_length_2_133 : (listFactorRows 2 133).length ≤ 197 := by decide +kernel
#check gram_check_2_133

theorem gram_check_2_134 : ∀ j : Fin 135,
    listResidual 2 134 j.val = expectedResidual 2 134 j.val := by decide +kernel
theorem dd_check_2_134 : expectedRowCheck 2 134 = true := by decide +kernel
theorem list_length_2_134 : (listFactorRows 2 134).length ≤ 197 := by decide +kernel
#check gram_check_2_134

theorem gram_check_2_135 : ∀ j : Fin 136,
    listResidual 2 135 j.val = expectedResidual 2 135 j.val := by decide +kernel
theorem dd_check_2_135 : expectedRowCheck 2 135 = true := by decide +kernel
theorem list_length_2_135 : (listFactorRows 2 135).length ≤ 197 := by decide +kernel
#check gram_check_2_135

end Hedetniemi.Round4
