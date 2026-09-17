import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_152 : ∀ j : Fin 153,
    listResidual 0 152 j.val = expectedResidual 0 152 j.val := by decide +kernel
theorem dd_check_0_152 : expectedRowCheck 0 152 = true := by decide +kernel
theorem list_length_0_152 : (listFactorRows 0 152).length ≤ 197 := by decide +kernel
#check gram_check_0_152

theorem gram_check_0_153 : ∀ j : Fin 154,
    listResidual 0 153 j.val = expectedResidual 0 153 j.val := by decide +kernel
theorem dd_check_0_153 : expectedRowCheck 0 153 = true := by decide +kernel
theorem list_length_0_153 : (listFactorRows 0 153).length ≤ 197 := by decide +kernel
#check gram_check_0_153

theorem gram_check_0_154 : ∀ j : Fin 155,
    listResidual 0 154 j.val = expectedResidual 0 154 j.val := by decide +kernel
theorem dd_check_0_154 : expectedRowCheck 0 154 = true := by decide +kernel
theorem list_length_0_154 : (listFactorRows 0 154).length ≤ 197 := by decide +kernel
#check gram_check_0_154

theorem gram_check_0_155 : ∀ j : Fin 156,
    listResidual 0 155 j.val = expectedResidual 0 155 j.val := by decide +kernel
theorem dd_check_0_155 : expectedRowCheck 0 155 = true := by decide +kernel
theorem list_length_0_155 : (listFactorRows 0 155).length ≤ 197 := by decide +kernel
#check gram_check_0_155

theorem gram_check_0_156 : ∀ j : Fin 157,
    listResidual 0 156 j.val = expectedResidual 0 156 j.val := by decide +kernel
theorem dd_check_0_156 : expectedRowCheck 0 156 = true := by decide +kernel
theorem list_length_0_156 : (listFactorRows 0 156).length ≤ 197 := by decide +kernel
#check gram_check_0_156

theorem gram_check_0_157 : ∀ j : Fin 158,
    listResidual 0 157 j.val = expectedResidual 0 157 j.val := by decide +kernel
theorem dd_check_0_157 : expectedRowCheck 0 157 = true := by decide +kernel
theorem list_length_0_157 : (listFactorRows 0 157).length ≤ 197 := by decide +kernel
#check gram_check_0_157

theorem gram_check_0_158 : ∀ j : Fin 159,
    listResidual 0 158 j.val = expectedResidual 0 158 j.val := by decide +kernel
theorem dd_check_0_158 : expectedRowCheck 0 158 = true := by decide +kernel
theorem list_length_0_158 : (listFactorRows 0 158).length ≤ 197 := by decide +kernel
#check gram_check_0_158

theorem gram_check_0_159 : ∀ j : Fin 160,
    listResidual 0 159 j.val = expectedResidual 0 159 j.val := by decide +kernel
theorem dd_check_0_159 : expectedRowCheck 0 159 = true := by decide +kernel
theorem list_length_0_159 : (listFactorRows 0 159).length ≤ 197 := by decide +kernel
#check gram_check_0_159

end Hedetniemi.Round4
