import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_192 : ∀ j : Fin 193,
    listResidual 1 192 j.val = expectedResidual 1 192 j.val := by decide +kernel
theorem dd_check_1_192 : expectedRowCheck 1 192 = true := by decide +kernel
theorem list_length_1_192 : (listFactorRows 1 192).length ≤ 197 := by decide +kernel
#check gram_check_1_192

theorem gram_check_1_193 : ∀ j : Fin 194,
    listResidual 1 193 j.val = expectedResidual 1 193 j.val := by decide +kernel
theorem dd_check_1_193 : expectedRowCheck 1 193 = true := by decide +kernel
theorem list_length_1_193 : (listFactorRows 1 193).length ≤ 197 := by decide +kernel
#check gram_check_1_193

theorem gram_check_1_194 : ∀ j : Fin 195,
    listResidual 1 194 j.val = expectedResidual 1 194 j.val := by decide +kernel
theorem dd_check_1_194 : expectedRowCheck 1 194 = true := by decide +kernel
theorem list_length_1_194 : (listFactorRows 1 194).length ≤ 197 := by decide +kernel
#check gram_check_1_194

theorem gram_check_1_195 : ∀ j : Fin 196,
    listResidual 1 195 j.val = expectedResidual 1 195 j.val := by decide +kernel
theorem dd_check_1_195 : expectedRowCheck 1 195 = true := by decide +kernel
theorem list_length_1_195 : (listFactorRows 1 195).length ≤ 197 := by decide +kernel
#check gram_check_1_195

theorem gram_check_1_196 : ∀ j : Fin 197,
    listResidual 1 196 j.val = expectedResidual 1 196 j.val := by decide +kernel
theorem dd_check_1_196 : expectedRowCheck 1 196 = true := by decide +kernel
theorem list_length_1_196 : (listFactorRows 1 196).length ≤ 197 := by decide +kernel
#check gram_check_1_196

end Hedetniemi.Round4
