import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_128 : ∀ j : Fin 129,
    listResidual 3 128 j.val = expectedResidual 3 128 j.val := by decide +kernel
theorem dd_check_3_128 : expectedRowCheck 3 128 = true := by decide +kernel
theorem list_length_3_128 : (listFactorRows 3 128).length ≤ 197 := by decide +kernel
#check gram_check_3_128

theorem gram_check_3_129 : ∀ j : Fin 130,
    listResidual 3 129 j.val = expectedResidual 3 129 j.val := by decide +kernel
theorem dd_check_3_129 : expectedRowCheck 3 129 = true := by decide +kernel
theorem list_length_3_129 : (listFactorRows 3 129).length ≤ 197 := by decide +kernel
#check gram_check_3_129

theorem gram_check_3_130 : ∀ j : Fin 131,
    listResidual 3 130 j.val = expectedResidual 3 130 j.val := by decide +kernel
theorem dd_check_3_130 : expectedRowCheck 3 130 = true := by decide +kernel
theorem list_length_3_130 : (listFactorRows 3 130).length ≤ 197 := by decide +kernel
#check gram_check_3_130

theorem gram_check_3_131 : ∀ j : Fin 132,
    listResidual 3 131 j.val = expectedResidual 3 131 j.val := by decide +kernel
theorem dd_check_3_131 : expectedRowCheck 3 131 = true := by decide +kernel
theorem list_length_3_131 : (listFactorRows 3 131).length ≤ 197 := by decide +kernel
#check gram_check_3_131

theorem gram_check_3_132 : ∀ j : Fin 133,
    listResidual 3 132 j.val = expectedResidual 3 132 j.val := by decide +kernel
theorem dd_check_3_132 : expectedRowCheck 3 132 = true := by decide +kernel
theorem list_length_3_132 : (listFactorRows 3 132).length ≤ 197 := by decide +kernel
#check gram_check_3_132

theorem gram_check_3_133 : ∀ j : Fin 134,
    listResidual 3 133 j.val = expectedResidual 3 133 j.val := by decide +kernel
theorem dd_check_3_133 : expectedRowCheck 3 133 = true := by decide +kernel
theorem list_length_3_133 : (listFactorRows 3 133).length ≤ 197 := by decide +kernel
#check gram_check_3_133

theorem gram_check_3_134 : ∀ j : Fin 135,
    listResidual 3 134 j.val = expectedResidual 3 134 j.val := by decide +kernel
theorem dd_check_3_134 : expectedRowCheck 3 134 = true := by decide +kernel
theorem list_length_3_134 : (listFactorRows 3 134).length ≤ 197 := by decide +kernel
#check gram_check_3_134

theorem gram_check_3_135 : ∀ j : Fin 136,
    listResidual 3 135 j.val = expectedResidual 3 135 j.val := by decide +kernel
theorem dd_check_3_135 : expectedRowCheck 3 135 = true := by decide +kernel
theorem list_length_3_135 : (listFactorRows 3 135).length ≤ 197 := by decide +kernel
#check gram_check_3_135

end Hedetniemi.Round4
