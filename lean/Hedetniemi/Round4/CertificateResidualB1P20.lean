import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_160 : ∀ j : Fin 161,
    listResidual 1 160 j.val = expectedResidual 1 160 j.val := by decide +kernel
theorem dd_check_1_160 : expectedRowCheck 1 160 = true := by decide +kernel
theorem list_length_1_160 : (listFactorRows 1 160).length ≤ 197 := by decide +kernel
#check gram_check_1_160

theorem gram_check_1_161 : ∀ j : Fin 162,
    listResidual 1 161 j.val = expectedResidual 1 161 j.val := by decide +kernel
theorem dd_check_1_161 : expectedRowCheck 1 161 = true := by decide +kernel
theorem list_length_1_161 : (listFactorRows 1 161).length ≤ 197 := by decide +kernel
#check gram_check_1_161

theorem gram_check_1_162 : ∀ j : Fin 163,
    listResidual 1 162 j.val = expectedResidual 1 162 j.val := by decide +kernel
theorem dd_check_1_162 : expectedRowCheck 1 162 = true := by decide +kernel
theorem list_length_1_162 : (listFactorRows 1 162).length ≤ 197 := by decide +kernel
#check gram_check_1_162

theorem gram_check_1_163 : ∀ j : Fin 164,
    listResidual 1 163 j.val = expectedResidual 1 163 j.val := by decide +kernel
theorem dd_check_1_163 : expectedRowCheck 1 163 = true := by decide +kernel
theorem list_length_1_163 : (listFactorRows 1 163).length ≤ 197 := by decide +kernel
#check gram_check_1_163

theorem gram_check_1_164 : ∀ j : Fin 165,
    listResidual 1 164 j.val = expectedResidual 1 164 j.val := by decide +kernel
theorem dd_check_1_164 : expectedRowCheck 1 164 = true := by decide +kernel
theorem list_length_1_164 : (listFactorRows 1 164).length ≤ 197 := by decide +kernel
#check gram_check_1_164

theorem gram_check_1_165 : ∀ j : Fin 166,
    listResidual 1 165 j.val = expectedResidual 1 165 j.val := by decide +kernel
theorem dd_check_1_165 : expectedRowCheck 1 165 = true := by decide +kernel
theorem list_length_1_165 : (listFactorRows 1 165).length ≤ 197 := by decide +kernel
#check gram_check_1_165

theorem gram_check_1_166 : ∀ j : Fin 167,
    listResidual 1 166 j.val = expectedResidual 1 166 j.val := by decide +kernel
theorem dd_check_1_166 : expectedRowCheck 1 166 = true := by decide +kernel
theorem list_length_1_166 : (listFactorRows 1 166).length ≤ 197 := by decide +kernel
#check gram_check_1_166

theorem gram_check_1_167 : ∀ j : Fin 168,
    listResidual 1 167 j.val = expectedResidual 1 167 j.val := by decide +kernel
theorem dd_check_1_167 : expectedRowCheck 1 167 = true := by decide +kernel
theorem list_length_1_167 : (listFactorRows 1 167).length ≤ 197 := by decide +kernel
#check gram_check_1_167

end Hedetniemi.Round4
