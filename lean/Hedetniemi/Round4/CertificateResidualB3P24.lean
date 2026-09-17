import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_192 : ∀ j : Fin 193,
    listResidual 3 192 j.val = expectedResidual 3 192 j.val := by decide +kernel
theorem dd_check_3_192 : expectedRowCheck 3 192 = true := by decide +kernel
theorem list_length_3_192 : (listFactorRows 3 192).length ≤ 197 := by decide +kernel
#check gram_check_3_192

theorem gram_check_3_193 : ∀ j : Fin 194,
    listResidual 3 193 j.val = expectedResidual 3 193 j.val := by decide +kernel
theorem dd_check_3_193 : expectedRowCheck 3 193 = true := by decide +kernel
theorem list_length_3_193 : (listFactorRows 3 193).length ≤ 197 := by decide +kernel
#check gram_check_3_193

theorem gram_check_3_194 : ∀ j : Fin 195,
    listResidual 3 194 j.val = expectedResidual 3 194 j.val := by decide +kernel
theorem dd_check_3_194 : expectedRowCheck 3 194 = true := by decide +kernel
theorem list_length_3_194 : (listFactorRows 3 194).length ≤ 197 := by decide +kernel
#check gram_check_3_194

theorem gram_check_3_195 : ∀ j : Fin 196,
    listResidual 3 195 j.val = expectedResidual 3 195 j.val := by decide +kernel
theorem dd_check_3_195 : expectedRowCheck 3 195 = true := by decide +kernel
theorem list_length_3_195 : (listFactorRows 3 195).length ≤ 197 := by decide +kernel
#check gram_check_3_195

theorem gram_check_3_196 : ∀ j : Fin 197,
    listResidual 3 196 j.val = expectedResidual 3 196 j.val := by decide +kernel
theorem dd_check_3_196 : expectedRowCheck 3 196 = true := by decide +kernel
theorem list_length_3_196 : (listFactorRows 3 196).length ≤ 197 := by decide +kernel
#check gram_check_3_196

end Hedetniemi.Round4
