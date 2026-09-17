import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_168 : ∀ j : Fin 169,
    listResidual 0 168 j.val = expectedResidual 0 168 j.val := by decide +kernel
theorem dd_check_0_168 : expectedRowCheck 0 168 = true := by decide +kernel
theorem list_length_0_168 : (listFactorRows 0 168).length ≤ 197 := by decide +kernel
#check gram_check_0_168

theorem gram_check_0_169 : ∀ j : Fin 170,
    listResidual 0 169 j.val = expectedResidual 0 169 j.val := by decide +kernel
theorem dd_check_0_169 : expectedRowCheck 0 169 = true := by decide +kernel
theorem list_length_0_169 : (listFactorRows 0 169).length ≤ 197 := by decide +kernel
#check gram_check_0_169

theorem gram_check_0_170 : ∀ j : Fin 171,
    listResidual 0 170 j.val = expectedResidual 0 170 j.val := by decide +kernel
theorem dd_check_0_170 : expectedRowCheck 0 170 = true := by decide +kernel
theorem list_length_0_170 : (listFactorRows 0 170).length ≤ 197 := by decide +kernel
#check gram_check_0_170

theorem gram_check_0_171 : ∀ j : Fin 172,
    listResidual 0 171 j.val = expectedResidual 0 171 j.val := by decide +kernel
theorem dd_check_0_171 : expectedRowCheck 0 171 = true := by decide +kernel
theorem list_length_0_171 : (listFactorRows 0 171).length ≤ 197 := by decide +kernel
#check gram_check_0_171

theorem gram_check_0_172 : ∀ j : Fin 173,
    listResidual 0 172 j.val = expectedResidual 0 172 j.val := by decide +kernel
theorem dd_check_0_172 : expectedRowCheck 0 172 = true := by decide +kernel
theorem list_length_0_172 : (listFactorRows 0 172).length ≤ 197 := by decide +kernel
#check gram_check_0_172

theorem gram_check_0_173 : ∀ j : Fin 174,
    listResidual 0 173 j.val = expectedResidual 0 173 j.val := by decide +kernel
theorem dd_check_0_173 : expectedRowCheck 0 173 = true := by decide +kernel
theorem list_length_0_173 : (listFactorRows 0 173).length ≤ 197 := by decide +kernel
#check gram_check_0_173

theorem gram_check_0_174 : ∀ j : Fin 175,
    listResidual 0 174 j.val = expectedResidual 0 174 j.val := by decide +kernel
theorem dd_check_0_174 : expectedRowCheck 0 174 = true := by decide +kernel
theorem list_length_0_174 : (listFactorRows 0 174).length ≤ 197 := by decide +kernel
#check gram_check_0_174

theorem gram_check_0_175 : ∀ j : Fin 176,
    listResidual 0 175 j.val = expectedResidual 0 175 j.val := by decide +kernel
theorem dd_check_0_175 : expectedRowCheck 0 175 = true := by decide +kernel
theorem list_length_0_175 : (listFactorRows 0 175).length ≤ 197 := by decide +kernel
#check gram_check_0_175

end Hedetniemi.Round4
