import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_192 : ∀ j : Fin 193,
    listResidual 0 192 j.val = expectedResidual 0 192 j.val := by decide +kernel
theorem dd_check_0_192 : expectedRowCheck 0 192 = true := by decide +kernel
theorem list_length_0_192 : (listFactorRows 0 192).length ≤ 197 := by decide +kernel
#check gram_check_0_192

theorem gram_check_0_193 : ∀ j : Fin 194,
    listResidual 0 193 j.val = expectedResidual 0 193 j.val := by decide +kernel
theorem dd_check_0_193 : expectedRowCheck 0 193 = true := by decide +kernel
theorem list_length_0_193 : (listFactorRows 0 193).length ≤ 197 := by decide +kernel
#check gram_check_0_193

theorem gram_check_0_194 : ∀ j : Fin 195,
    listResidual 0 194 j.val = expectedResidual 0 194 j.val := by decide +kernel
theorem dd_check_0_194 : expectedRowCheck 0 194 = true := by decide +kernel
theorem list_length_0_194 : (listFactorRows 0 194).length ≤ 197 := by decide +kernel
#check gram_check_0_194

theorem gram_check_0_195 : ∀ j : Fin 196,
    listResidual 0 195 j.val = expectedResidual 0 195 j.val := by decide +kernel
theorem dd_check_0_195 : expectedRowCheck 0 195 = true := by decide +kernel
theorem list_length_0_195 : (listFactorRows 0 195).length ≤ 197 := by decide +kernel
#check gram_check_0_195

theorem gram_check_0_196 : ∀ j : Fin 197,
    listResidual 0 196 j.val = expectedResidual 0 196 j.val := by decide +kernel
theorem dd_check_0_196 : expectedRowCheck 0 196 = true := by decide +kernel
theorem list_length_0_196 : (listFactorRows 0 196).length ≤ 197 := by decide +kernel
#check gram_check_0_196

end Hedetniemi.Round4
