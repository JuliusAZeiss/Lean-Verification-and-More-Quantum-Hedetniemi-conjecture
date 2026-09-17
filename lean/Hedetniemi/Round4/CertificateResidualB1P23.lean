import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_184 : ∀ j : Fin 185,
    listResidual 1 184 j.val = expectedResidual 1 184 j.val := by decide +kernel
theorem dd_check_1_184 : expectedRowCheck 1 184 = true := by decide +kernel
theorem list_length_1_184 : (listFactorRows 1 184).length ≤ 197 := by decide +kernel
#check gram_check_1_184

theorem gram_check_1_185 : ∀ j : Fin 186,
    listResidual 1 185 j.val = expectedResidual 1 185 j.val := by decide +kernel
theorem dd_check_1_185 : expectedRowCheck 1 185 = true := by decide +kernel
theorem list_length_1_185 : (listFactorRows 1 185).length ≤ 197 := by decide +kernel
#check gram_check_1_185

theorem gram_check_1_186 : ∀ j : Fin 187,
    listResidual 1 186 j.val = expectedResidual 1 186 j.val := by decide +kernel
theorem dd_check_1_186 : expectedRowCheck 1 186 = true := by decide +kernel
theorem list_length_1_186 : (listFactorRows 1 186).length ≤ 197 := by decide +kernel
#check gram_check_1_186

theorem gram_check_1_187 : ∀ j : Fin 188,
    listResidual 1 187 j.val = expectedResidual 1 187 j.val := by decide +kernel
theorem dd_check_1_187 : expectedRowCheck 1 187 = true := by decide +kernel
theorem list_length_1_187 : (listFactorRows 1 187).length ≤ 197 := by decide +kernel
#check gram_check_1_187

theorem gram_check_1_188 : ∀ j : Fin 189,
    listResidual 1 188 j.val = expectedResidual 1 188 j.val := by decide +kernel
theorem dd_check_1_188 : expectedRowCheck 1 188 = true := by decide +kernel
theorem list_length_1_188 : (listFactorRows 1 188).length ≤ 197 := by decide +kernel
#check gram_check_1_188

theorem gram_check_1_189 : ∀ j : Fin 190,
    listResidual 1 189 j.val = expectedResidual 1 189 j.val := by decide +kernel
theorem dd_check_1_189 : expectedRowCheck 1 189 = true := by decide +kernel
theorem list_length_1_189 : (listFactorRows 1 189).length ≤ 197 := by decide +kernel
#check gram_check_1_189

theorem gram_check_1_190 : ∀ j : Fin 191,
    listResidual 1 190 j.val = expectedResidual 1 190 j.val := by decide +kernel
theorem dd_check_1_190 : expectedRowCheck 1 190 = true := by decide +kernel
theorem list_length_1_190 : (listFactorRows 1 190).length ≤ 197 := by decide +kernel
#check gram_check_1_190

theorem gram_check_1_191 : ∀ j : Fin 192,
    listResidual 1 191 j.val = expectedResidual 1 191 j.val := by decide +kernel
theorem dd_check_1_191 : expectedRowCheck 1 191 = true := by decide +kernel
theorem list_length_1_191 : (listFactorRows 1 191).length ≤ 197 := by decide +kernel
#check gram_check_1_191

end Hedetniemi.Round4
