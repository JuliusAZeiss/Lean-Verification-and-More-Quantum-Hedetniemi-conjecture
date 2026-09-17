import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_192 : ∀ j : Fin 193,
    listResidual 2 192 j.val = expectedResidual 2 192 j.val := by decide +kernel
theorem dd_check_2_192 : expectedRowCheck 2 192 = true := by decide +kernel
theorem list_length_2_192 : (listFactorRows 2 192).length ≤ 197 := by decide +kernel
#check gram_check_2_192

theorem gram_check_2_193 : ∀ j : Fin 194,
    listResidual 2 193 j.val = expectedResidual 2 193 j.val := by decide +kernel
theorem dd_check_2_193 : expectedRowCheck 2 193 = true := by decide +kernel
theorem list_length_2_193 : (listFactorRows 2 193).length ≤ 197 := by decide +kernel
#check gram_check_2_193

theorem gram_check_2_194 : ∀ j : Fin 195,
    listResidual 2 194 j.val = expectedResidual 2 194 j.val := by decide +kernel
theorem dd_check_2_194 : expectedRowCheck 2 194 = true := by decide +kernel
theorem list_length_2_194 : (listFactorRows 2 194).length ≤ 197 := by decide +kernel
#check gram_check_2_194

theorem gram_check_2_195 : ∀ j : Fin 196,
    listResidual 2 195 j.val = expectedResidual 2 195 j.val := by decide +kernel
theorem dd_check_2_195 : expectedRowCheck 2 195 = true := by decide +kernel
theorem list_length_2_195 : (listFactorRows 2 195).length ≤ 197 := by decide +kernel
#check gram_check_2_195

theorem gram_check_2_196 : ∀ j : Fin 197,
    listResidual 2 196 j.val = expectedResidual 2 196 j.val := by decide +kernel
theorem dd_check_2_196 : expectedRowCheck 2 196 = true := by decide +kernel
theorem list_length_2_196 : (listFactorRows 2 196).length ≤ 197 := by decide +kernel
#check gram_check_2_196

end Hedetniemi.Round4
