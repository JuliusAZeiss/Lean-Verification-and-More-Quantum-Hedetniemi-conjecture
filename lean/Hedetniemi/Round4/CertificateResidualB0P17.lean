import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_136 : ∀ j : Fin 137,
    listResidual 0 136 j.val = expectedResidual 0 136 j.val := by decide +kernel
theorem dd_check_0_136 : expectedRowCheck 0 136 = true := by decide +kernel
theorem list_length_0_136 : (listFactorRows 0 136).length ≤ 197 := by decide +kernel
#check gram_check_0_136

theorem gram_check_0_137 : ∀ j : Fin 138,
    listResidual 0 137 j.val = expectedResidual 0 137 j.val := by decide +kernel
theorem dd_check_0_137 : expectedRowCheck 0 137 = true := by decide +kernel
theorem list_length_0_137 : (listFactorRows 0 137).length ≤ 197 := by decide +kernel
#check gram_check_0_137

theorem gram_check_0_138 : ∀ j : Fin 139,
    listResidual 0 138 j.val = expectedResidual 0 138 j.val := by decide +kernel
theorem dd_check_0_138 : expectedRowCheck 0 138 = true := by decide +kernel
theorem list_length_0_138 : (listFactorRows 0 138).length ≤ 197 := by decide +kernel
#check gram_check_0_138

theorem gram_check_0_139 : ∀ j : Fin 140,
    listResidual 0 139 j.val = expectedResidual 0 139 j.val := by decide +kernel
theorem dd_check_0_139 : expectedRowCheck 0 139 = true := by decide +kernel
theorem list_length_0_139 : (listFactorRows 0 139).length ≤ 197 := by decide +kernel
#check gram_check_0_139

theorem gram_check_0_140 : ∀ j : Fin 141,
    listResidual 0 140 j.val = expectedResidual 0 140 j.val := by decide +kernel
theorem dd_check_0_140 : expectedRowCheck 0 140 = true := by decide +kernel
theorem list_length_0_140 : (listFactorRows 0 140).length ≤ 197 := by decide +kernel
#check gram_check_0_140

theorem gram_check_0_141 : ∀ j : Fin 142,
    listResidual 0 141 j.val = expectedResidual 0 141 j.val := by decide +kernel
theorem dd_check_0_141 : expectedRowCheck 0 141 = true := by decide +kernel
theorem list_length_0_141 : (listFactorRows 0 141).length ≤ 197 := by decide +kernel
#check gram_check_0_141

theorem gram_check_0_142 : ∀ j : Fin 143,
    listResidual 0 142 j.val = expectedResidual 0 142 j.val := by decide +kernel
theorem dd_check_0_142 : expectedRowCheck 0 142 = true := by decide +kernel
theorem list_length_0_142 : (listFactorRows 0 142).length ≤ 197 := by decide +kernel
#check gram_check_0_142

theorem gram_check_0_143 : ∀ j : Fin 144,
    listResidual 0 143 j.val = expectedResidual 0 143 j.val := by decide +kernel
theorem dd_check_0_143 : expectedRowCheck 0 143 = true := by decide +kernel
theorem list_length_0_143 : (listFactorRows 0 143).length ≤ 197 := by decide +kernel
#check gram_check_0_143

end Hedetniemi.Round4
