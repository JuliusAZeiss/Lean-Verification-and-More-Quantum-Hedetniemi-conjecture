import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_184 : ∀ j : Fin 185,
    listResidual 2 184 j.val = expectedResidual 2 184 j.val := by decide +kernel
theorem dd_check_2_184 : expectedRowCheck 2 184 = true := by decide +kernel
theorem list_length_2_184 : (listFactorRows 2 184).length ≤ 197 := by decide +kernel
#check gram_check_2_184

theorem gram_check_2_185 : ∀ j : Fin 186,
    listResidual 2 185 j.val = expectedResidual 2 185 j.val := by decide +kernel
theorem dd_check_2_185 : expectedRowCheck 2 185 = true := by decide +kernel
theorem list_length_2_185 : (listFactorRows 2 185).length ≤ 197 := by decide +kernel
#check gram_check_2_185

theorem gram_check_2_186 : ∀ j : Fin 187,
    listResidual 2 186 j.val = expectedResidual 2 186 j.val := by decide +kernel
theorem dd_check_2_186 : expectedRowCheck 2 186 = true := by decide +kernel
theorem list_length_2_186 : (listFactorRows 2 186).length ≤ 197 := by decide +kernel
#check gram_check_2_186

theorem gram_check_2_187 : ∀ j : Fin 188,
    listResidual 2 187 j.val = expectedResidual 2 187 j.val := by decide +kernel
theorem dd_check_2_187 : expectedRowCheck 2 187 = true := by decide +kernel
theorem list_length_2_187 : (listFactorRows 2 187).length ≤ 197 := by decide +kernel
#check gram_check_2_187

theorem gram_check_2_188 : ∀ j : Fin 189,
    listResidual 2 188 j.val = expectedResidual 2 188 j.val := by decide +kernel
theorem dd_check_2_188 : expectedRowCheck 2 188 = true := by decide +kernel
theorem list_length_2_188 : (listFactorRows 2 188).length ≤ 197 := by decide +kernel
#check gram_check_2_188

theorem gram_check_2_189 : ∀ j : Fin 190,
    listResidual 2 189 j.val = expectedResidual 2 189 j.val := by decide +kernel
theorem dd_check_2_189 : expectedRowCheck 2 189 = true := by decide +kernel
theorem list_length_2_189 : (listFactorRows 2 189).length ≤ 197 := by decide +kernel
#check gram_check_2_189

theorem gram_check_2_190 : ∀ j : Fin 191,
    listResidual 2 190 j.val = expectedResidual 2 190 j.val := by decide +kernel
theorem dd_check_2_190 : expectedRowCheck 2 190 = true := by decide +kernel
theorem list_length_2_190 : (listFactorRows 2 190).length ≤ 197 := by decide +kernel
#check gram_check_2_190

theorem gram_check_2_191 : ∀ j : Fin 192,
    listResidual 2 191 j.val = expectedResidual 2 191 j.val := by decide +kernel
theorem dd_check_2_191 : expectedRowCheck 2 191 = true := by decide +kernel
theorem list_length_2_191 : (listFactorRows 2 191).length ≤ 197 := by decide +kernel
#check gram_check_2_191

end Hedetniemi.Round4
