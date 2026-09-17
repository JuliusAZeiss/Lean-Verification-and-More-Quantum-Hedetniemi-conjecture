import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_160 : ∀ j : Fin 161,
    listResidual 2 160 j.val = expectedResidual 2 160 j.val := by decide +kernel
theorem dd_check_2_160 : expectedRowCheck 2 160 = true := by decide +kernel
theorem list_length_2_160 : (listFactorRows 2 160).length ≤ 197 := by decide +kernel
#check gram_check_2_160

theorem gram_check_2_161 : ∀ j : Fin 162,
    listResidual 2 161 j.val = expectedResidual 2 161 j.val := by decide +kernel
theorem dd_check_2_161 : expectedRowCheck 2 161 = true := by decide +kernel
theorem list_length_2_161 : (listFactorRows 2 161).length ≤ 197 := by decide +kernel
#check gram_check_2_161

theorem gram_check_2_162 : ∀ j : Fin 163,
    listResidual 2 162 j.val = expectedResidual 2 162 j.val := by decide +kernel
theorem dd_check_2_162 : expectedRowCheck 2 162 = true := by decide +kernel
theorem list_length_2_162 : (listFactorRows 2 162).length ≤ 197 := by decide +kernel
#check gram_check_2_162

theorem gram_check_2_163 : ∀ j : Fin 164,
    listResidual 2 163 j.val = expectedResidual 2 163 j.val := by decide +kernel
theorem dd_check_2_163 : expectedRowCheck 2 163 = true := by decide +kernel
theorem list_length_2_163 : (listFactorRows 2 163).length ≤ 197 := by decide +kernel
#check gram_check_2_163

theorem gram_check_2_164 : ∀ j : Fin 165,
    listResidual 2 164 j.val = expectedResidual 2 164 j.val := by decide +kernel
theorem dd_check_2_164 : expectedRowCheck 2 164 = true := by decide +kernel
theorem list_length_2_164 : (listFactorRows 2 164).length ≤ 197 := by decide +kernel
#check gram_check_2_164

theorem gram_check_2_165 : ∀ j : Fin 166,
    listResidual 2 165 j.val = expectedResidual 2 165 j.val := by decide +kernel
theorem dd_check_2_165 : expectedRowCheck 2 165 = true := by decide +kernel
theorem list_length_2_165 : (listFactorRows 2 165).length ≤ 197 := by decide +kernel
#check gram_check_2_165

theorem gram_check_2_166 : ∀ j : Fin 167,
    listResidual 2 166 j.val = expectedResidual 2 166 j.val := by decide +kernel
theorem dd_check_2_166 : expectedRowCheck 2 166 = true := by decide +kernel
theorem list_length_2_166 : (listFactorRows 2 166).length ≤ 197 := by decide +kernel
#check gram_check_2_166

theorem gram_check_2_167 : ∀ j : Fin 168,
    listResidual 2 167 j.val = expectedResidual 2 167 j.val := by decide +kernel
theorem dd_check_2_167 : expectedRowCheck 2 167 = true := by decide +kernel
theorem list_length_2_167 : (listFactorRows 2 167).length ≤ 197 := by decide +kernel
#check gram_check_2_167

end Hedetniemi.Round4
