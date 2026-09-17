import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_184 : ∀ j : Fin 185,
    listResidual 0 184 j.val = expectedResidual 0 184 j.val := by decide +kernel
theorem dd_check_0_184 : expectedRowCheck 0 184 = true := by decide +kernel
theorem list_length_0_184 : (listFactorRows 0 184).length ≤ 197 := by decide +kernel
#check gram_check_0_184

theorem gram_check_0_185 : ∀ j : Fin 186,
    listResidual 0 185 j.val = expectedResidual 0 185 j.val := by decide +kernel
theorem dd_check_0_185 : expectedRowCheck 0 185 = true := by decide +kernel
theorem list_length_0_185 : (listFactorRows 0 185).length ≤ 197 := by decide +kernel
#check gram_check_0_185

theorem gram_check_0_186 : ∀ j : Fin 187,
    listResidual 0 186 j.val = expectedResidual 0 186 j.val := by decide +kernel
theorem dd_check_0_186 : expectedRowCheck 0 186 = true := by decide +kernel
theorem list_length_0_186 : (listFactorRows 0 186).length ≤ 197 := by decide +kernel
#check gram_check_0_186

theorem gram_check_0_187 : ∀ j : Fin 188,
    listResidual 0 187 j.val = expectedResidual 0 187 j.val := by decide +kernel
theorem dd_check_0_187 : expectedRowCheck 0 187 = true := by decide +kernel
theorem list_length_0_187 : (listFactorRows 0 187).length ≤ 197 := by decide +kernel
#check gram_check_0_187

theorem gram_check_0_188 : ∀ j : Fin 189,
    listResidual 0 188 j.val = expectedResidual 0 188 j.val := by decide +kernel
theorem dd_check_0_188 : expectedRowCheck 0 188 = true := by decide +kernel
theorem list_length_0_188 : (listFactorRows 0 188).length ≤ 197 := by decide +kernel
#check gram_check_0_188

theorem gram_check_0_189 : ∀ j : Fin 190,
    listResidual 0 189 j.val = expectedResidual 0 189 j.val := by decide +kernel
theorem dd_check_0_189 : expectedRowCheck 0 189 = true := by decide +kernel
theorem list_length_0_189 : (listFactorRows 0 189).length ≤ 197 := by decide +kernel
#check gram_check_0_189

theorem gram_check_0_190 : ∀ j : Fin 191,
    listResidual 0 190 j.val = expectedResidual 0 190 j.val := by decide +kernel
theorem dd_check_0_190 : expectedRowCheck 0 190 = true := by decide +kernel
theorem list_length_0_190 : (listFactorRows 0 190).length ≤ 197 := by decide +kernel
#check gram_check_0_190

theorem gram_check_0_191 : ∀ j : Fin 192,
    listResidual 0 191 j.val = expectedResidual 0 191 j.val := by decide +kernel
theorem dd_check_0_191 : expectedRowCheck 0 191 = true := by decide +kernel
theorem list_length_0_191 : (listFactorRows 0 191).length ≤ 197 := by decide +kernel
#check gram_check_0_191

end Hedetniemi.Round4
