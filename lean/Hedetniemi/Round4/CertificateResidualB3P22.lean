import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_176 : ∀ j : Fin 177,
    listResidual 3 176 j.val = expectedResidual 3 176 j.val := by decide +kernel
theorem dd_check_3_176 : expectedRowCheck 3 176 = true := by decide +kernel
theorem list_length_3_176 : (listFactorRows 3 176).length ≤ 197 := by decide +kernel
#check gram_check_3_176

theorem gram_check_3_177 : ∀ j : Fin 178,
    listResidual 3 177 j.val = expectedResidual 3 177 j.val := by decide +kernel
theorem dd_check_3_177 : expectedRowCheck 3 177 = true := by decide +kernel
theorem list_length_3_177 : (listFactorRows 3 177).length ≤ 197 := by decide +kernel
#check gram_check_3_177

theorem gram_check_3_178 : ∀ j : Fin 179,
    listResidual 3 178 j.val = expectedResidual 3 178 j.val := by decide +kernel
theorem dd_check_3_178 : expectedRowCheck 3 178 = true := by decide +kernel
theorem list_length_3_178 : (listFactorRows 3 178).length ≤ 197 := by decide +kernel
#check gram_check_3_178

theorem gram_check_3_179 : ∀ j : Fin 180,
    listResidual 3 179 j.val = expectedResidual 3 179 j.val := by decide +kernel
theorem dd_check_3_179 : expectedRowCheck 3 179 = true := by decide +kernel
theorem list_length_3_179 : (listFactorRows 3 179).length ≤ 197 := by decide +kernel
#check gram_check_3_179

theorem gram_check_3_180 : ∀ j : Fin 181,
    listResidual 3 180 j.val = expectedResidual 3 180 j.val := by decide +kernel
theorem dd_check_3_180 : expectedRowCheck 3 180 = true := by decide +kernel
theorem list_length_3_180 : (listFactorRows 3 180).length ≤ 197 := by decide +kernel
#check gram_check_3_180

theorem gram_check_3_181 : ∀ j : Fin 182,
    listResidual 3 181 j.val = expectedResidual 3 181 j.val := by decide +kernel
theorem dd_check_3_181 : expectedRowCheck 3 181 = true := by decide +kernel
theorem list_length_3_181 : (listFactorRows 3 181).length ≤ 197 := by decide +kernel
#check gram_check_3_181

theorem gram_check_3_182 : ∀ j : Fin 183,
    listResidual 3 182 j.val = expectedResidual 3 182 j.val := by decide +kernel
theorem dd_check_3_182 : expectedRowCheck 3 182 = true := by decide +kernel
theorem list_length_3_182 : (listFactorRows 3 182).length ≤ 197 := by decide +kernel
#check gram_check_3_182

theorem gram_check_3_183 : ∀ j : Fin 184,
    listResidual 3 183 j.val = expectedResidual 3 183 j.val := by decide +kernel
theorem dd_check_3_183 : expectedRowCheck 3 183 = true := by decide +kernel
theorem list_length_3_183 : (listFactorRows 3 183).length ≤ 197 := by decide +kernel
#check gram_check_3_183

end Hedetniemi.Round4
