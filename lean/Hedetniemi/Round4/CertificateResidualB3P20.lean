import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_160 : ∀ j : Fin 161,
    listResidual 3 160 j.val = expectedResidual 3 160 j.val := by decide +kernel
theorem dd_check_3_160 : expectedRowCheck 3 160 = true := by decide +kernel
theorem list_length_3_160 : (listFactorRows 3 160).length ≤ 197 := by decide +kernel
#check gram_check_3_160

theorem gram_check_3_161 : ∀ j : Fin 162,
    listResidual 3 161 j.val = expectedResidual 3 161 j.val := by decide +kernel
theorem dd_check_3_161 : expectedRowCheck 3 161 = true := by decide +kernel
theorem list_length_3_161 : (listFactorRows 3 161).length ≤ 197 := by decide +kernel
#check gram_check_3_161

theorem gram_check_3_162 : ∀ j : Fin 163,
    listResidual 3 162 j.val = expectedResidual 3 162 j.val := by decide +kernel
theorem dd_check_3_162 : expectedRowCheck 3 162 = true := by decide +kernel
theorem list_length_3_162 : (listFactorRows 3 162).length ≤ 197 := by decide +kernel
#check gram_check_3_162

theorem gram_check_3_163 : ∀ j : Fin 164,
    listResidual 3 163 j.val = expectedResidual 3 163 j.val := by decide +kernel
theorem dd_check_3_163 : expectedRowCheck 3 163 = true := by decide +kernel
theorem list_length_3_163 : (listFactorRows 3 163).length ≤ 197 := by decide +kernel
#check gram_check_3_163

theorem gram_check_3_164 : ∀ j : Fin 165,
    listResidual 3 164 j.val = expectedResidual 3 164 j.val := by decide +kernel
theorem dd_check_3_164 : expectedRowCheck 3 164 = true := by decide +kernel
theorem list_length_3_164 : (listFactorRows 3 164).length ≤ 197 := by decide +kernel
#check gram_check_3_164

theorem gram_check_3_165 : ∀ j : Fin 166,
    listResidual 3 165 j.val = expectedResidual 3 165 j.val := by decide +kernel
theorem dd_check_3_165 : expectedRowCheck 3 165 = true := by decide +kernel
theorem list_length_3_165 : (listFactorRows 3 165).length ≤ 197 := by decide +kernel
#check gram_check_3_165

theorem gram_check_3_166 : ∀ j : Fin 167,
    listResidual 3 166 j.val = expectedResidual 3 166 j.val := by decide +kernel
theorem dd_check_3_166 : expectedRowCheck 3 166 = true := by decide +kernel
theorem list_length_3_166 : (listFactorRows 3 166).length ≤ 197 := by decide +kernel
#check gram_check_3_166

theorem gram_check_3_167 : ∀ j : Fin 168,
    listResidual 3 167 j.val = expectedResidual 3 167 j.val := by decide +kernel
theorem dd_check_3_167 : expectedRowCheck 3 167 = true := by decide +kernel
theorem list_length_3_167 : (listFactorRows 3 167).length ≤ 197 := by decide +kernel
#check gram_check_3_167

end Hedetniemi.Round4
