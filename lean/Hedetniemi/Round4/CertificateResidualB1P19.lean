import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_152 : ∀ j : Fin 153,
    listResidual 1 152 j.val = expectedResidual 1 152 j.val := by decide +kernel
theorem dd_check_1_152 : expectedRowCheck 1 152 = true := by decide +kernel
theorem list_length_1_152 : (listFactorRows 1 152).length ≤ 197 := by decide +kernel
#check gram_check_1_152

theorem gram_check_1_153 : ∀ j : Fin 154,
    listResidual 1 153 j.val = expectedResidual 1 153 j.val := by decide +kernel
theorem dd_check_1_153 : expectedRowCheck 1 153 = true := by decide +kernel
theorem list_length_1_153 : (listFactorRows 1 153).length ≤ 197 := by decide +kernel
#check gram_check_1_153

theorem gram_check_1_154 : ∀ j : Fin 155,
    listResidual 1 154 j.val = expectedResidual 1 154 j.val := by decide +kernel
theorem dd_check_1_154 : expectedRowCheck 1 154 = true := by decide +kernel
theorem list_length_1_154 : (listFactorRows 1 154).length ≤ 197 := by decide +kernel
#check gram_check_1_154

theorem gram_check_1_155 : ∀ j : Fin 156,
    listResidual 1 155 j.val = expectedResidual 1 155 j.val := by decide +kernel
theorem dd_check_1_155 : expectedRowCheck 1 155 = true := by decide +kernel
theorem list_length_1_155 : (listFactorRows 1 155).length ≤ 197 := by decide +kernel
#check gram_check_1_155

theorem gram_check_1_156 : ∀ j : Fin 157,
    listResidual 1 156 j.val = expectedResidual 1 156 j.val := by decide +kernel
theorem dd_check_1_156 : expectedRowCheck 1 156 = true := by decide +kernel
theorem list_length_1_156 : (listFactorRows 1 156).length ≤ 197 := by decide +kernel
#check gram_check_1_156

theorem gram_check_1_157 : ∀ j : Fin 158,
    listResidual 1 157 j.val = expectedResidual 1 157 j.val := by decide +kernel
theorem dd_check_1_157 : expectedRowCheck 1 157 = true := by decide +kernel
theorem list_length_1_157 : (listFactorRows 1 157).length ≤ 197 := by decide +kernel
#check gram_check_1_157

theorem gram_check_1_158 : ∀ j : Fin 159,
    listResidual 1 158 j.val = expectedResidual 1 158 j.val := by decide +kernel
theorem dd_check_1_158 : expectedRowCheck 1 158 = true := by decide +kernel
theorem list_length_1_158 : (listFactorRows 1 158).length ≤ 197 := by decide +kernel
#check gram_check_1_158

theorem gram_check_1_159 : ∀ j : Fin 160,
    listResidual 1 159 j.val = expectedResidual 1 159 j.val := by decide +kernel
theorem dd_check_1_159 : expectedRowCheck 1 159 = true := by decide +kernel
theorem list_length_1_159 : (listFactorRows 1 159).length ≤ 197 := by decide +kernel
#check gram_check_1_159

end Hedetniemi.Round4
