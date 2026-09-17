import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_160 : ∀ j : Fin 161,
    listResidual 0 160 j.val = expectedResidual 0 160 j.val := by decide +kernel
theorem dd_check_0_160 : expectedRowCheck 0 160 = true := by decide +kernel
theorem list_length_0_160 : (listFactorRows 0 160).length ≤ 197 := by decide +kernel
#check gram_check_0_160

theorem gram_check_0_161 : ∀ j : Fin 162,
    listResidual 0 161 j.val = expectedResidual 0 161 j.val := by decide +kernel
theorem dd_check_0_161 : expectedRowCheck 0 161 = true := by decide +kernel
theorem list_length_0_161 : (listFactorRows 0 161).length ≤ 197 := by decide +kernel
#check gram_check_0_161

theorem gram_check_0_162 : ∀ j : Fin 163,
    listResidual 0 162 j.val = expectedResidual 0 162 j.val := by decide +kernel
theorem dd_check_0_162 : expectedRowCheck 0 162 = true := by decide +kernel
theorem list_length_0_162 : (listFactorRows 0 162).length ≤ 197 := by decide +kernel
#check gram_check_0_162

theorem gram_check_0_163 : ∀ j : Fin 164,
    listResidual 0 163 j.val = expectedResidual 0 163 j.val := by decide +kernel
theorem dd_check_0_163 : expectedRowCheck 0 163 = true := by decide +kernel
theorem list_length_0_163 : (listFactorRows 0 163).length ≤ 197 := by decide +kernel
#check gram_check_0_163

theorem gram_check_0_164 : ∀ j : Fin 165,
    listResidual 0 164 j.val = expectedResidual 0 164 j.val := by decide +kernel
theorem dd_check_0_164 : expectedRowCheck 0 164 = true := by decide +kernel
theorem list_length_0_164 : (listFactorRows 0 164).length ≤ 197 := by decide +kernel
#check gram_check_0_164

theorem gram_check_0_165 : ∀ j : Fin 166,
    listResidual 0 165 j.val = expectedResidual 0 165 j.val := by decide +kernel
theorem dd_check_0_165 : expectedRowCheck 0 165 = true := by decide +kernel
theorem list_length_0_165 : (listFactorRows 0 165).length ≤ 197 := by decide +kernel
#check gram_check_0_165

theorem gram_check_0_166 : ∀ j : Fin 167,
    listResidual 0 166 j.val = expectedResidual 0 166 j.val := by decide +kernel
theorem dd_check_0_166 : expectedRowCheck 0 166 = true := by decide +kernel
theorem list_length_0_166 : (listFactorRows 0 166).length ≤ 197 := by decide +kernel
#check gram_check_0_166

theorem gram_check_0_167 : ∀ j : Fin 168,
    listResidual 0 167 j.val = expectedResidual 0 167 j.val := by decide +kernel
theorem dd_check_0_167 : expectedRowCheck 0 167 = true := by decide +kernel
theorem list_length_0_167 : (listFactorRows 0 167).length ≤ 197 := by decide +kernel
#check gram_check_0_167

end Hedetniemi.Round4
