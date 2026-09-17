import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_136 : ∀ j : Fin 137,
    listResidual 3 136 j.val = expectedResidual 3 136 j.val := by decide +kernel
theorem dd_check_3_136 : expectedRowCheck 3 136 = true := by decide +kernel
theorem list_length_3_136 : (listFactorRows 3 136).length ≤ 197 := by decide +kernel
#check gram_check_3_136

theorem gram_check_3_137 : ∀ j : Fin 138,
    listResidual 3 137 j.val = expectedResidual 3 137 j.val := by decide +kernel
theorem dd_check_3_137 : expectedRowCheck 3 137 = true := by decide +kernel
theorem list_length_3_137 : (listFactorRows 3 137).length ≤ 197 := by decide +kernel
#check gram_check_3_137

theorem gram_check_3_138 : ∀ j : Fin 139,
    listResidual 3 138 j.val = expectedResidual 3 138 j.val := by decide +kernel
theorem dd_check_3_138 : expectedRowCheck 3 138 = true := by decide +kernel
theorem list_length_3_138 : (listFactorRows 3 138).length ≤ 197 := by decide +kernel
#check gram_check_3_138

theorem gram_check_3_139 : ∀ j : Fin 140,
    listResidual 3 139 j.val = expectedResidual 3 139 j.val := by decide +kernel
theorem dd_check_3_139 : expectedRowCheck 3 139 = true := by decide +kernel
theorem list_length_3_139 : (listFactorRows 3 139).length ≤ 197 := by decide +kernel
#check gram_check_3_139

theorem gram_check_3_140 : ∀ j : Fin 141,
    listResidual 3 140 j.val = expectedResidual 3 140 j.val := by decide +kernel
theorem dd_check_3_140 : expectedRowCheck 3 140 = true := by decide +kernel
theorem list_length_3_140 : (listFactorRows 3 140).length ≤ 197 := by decide +kernel
#check gram_check_3_140

theorem gram_check_3_141 : ∀ j : Fin 142,
    listResidual 3 141 j.val = expectedResidual 3 141 j.val := by decide +kernel
theorem dd_check_3_141 : expectedRowCheck 3 141 = true := by decide +kernel
theorem list_length_3_141 : (listFactorRows 3 141).length ≤ 197 := by decide +kernel
#check gram_check_3_141

theorem gram_check_3_142 : ∀ j : Fin 143,
    listResidual 3 142 j.val = expectedResidual 3 142 j.val := by decide +kernel
theorem dd_check_3_142 : expectedRowCheck 3 142 = true := by decide +kernel
theorem list_length_3_142 : (listFactorRows 3 142).length ≤ 197 := by decide +kernel
#check gram_check_3_142

theorem gram_check_3_143 : ∀ j : Fin 144,
    listResidual 3 143 j.val = expectedResidual 3 143 j.val := by decide +kernel
theorem dd_check_3_143 : expectedRowCheck 3 143 = true := by decide +kernel
theorem list_length_3_143 : (listFactorRows 3 143).length ≤ 197 := by decide +kernel
#check gram_check_3_143

end Hedetniemi.Round4
