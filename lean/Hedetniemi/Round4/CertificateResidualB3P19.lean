import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_152 : ∀ j : Fin 153,
    listResidual 3 152 j.val = expectedResidual 3 152 j.val := by decide +kernel
theorem dd_check_3_152 : expectedRowCheck 3 152 = true := by decide +kernel
theorem list_length_3_152 : (listFactorRows 3 152).length ≤ 197 := by decide +kernel
#check gram_check_3_152

theorem gram_check_3_153 : ∀ j : Fin 154,
    listResidual 3 153 j.val = expectedResidual 3 153 j.val := by decide +kernel
theorem dd_check_3_153 : expectedRowCheck 3 153 = true := by decide +kernel
theorem list_length_3_153 : (listFactorRows 3 153).length ≤ 197 := by decide +kernel
#check gram_check_3_153

theorem gram_check_3_154 : ∀ j : Fin 155,
    listResidual 3 154 j.val = expectedResidual 3 154 j.val := by decide +kernel
theorem dd_check_3_154 : expectedRowCheck 3 154 = true := by decide +kernel
theorem list_length_3_154 : (listFactorRows 3 154).length ≤ 197 := by decide +kernel
#check gram_check_3_154

theorem gram_check_3_155 : ∀ j : Fin 156,
    listResidual 3 155 j.val = expectedResidual 3 155 j.val := by decide +kernel
theorem dd_check_3_155 : expectedRowCheck 3 155 = true := by decide +kernel
theorem list_length_3_155 : (listFactorRows 3 155).length ≤ 197 := by decide +kernel
#check gram_check_3_155

theorem gram_check_3_156 : ∀ j : Fin 157,
    listResidual 3 156 j.val = expectedResidual 3 156 j.val := by decide +kernel
theorem dd_check_3_156 : expectedRowCheck 3 156 = true := by decide +kernel
theorem list_length_3_156 : (listFactorRows 3 156).length ≤ 197 := by decide +kernel
#check gram_check_3_156

theorem gram_check_3_157 : ∀ j : Fin 158,
    listResidual 3 157 j.val = expectedResidual 3 157 j.val := by decide +kernel
theorem dd_check_3_157 : expectedRowCheck 3 157 = true := by decide +kernel
theorem list_length_3_157 : (listFactorRows 3 157).length ≤ 197 := by decide +kernel
#check gram_check_3_157

theorem gram_check_3_158 : ∀ j : Fin 159,
    listResidual 3 158 j.val = expectedResidual 3 158 j.val := by decide +kernel
theorem dd_check_3_158 : expectedRowCheck 3 158 = true := by decide +kernel
theorem list_length_3_158 : (listFactorRows 3 158).length ≤ 197 := by decide +kernel
#check gram_check_3_158

theorem gram_check_3_159 : ∀ j : Fin 160,
    listResidual 3 159 j.val = expectedResidual 3 159 j.val := by decide +kernel
theorem dd_check_3_159 : expectedRowCheck 3 159 = true := by decide +kernel
theorem list_length_3_159 : (listFactorRows 3 159).length ≤ 197 := by decide +kernel
#check gram_check_3_159

end Hedetniemi.Round4
