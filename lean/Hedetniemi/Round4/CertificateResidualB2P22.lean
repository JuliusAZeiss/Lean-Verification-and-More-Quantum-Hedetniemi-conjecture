import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_176 : ∀ j : Fin 177,
    listResidual 2 176 j.val = expectedResidual 2 176 j.val := by decide +kernel
theorem dd_check_2_176 : expectedRowCheck 2 176 = true := by decide +kernel
theorem list_length_2_176 : (listFactorRows 2 176).length ≤ 197 := by decide +kernel
#check gram_check_2_176

theorem gram_check_2_177 : ∀ j : Fin 178,
    listResidual 2 177 j.val = expectedResidual 2 177 j.val := by decide +kernel
theorem dd_check_2_177 : expectedRowCheck 2 177 = true := by decide +kernel
theorem list_length_2_177 : (listFactorRows 2 177).length ≤ 197 := by decide +kernel
#check gram_check_2_177

theorem gram_check_2_178 : ∀ j : Fin 179,
    listResidual 2 178 j.val = expectedResidual 2 178 j.val := by decide +kernel
theorem dd_check_2_178 : expectedRowCheck 2 178 = true := by decide +kernel
theorem list_length_2_178 : (listFactorRows 2 178).length ≤ 197 := by decide +kernel
#check gram_check_2_178

theorem gram_check_2_179 : ∀ j : Fin 180,
    listResidual 2 179 j.val = expectedResidual 2 179 j.val := by decide +kernel
theorem dd_check_2_179 : expectedRowCheck 2 179 = true := by decide +kernel
theorem list_length_2_179 : (listFactorRows 2 179).length ≤ 197 := by decide +kernel
#check gram_check_2_179

theorem gram_check_2_180 : ∀ j : Fin 181,
    listResidual 2 180 j.val = expectedResidual 2 180 j.val := by decide +kernel
theorem dd_check_2_180 : expectedRowCheck 2 180 = true := by decide +kernel
theorem list_length_2_180 : (listFactorRows 2 180).length ≤ 197 := by decide +kernel
#check gram_check_2_180

theorem gram_check_2_181 : ∀ j : Fin 182,
    listResidual 2 181 j.val = expectedResidual 2 181 j.val := by decide +kernel
theorem dd_check_2_181 : expectedRowCheck 2 181 = true := by decide +kernel
theorem list_length_2_181 : (listFactorRows 2 181).length ≤ 197 := by decide +kernel
#check gram_check_2_181

theorem gram_check_2_182 : ∀ j : Fin 183,
    listResidual 2 182 j.val = expectedResidual 2 182 j.val := by decide +kernel
theorem dd_check_2_182 : expectedRowCheck 2 182 = true := by decide +kernel
theorem list_length_2_182 : (listFactorRows 2 182).length ≤ 197 := by decide +kernel
#check gram_check_2_182

theorem gram_check_2_183 : ∀ j : Fin 184,
    listResidual 2 183 j.val = expectedResidual 2 183 j.val := by decide +kernel
theorem dd_check_2_183 : expectedRowCheck 2 183 = true := by decide +kernel
theorem list_length_2_183 : (listFactorRows 2 183).length ≤ 197 := by decide +kernel
#check gram_check_2_183

end Hedetniemi.Round4
