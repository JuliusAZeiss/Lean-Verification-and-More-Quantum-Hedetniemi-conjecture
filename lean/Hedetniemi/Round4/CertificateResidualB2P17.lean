import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_136 : ∀ j : Fin 137,
    listResidual 2 136 j.val = expectedResidual 2 136 j.val := by decide +kernel
theorem dd_check_2_136 : expectedRowCheck 2 136 = true := by decide +kernel
theorem list_length_2_136 : (listFactorRows 2 136).length ≤ 197 := by decide +kernel
#check gram_check_2_136

theorem gram_check_2_137 : ∀ j : Fin 138,
    listResidual 2 137 j.val = expectedResidual 2 137 j.val := by decide +kernel
theorem dd_check_2_137 : expectedRowCheck 2 137 = true := by decide +kernel
theorem list_length_2_137 : (listFactorRows 2 137).length ≤ 197 := by decide +kernel
#check gram_check_2_137

theorem gram_check_2_138 : ∀ j : Fin 139,
    listResidual 2 138 j.val = expectedResidual 2 138 j.val := by decide +kernel
theorem dd_check_2_138 : expectedRowCheck 2 138 = true := by decide +kernel
theorem list_length_2_138 : (listFactorRows 2 138).length ≤ 197 := by decide +kernel
#check gram_check_2_138

theorem gram_check_2_139 : ∀ j : Fin 140,
    listResidual 2 139 j.val = expectedResidual 2 139 j.val := by decide +kernel
theorem dd_check_2_139 : expectedRowCheck 2 139 = true := by decide +kernel
theorem list_length_2_139 : (listFactorRows 2 139).length ≤ 197 := by decide +kernel
#check gram_check_2_139

theorem gram_check_2_140 : ∀ j : Fin 141,
    listResidual 2 140 j.val = expectedResidual 2 140 j.val := by decide +kernel
theorem dd_check_2_140 : expectedRowCheck 2 140 = true := by decide +kernel
theorem list_length_2_140 : (listFactorRows 2 140).length ≤ 197 := by decide +kernel
#check gram_check_2_140

theorem gram_check_2_141 : ∀ j : Fin 142,
    listResidual 2 141 j.val = expectedResidual 2 141 j.val := by decide +kernel
theorem dd_check_2_141 : expectedRowCheck 2 141 = true := by decide +kernel
theorem list_length_2_141 : (listFactorRows 2 141).length ≤ 197 := by decide +kernel
#check gram_check_2_141

theorem gram_check_2_142 : ∀ j : Fin 143,
    listResidual 2 142 j.val = expectedResidual 2 142 j.val := by decide +kernel
theorem dd_check_2_142 : expectedRowCheck 2 142 = true := by decide +kernel
theorem list_length_2_142 : (listFactorRows 2 142).length ≤ 197 := by decide +kernel
#check gram_check_2_142

theorem gram_check_2_143 : ∀ j : Fin 144,
    listResidual 2 143 j.val = expectedResidual 2 143 j.val := by decide +kernel
theorem dd_check_2_143 : expectedRowCheck 2 143 = true := by decide +kernel
theorem list_length_2_143 : (listFactorRows 2 143).length ≤ 197 := by decide +kernel
#check gram_check_2_143

end Hedetniemi.Round4
