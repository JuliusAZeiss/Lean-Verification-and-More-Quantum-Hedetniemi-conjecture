import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_152 : ∀ j : Fin 153,
    listResidual 2 152 j.val = expectedResidual 2 152 j.val := by decide +kernel
theorem dd_check_2_152 : expectedRowCheck 2 152 = true := by decide +kernel
theorem list_length_2_152 : (listFactorRows 2 152).length ≤ 197 := by decide +kernel
#check gram_check_2_152

theorem gram_check_2_153 : ∀ j : Fin 154,
    listResidual 2 153 j.val = expectedResidual 2 153 j.val := by decide +kernel
theorem dd_check_2_153 : expectedRowCheck 2 153 = true := by decide +kernel
theorem list_length_2_153 : (listFactorRows 2 153).length ≤ 197 := by decide +kernel
#check gram_check_2_153

theorem gram_check_2_154 : ∀ j : Fin 155,
    listResidual 2 154 j.val = expectedResidual 2 154 j.val := by decide +kernel
theorem dd_check_2_154 : expectedRowCheck 2 154 = true := by decide +kernel
theorem list_length_2_154 : (listFactorRows 2 154).length ≤ 197 := by decide +kernel
#check gram_check_2_154

theorem gram_check_2_155 : ∀ j : Fin 156,
    listResidual 2 155 j.val = expectedResidual 2 155 j.val := by decide +kernel
theorem dd_check_2_155 : expectedRowCheck 2 155 = true := by decide +kernel
theorem list_length_2_155 : (listFactorRows 2 155).length ≤ 197 := by decide +kernel
#check gram_check_2_155

theorem gram_check_2_156 : ∀ j : Fin 157,
    listResidual 2 156 j.val = expectedResidual 2 156 j.val := by decide +kernel
theorem dd_check_2_156 : expectedRowCheck 2 156 = true := by decide +kernel
theorem list_length_2_156 : (listFactorRows 2 156).length ≤ 197 := by decide +kernel
#check gram_check_2_156

theorem gram_check_2_157 : ∀ j : Fin 158,
    listResidual 2 157 j.val = expectedResidual 2 157 j.val := by decide +kernel
theorem dd_check_2_157 : expectedRowCheck 2 157 = true := by decide +kernel
theorem list_length_2_157 : (listFactorRows 2 157).length ≤ 197 := by decide +kernel
#check gram_check_2_157

theorem gram_check_2_158 : ∀ j : Fin 159,
    listResidual 2 158 j.val = expectedResidual 2 158 j.val := by decide +kernel
theorem dd_check_2_158 : expectedRowCheck 2 158 = true := by decide +kernel
theorem list_length_2_158 : (listFactorRows 2 158).length ≤ 197 := by decide +kernel
#check gram_check_2_158

theorem gram_check_2_159 : ∀ j : Fin 160,
    listResidual 2 159 j.val = expectedResidual 2 159 j.val := by decide +kernel
theorem dd_check_2_159 : expectedRowCheck 2 159 = true := by decide +kernel
theorem list_length_2_159 : (listFactorRows 2 159).length ≤ 197 := by decide +kernel
#check gram_check_2_159

end Hedetniemi.Round4
