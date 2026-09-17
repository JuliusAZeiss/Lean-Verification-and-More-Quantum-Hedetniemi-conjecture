import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_176 : ∀ j : Fin 177,
    listResidual 1 176 j.val = expectedResidual 1 176 j.val := by decide +kernel
theorem dd_check_1_176 : expectedRowCheck 1 176 = true := by decide +kernel
theorem list_length_1_176 : (listFactorRows 1 176).length ≤ 197 := by decide +kernel
#check gram_check_1_176

theorem gram_check_1_177 : ∀ j : Fin 178,
    listResidual 1 177 j.val = expectedResidual 1 177 j.val := by decide +kernel
theorem dd_check_1_177 : expectedRowCheck 1 177 = true := by decide +kernel
theorem list_length_1_177 : (listFactorRows 1 177).length ≤ 197 := by decide +kernel
#check gram_check_1_177

theorem gram_check_1_178 : ∀ j : Fin 179,
    listResidual 1 178 j.val = expectedResidual 1 178 j.val := by decide +kernel
theorem dd_check_1_178 : expectedRowCheck 1 178 = true := by decide +kernel
theorem list_length_1_178 : (listFactorRows 1 178).length ≤ 197 := by decide +kernel
#check gram_check_1_178

theorem gram_check_1_179 : ∀ j : Fin 180,
    listResidual 1 179 j.val = expectedResidual 1 179 j.val := by decide +kernel
theorem dd_check_1_179 : expectedRowCheck 1 179 = true := by decide +kernel
theorem list_length_1_179 : (listFactorRows 1 179).length ≤ 197 := by decide +kernel
#check gram_check_1_179

theorem gram_check_1_180 : ∀ j : Fin 181,
    listResidual 1 180 j.val = expectedResidual 1 180 j.val := by decide +kernel
theorem dd_check_1_180 : expectedRowCheck 1 180 = true := by decide +kernel
theorem list_length_1_180 : (listFactorRows 1 180).length ≤ 197 := by decide +kernel
#check gram_check_1_180

theorem gram_check_1_181 : ∀ j : Fin 182,
    listResidual 1 181 j.val = expectedResidual 1 181 j.val := by decide +kernel
theorem dd_check_1_181 : expectedRowCheck 1 181 = true := by decide +kernel
theorem list_length_1_181 : (listFactorRows 1 181).length ≤ 197 := by decide +kernel
#check gram_check_1_181

theorem gram_check_1_182 : ∀ j : Fin 183,
    listResidual 1 182 j.val = expectedResidual 1 182 j.val := by decide +kernel
theorem dd_check_1_182 : expectedRowCheck 1 182 = true := by decide +kernel
theorem list_length_1_182 : (listFactorRows 1 182).length ≤ 197 := by decide +kernel
#check gram_check_1_182

theorem gram_check_1_183 : ∀ j : Fin 184,
    listResidual 1 183 j.val = expectedResidual 1 183 j.val := by decide +kernel
theorem dd_check_1_183 : expectedRowCheck 1 183 = true := by decide +kernel
theorem list_length_1_183 : (listFactorRows 1 183).length ≤ 197 := by decide +kernel
#check gram_check_1_183

end Hedetniemi.Round4
