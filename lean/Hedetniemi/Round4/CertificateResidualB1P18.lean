import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_144 : ∀ j : Fin 145,
    listResidual 1 144 j.val = expectedResidual 1 144 j.val := by decide +kernel
theorem dd_check_1_144 : expectedRowCheck 1 144 = true := by decide +kernel
theorem list_length_1_144 : (listFactorRows 1 144).length ≤ 197 := by decide +kernel
#check gram_check_1_144

theorem gram_check_1_145 : ∀ j : Fin 146,
    listResidual 1 145 j.val = expectedResidual 1 145 j.val := by decide +kernel
theorem dd_check_1_145 : expectedRowCheck 1 145 = true := by decide +kernel
theorem list_length_1_145 : (listFactorRows 1 145).length ≤ 197 := by decide +kernel
#check gram_check_1_145

theorem gram_check_1_146 : ∀ j : Fin 147,
    listResidual 1 146 j.val = expectedResidual 1 146 j.val := by decide +kernel
theorem dd_check_1_146 : expectedRowCheck 1 146 = true := by decide +kernel
theorem list_length_1_146 : (listFactorRows 1 146).length ≤ 197 := by decide +kernel
#check gram_check_1_146

theorem gram_check_1_147 : ∀ j : Fin 148,
    listResidual 1 147 j.val = expectedResidual 1 147 j.val := by decide +kernel
theorem dd_check_1_147 : expectedRowCheck 1 147 = true := by decide +kernel
theorem list_length_1_147 : (listFactorRows 1 147).length ≤ 197 := by decide +kernel
#check gram_check_1_147

theorem gram_check_1_148 : ∀ j : Fin 149,
    listResidual 1 148 j.val = expectedResidual 1 148 j.val := by decide +kernel
theorem dd_check_1_148 : expectedRowCheck 1 148 = true := by decide +kernel
theorem list_length_1_148 : (listFactorRows 1 148).length ≤ 197 := by decide +kernel
#check gram_check_1_148

theorem gram_check_1_149 : ∀ j : Fin 150,
    listResidual 1 149 j.val = expectedResidual 1 149 j.val := by decide +kernel
theorem dd_check_1_149 : expectedRowCheck 1 149 = true := by decide +kernel
theorem list_length_1_149 : (listFactorRows 1 149).length ≤ 197 := by decide +kernel
#check gram_check_1_149

theorem gram_check_1_150 : ∀ j : Fin 151,
    listResidual 1 150 j.val = expectedResidual 1 150 j.val := by decide +kernel
theorem dd_check_1_150 : expectedRowCheck 1 150 = true := by decide +kernel
theorem list_length_1_150 : (listFactorRows 1 150).length ≤ 197 := by decide +kernel
#check gram_check_1_150

theorem gram_check_1_151 : ∀ j : Fin 152,
    listResidual 1 151 j.val = expectedResidual 1 151 j.val := by decide +kernel
theorem dd_check_1_151 : expectedRowCheck 1 151 = true := by decide +kernel
theorem list_length_1_151 : (listFactorRows 1 151).length ≤ 197 := by decide +kernel
#check gram_check_1_151

end Hedetniemi.Round4
