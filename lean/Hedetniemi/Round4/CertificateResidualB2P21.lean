import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_168 : ∀ j : Fin 169,
    listResidual 2 168 j.val = expectedResidual 2 168 j.val := by decide +kernel
theorem dd_check_2_168 : expectedRowCheck 2 168 = true := by decide +kernel
theorem list_length_2_168 : (listFactorRows 2 168).length ≤ 197 := by decide +kernel
#check gram_check_2_168

theorem gram_check_2_169 : ∀ j : Fin 170,
    listResidual 2 169 j.val = expectedResidual 2 169 j.val := by decide +kernel
theorem dd_check_2_169 : expectedRowCheck 2 169 = true := by decide +kernel
theorem list_length_2_169 : (listFactorRows 2 169).length ≤ 197 := by decide +kernel
#check gram_check_2_169

theorem gram_check_2_170 : ∀ j : Fin 171,
    listResidual 2 170 j.val = expectedResidual 2 170 j.val := by decide +kernel
theorem dd_check_2_170 : expectedRowCheck 2 170 = true := by decide +kernel
theorem list_length_2_170 : (listFactorRows 2 170).length ≤ 197 := by decide +kernel
#check gram_check_2_170

theorem gram_check_2_171 : ∀ j : Fin 172,
    listResidual 2 171 j.val = expectedResidual 2 171 j.val := by decide +kernel
theorem dd_check_2_171 : expectedRowCheck 2 171 = true := by decide +kernel
theorem list_length_2_171 : (listFactorRows 2 171).length ≤ 197 := by decide +kernel
#check gram_check_2_171

theorem gram_check_2_172 : ∀ j : Fin 173,
    listResidual 2 172 j.val = expectedResidual 2 172 j.val := by decide +kernel
theorem dd_check_2_172 : expectedRowCheck 2 172 = true := by decide +kernel
theorem list_length_2_172 : (listFactorRows 2 172).length ≤ 197 := by decide +kernel
#check gram_check_2_172

theorem gram_check_2_173 : ∀ j : Fin 174,
    listResidual 2 173 j.val = expectedResidual 2 173 j.val := by decide +kernel
theorem dd_check_2_173 : expectedRowCheck 2 173 = true := by decide +kernel
theorem list_length_2_173 : (listFactorRows 2 173).length ≤ 197 := by decide +kernel
#check gram_check_2_173

theorem gram_check_2_174 : ∀ j : Fin 175,
    listResidual 2 174 j.val = expectedResidual 2 174 j.val := by decide +kernel
theorem dd_check_2_174 : expectedRowCheck 2 174 = true := by decide +kernel
theorem list_length_2_174 : (listFactorRows 2 174).length ≤ 197 := by decide +kernel
#check gram_check_2_174

theorem gram_check_2_175 : ∀ j : Fin 176,
    listResidual 2 175 j.val = expectedResidual 2 175 j.val := by decide +kernel
theorem dd_check_2_175 : expectedRowCheck 2 175 = true := by decide +kernel
theorem list_length_2_175 : (listFactorRows 2 175).length ≤ 197 := by decide +kernel
#check gram_check_2_175

end Hedetniemi.Round4
