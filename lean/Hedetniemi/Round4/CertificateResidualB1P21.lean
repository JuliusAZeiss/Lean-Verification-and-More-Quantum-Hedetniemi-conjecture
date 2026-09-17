import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_168 : ∀ j : Fin 169,
    listResidual 1 168 j.val = expectedResidual 1 168 j.val := by decide +kernel
theorem dd_check_1_168 : expectedRowCheck 1 168 = true := by decide +kernel
theorem list_length_1_168 : (listFactorRows 1 168).length ≤ 197 := by decide +kernel
#check gram_check_1_168

theorem gram_check_1_169 : ∀ j : Fin 170,
    listResidual 1 169 j.val = expectedResidual 1 169 j.val := by decide +kernel
theorem dd_check_1_169 : expectedRowCheck 1 169 = true := by decide +kernel
theorem list_length_1_169 : (listFactorRows 1 169).length ≤ 197 := by decide +kernel
#check gram_check_1_169

theorem gram_check_1_170 : ∀ j : Fin 171,
    listResidual 1 170 j.val = expectedResidual 1 170 j.val := by decide +kernel
theorem dd_check_1_170 : expectedRowCheck 1 170 = true := by decide +kernel
theorem list_length_1_170 : (listFactorRows 1 170).length ≤ 197 := by decide +kernel
#check gram_check_1_170

theorem gram_check_1_171 : ∀ j : Fin 172,
    listResidual 1 171 j.val = expectedResidual 1 171 j.val := by decide +kernel
theorem dd_check_1_171 : expectedRowCheck 1 171 = true := by decide +kernel
theorem list_length_1_171 : (listFactorRows 1 171).length ≤ 197 := by decide +kernel
#check gram_check_1_171

theorem gram_check_1_172 : ∀ j : Fin 173,
    listResidual 1 172 j.val = expectedResidual 1 172 j.val := by decide +kernel
theorem dd_check_1_172 : expectedRowCheck 1 172 = true := by decide +kernel
theorem list_length_1_172 : (listFactorRows 1 172).length ≤ 197 := by decide +kernel
#check gram_check_1_172

theorem gram_check_1_173 : ∀ j : Fin 174,
    listResidual 1 173 j.val = expectedResidual 1 173 j.val := by decide +kernel
theorem dd_check_1_173 : expectedRowCheck 1 173 = true := by decide +kernel
theorem list_length_1_173 : (listFactorRows 1 173).length ≤ 197 := by decide +kernel
#check gram_check_1_173

theorem gram_check_1_174 : ∀ j : Fin 175,
    listResidual 1 174 j.val = expectedResidual 1 174 j.val := by decide +kernel
theorem dd_check_1_174 : expectedRowCheck 1 174 = true := by decide +kernel
theorem list_length_1_174 : (listFactorRows 1 174).length ≤ 197 := by decide +kernel
#check gram_check_1_174

theorem gram_check_1_175 : ∀ j : Fin 176,
    listResidual 1 175 j.val = expectedResidual 1 175 j.val := by decide +kernel
theorem dd_check_1_175 : expectedRowCheck 1 175 = true := by decide +kernel
theorem list_length_1_175 : (listFactorRows 1 175).length ≤ 197 := by decide +kernel
#check gram_check_1_175

end Hedetniemi.Round4
