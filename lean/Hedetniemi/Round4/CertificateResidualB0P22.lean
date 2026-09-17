import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_176 : ∀ j : Fin 177,
    listResidual 0 176 j.val = expectedResidual 0 176 j.val := by decide +kernel
theorem dd_check_0_176 : expectedRowCheck 0 176 = true := by decide +kernel
theorem list_length_0_176 : (listFactorRows 0 176).length ≤ 197 := by decide +kernel
#check gram_check_0_176

theorem gram_check_0_177 : ∀ j : Fin 178,
    listResidual 0 177 j.val = expectedResidual 0 177 j.val := by decide +kernel
theorem dd_check_0_177 : expectedRowCheck 0 177 = true := by decide +kernel
theorem list_length_0_177 : (listFactorRows 0 177).length ≤ 197 := by decide +kernel
#check gram_check_0_177

theorem gram_check_0_178 : ∀ j : Fin 179,
    listResidual 0 178 j.val = expectedResidual 0 178 j.val := by decide +kernel
theorem dd_check_0_178 : expectedRowCheck 0 178 = true := by decide +kernel
theorem list_length_0_178 : (listFactorRows 0 178).length ≤ 197 := by decide +kernel
#check gram_check_0_178

theorem gram_check_0_179 : ∀ j : Fin 180,
    listResidual 0 179 j.val = expectedResidual 0 179 j.val := by decide +kernel
theorem dd_check_0_179 : expectedRowCheck 0 179 = true := by decide +kernel
theorem list_length_0_179 : (listFactorRows 0 179).length ≤ 197 := by decide +kernel
#check gram_check_0_179

theorem gram_check_0_180 : ∀ j : Fin 181,
    listResidual 0 180 j.val = expectedResidual 0 180 j.val := by decide +kernel
theorem dd_check_0_180 : expectedRowCheck 0 180 = true := by decide +kernel
theorem list_length_0_180 : (listFactorRows 0 180).length ≤ 197 := by decide +kernel
#check gram_check_0_180

theorem gram_check_0_181 : ∀ j : Fin 182,
    listResidual 0 181 j.val = expectedResidual 0 181 j.val := by decide +kernel
theorem dd_check_0_181 : expectedRowCheck 0 181 = true := by decide +kernel
theorem list_length_0_181 : (listFactorRows 0 181).length ≤ 197 := by decide +kernel
#check gram_check_0_181

theorem gram_check_0_182 : ∀ j : Fin 183,
    listResidual 0 182 j.val = expectedResidual 0 182 j.val := by decide +kernel
theorem dd_check_0_182 : expectedRowCheck 0 182 = true := by decide +kernel
theorem list_length_0_182 : (listFactorRows 0 182).length ≤ 197 := by decide +kernel
#check gram_check_0_182

theorem gram_check_0_183 : ∀ j : Fin 184,
    listResidual 0 183 j.val = expectedResidual 0 183 j.val := by decide +kernel
theorem dd_check_0_183 : expectedRowCheck 0 183 = true := by decide +kernel
theorem list_length_0_183 : (listFactorRows 0 183).length ≤ 197 := by decide +kernel
#check gram_check_0_183

end Hedetniemi.Round4
