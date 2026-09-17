import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_144 : ∀ j : Fin 145,
    listResidual 2 144 j.val = expectedResidual 2 144 j.val := by decide +kernel
theorem dd_check_2_144 : expectedRowCheck 2 144 = true := by decide +kernel
theorem list_length_2_144 : (listFactorRows 2 144).length ≤ 197 := by decide +kernel
#check gram_check_2_144

theorem gram_check_2_145 : ∀ j : Fin 146,
    listResidual 2 145 j.val = expectedResidual 2 145 j.val := by decide +kernel
theorem dd_check_2_145 : expectedRowCheck 2 145 = true := by decide +kernel
theorem list_length_2_145 : (listFactorRows 2 145).length ≤ 197 := by decide +kernel
#check gram_check_2_145

theorem gram_check_2_146 : ∀ j : Fin 147,
    listResidual 2 146 j.val = expectedResidual 2 146 j.val := by decide +kernel
theorem dd_check_2_146 : expectedRowCheck 2 146 = true := by decide +kernel
theorem list_length_2_146 : (listFactorRows 2 146).length ≤ 197 := by decide +kernel
#check gram_check_2_146

theorem gram_check_2_147 : ∀ j : Fin 148,
    listResidual 2 147 j.val = expectedResidual 2 147 j.val := by decide +kernel
theorem dd_check_2_147 : expectedRowCheck 2 147 = true := by decide +kernel
theorem list_length_2_147 : (listFactorRows 2 147).length ≤ 197 := by decide +kernel
#check gram_check_2_147

theorem gram_check_2_148 : ∀ j : Fin 149,
    listResidual 2 148 j.val = expectedResidual 2 148 j.val := by decide +kernel
theorem dd_check_2_148 : expectedRowCheck 2 148 = true := by decide +kernel
theorem list_length_2_148 : (listFactorRows 2 148).length ≤ 197 := by decide +kernel
#check gram_check_2_148

theorem gram_check_2_149 : ∀ j : Fin 150,
    listResidual 2 149 j.val = expectedResidual 2 149 j.val := by decide +kernel
theorem dd_check_2_149 : expectedRowCheck 2 149 = true := by decide +kernel
theorem list_length_2_149 : (listFactorRows 2 149).length ≤ 197 := by decide +kernel
#check gram_check_2_149

theorem gram_check_2_150 : ∀ j : Fin 151,
    listResidual 2 150 j.val = expectedResidual 2 150 j.val := by decide +kernel
theorem dd_check_2_150 : expectedRowCheck 2 150 = true := by decide +kernel
theorem list_length_2_150 : (listFactorRows 2 150).length ≤ 197 := by decide +kernel
#check gram_check_2_150

theorem gram_check_2_151 : ∀ j : Fin 152,
    listResidual 2 151 j.val = expectedResidual 2 151 j.val := by decide +kernel
theorem dd_check_2_151 : expectedRowCheck 2 151 = true := by decide +kernel
theorem list_length_2_151 : (listFactorRows 2 151).length ≤ 197 := by decide +kernel
#check gram_check_2_151

end Hedetniemi.Round4
