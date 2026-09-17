import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_184 : ∀ j : Fin 185,
    listResidual 3 184 j.val = expectedResidual 3 184 j.val := by decide +kernel
theorem dd_check_3_184 : expectedRowCheck 3 184 = true := by decide +kernel
theorem list_length_3_184 : (listFactorRows 3 184).length ≤ 197 := by decide +kernel
#check gram_check_3_184

theorem gram_check_3_185 : ∀ j : Fin 186,
    listResidual 3 185 j.val = expectedResidual 3 185 j.val := by decide +kernel
theorem dd_check_3_185 : expectedRowCheck 3 185 = true := by decide +kernel
theorem list_length_3_185 : (listFactorRows 3 185).length ≤ 197 := by decide +kernel
#check gram_check_3_185

theorem gram_check_3_186 : ∀ j : Fin 187,
    listResidual 3 186 j.val = expectedResidual 3 186 j.val := by decide +kernel
theorem dd_check_3_186 : expectedRowCheck 3 186 = true := by decide +kernel
theorem list_length_3_186 : (listFactorRows 3 186).length ≤ 197 := by decide +kernel
#check gram_check_3_186

theorem gram_check_3_187 : ∀ j : Fin 188,
    listResidual 3 187 j.val = expectedResidual 3 187 j.val := by decide +kernel
theorem dd_check_3_187 : expectedRowCheck 3 187 = true := by decide +kernel
theorem list_length_3_187 : (listFactorRows 3 187).length ≤ 197 := by decide +kernel
#check gram_check_3_187

theorem gram_check_3_188 : ∀ j : Fin 189,
    listResidual 3 188 j.val = expectedResidual 3 188 j.val := by decide +kernel
theorem dd_check_3_188 : expectedRowCheck 3 188 = true := by decide +kernel
theorem list_length_3_188 : (listFactorRows 3 188).length ≤ 197 := by decide +kernel
#check gram_check_3_188

theorem gram_check_3_189 : ∀ j : Fin 190,
    listResidual 3 189 j.val = expectedResidual 3 189 j.val := by decide +kernel
theorem dd_check_3_189 : expectedRowCheck 3 189 = true := by decide +kernel
theorem list_length_3_189 : (listFactorRows 3 189).length ≤ 197 := by decide +kernel
#check gram_check_3_189

theorem gram_check_3_190 : ∀ j : Fin 191,
    listResidual 3 190 j.val = expectedResidual 3 190 j.val := by decide +kernel
theorem dd_check_3_190 : expectedRowCheck 3 190 = true := by decide +kernel
theorem list_length_3_190 : (listFactorRows 3 190).length ≤ 197 := by decide +kernel
#check gram_check_3_190

theorem gram_check_3_191 : ∀ j : Fin 192,
    listResidual 3 191 j.val = expectedResidual 3 191 j.val := by decide +kernel
theorem dd_check_3_191 : expectedRowCheck 3 191 = true := by decide +kernel
theorem list_length_3_191 : (listFactorRows 3 191).length ≤ 197 := by decide +kernel
#check gram_check_3_191

end Hedetniemi.Round4
