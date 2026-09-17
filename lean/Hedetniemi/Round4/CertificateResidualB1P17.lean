import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_136 : ∀ j : Fin 137,
    listResidual 1 136 j.val = expectedResidual 1 136 j.val := by decide +kernel
theorem dd_check_1_136 : expectedRowCheck 1 136 = true := by decide +kernel
theorem list_length_1_136 : (listFactorRows 1 136).length ≤ 197 := by decide +kernel
#check gram_check_1_136

theorem gram_check_1_137 : ∀ j : Fin 138,
    listResidual 1 137 j.val = expectedResidual 1 137 j.val := by decide +kernel
theorem dd_check_1_137 : expectedRowCheck 1 137 = true := by decide +kernel
theorem list_length_1_137 : (listFactorRows 1 137).length ≤ 197 := by decide +kernel
#check gram_check_1_137

theorem gram_check_1_138 : ∀ j : Fin 139,
    listResidual 1 138 j.val = expectedResidual 1 138 j.val := by decide +kernel
theorem dd_check_1_138 : expectedRowCheck 1 138 = true := by decide +kernel
theorem list_length_1_138 : (listFactorRows 1 138).length ≤ 197 := by decide +kernel
#check gram_check_1_138

theorem gram_check_1_139 : ∀ j : Fin 140,
    listResidual 1 139 j.val = expectedResidual 1 139 j.val := by decide +kernel
theorem dd_check_1_139 : expectedRowCheck 1 139 = true := by decide +kernel
theorem list_length_1_139 : (listFactorRows 1 139).length ≤ 197 := by decide +kernel
#check gram_check_1_139

theorem gram_check_1_140 : ∀ j : Fin 141,
    listResidual 1 140 j.val = expectedResidual 1 140 j.val := by decide +kernel
theorem dd_check_1_140 : expectedRowCheck 1 140 = true := by decide +kernel
theorem list_length_1_140 : (listFactorRows 1 140).length ≤ 197 := by decide +kernel
#check gram_check_1_140

theorem gram_check_1_141 : ∀ j : Fin 142,
    listResidual 1 141 j.val = expectedResidual 1 141 j.val := by decide +kernel
theorem dd_check_1_141 : expectedRowCheck 1 141 = true := by decide +kernel
theorem list_length_1_141 : (listFactorRows 1 141).length ≤ 197 := by decide +kernel
#check gram_check_1_141

theorem gram_check_1_142 : ∀ j : Fin 143,
    listResidual 1 142 j.val = expectedResidual 1 142 j.val := by decide +kernel
theorem dd_check_1_142 : expectedRowCheck 1 142 = true := by decide +kernel
theorem list_length_1_142 : (listFactorRows 1 142).length ≤ 197 := by decide +kernel
#check gram_check_1_142

theorem gram_check_1_143 : ∀ j : Fin 144,
    listResidual 1 143 j.val = expectedResidual 1 143 j.val := by decide +kernel
theorem dd_check_1_143 : expectedRowCheck 1 143 = true := by decide +kernel
theorem list_length_1_143 : (listFactorRows 1 143).length ≤ 197 := by decide +kernel
#check gram_check_1_143

end Hedetniemi.Round4
