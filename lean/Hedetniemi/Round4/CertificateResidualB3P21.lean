import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_168 : ∀ j : Fin 169,
    listResidual 3 168 j.val = expectedResidual 3 168 j.val := by decide +kernel
theorem dd_check_3_168 : expectedRowCheck 3 168 = true := by decide +kernel
theorem list_length_3_168 : (listFactorRows 3 168).length ≤ 197 := by decide +kernel
#check gram_check_3_168

theorem gram_check_3_169 : ∀ j : Fin 170,
    listResidual 3 169 j.val = expectedResidual 3 169 j.val := by decide +kernel
theorem dd_check_3_169 : expectedRowCheck 3 169 = true := by decide +kernel
theorem list_length_3_169 : (listFactorRows 3 169).length ≤ 197 := by decide +kernel
#check gram_check_3_169

theorem gram_check_3_170 : ∀ j : Fin 171,
    listResidual 3 170 j.val = expectedResidual 3 170 j.val := by decide +kernel
theorem dd_check_3_170 : expectedRowCheck 3 170 = true := by decide +kernel
theorem list_length_3_170 : (listFactorRows 3 170).length ≤ 197 := by decide +kernel
#check gram_check_3_170

theorem gram_check_3_171 : ∀ j : Fin 172,
    listResidual 3 171 j.val = expectedResidual 3 171 j.val := by decide +kernel
theorem dd_check_3_171 : expectedRowCheck 3 171 = true := by decide +kernel
theorem list_length_3_171 : (listFactorRows 3 171).length ≤ 197 := by decide +kernel
#check gram_check_3_171

theorem gram_check_3_172 : ∀ j : Fin 173,
    listResidual 3 172 j.val = expectedResidual 3 172 j.val := by decide +kernel
theorem dd_check_3_172 : expectedRowCheck 3 172 = true := by decide +kernel
theorem list_length_3_172 : (listFactorRows 3 172).length ≤ 197 := by decide +kernel
#check gram_check_3_172

theorem gram_check_3_173 : ∀ j : Fin 174,
    listResidual 3 173 j.val = expectedResidual 3 173 j.val := by decide +kernel
theorem dd_check_3_173 : expectedRowCheck 3 173 = true := by decide +kernel
theorem list_length_3_173 : (listFactorRows 3 173).length ≤ 197 := by decide +kernel
#check gram_check_3_173

theorem gram_check_3_174 : ∀ j : Fin 175,
    listResidual 3 174 j.val = expectedResidual 3 174 j.val := by decide +kernel
theorem dd_check_3_174 : expectedRowCheck 3 174 = true := by decide +kernel
theorem list_length_3_174 : (listFactorRows 3 174).length ≤ 197 := by decide +kernel
#check gram_check_3_174

theorem gram_check_3_175 : ∀ j : Fin 176,
    listResidual 3 175 j.val = expectedResidual 3 175 j.val := by decide +kernel
theorem dd_check_3_175 : expectedRowCheck 3 175 = true := by decide +kernel
theorem list_length_3_175 : (listFactorRows 3 175).length ≤ 197 := by decide +kernel
#check gram_check_3_175

end Hedetniemi.Round4
