import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_144 : ∀ j : Fin 145,
    listResidual 0 144 j.val = expectedResidual 0 144 j.val := by decide +kernel
theorem dd_check_0_144 : expectedRowCheck 0 144 = true := by decide +kernel
theorem list_length_0_144 : (listFactorRows 0 144).length ≤ 197 := by decide +kernel
#check gram_check_0_144

theorem gram_check_0_145 : ∀ j : Fin 146,
    listResidual 0 145 j.val = expectedResidual 0 145 j.val := by decide +kernel
theorem dd_check_0_145 : expectedRowCheck 0 145 = true := by decide +kernel
theorem list_length_0_145 : (listFactorRows 0 145).length ≤ 197 := by decide +kernel
#check gram_check_0_145

theorem gram_check_0_146 : ∀ j : Fin 147,
    listResidual 0 146 j.val = expectedResidual 0 146 j.val := by decide +kernel
theorem dd_check_0_146 : expectedRowCheck 0 146 = true := by decide +kernel
theorem list_length_0_146 : (listFactorRows 0 146).length ≤ 197 := by decide +kernel
#check gram_check_0_146

theorem gram_check_0_147 : ∀ j : Fin 148,
    listResidual 0 147 j.val = expectedResidual 0 147 j.val := by decide +kernel
theorem dd_check_0_147 : expectedRowCheck 0 147 = true := by decide +kernel
theorem list_length_0_147 : (listFactorRows 0 147).length ≤ 197 := by decide +kernel
#check gram_check_0_147

theorem gram_check_0_148 : ∀ j : Fin 149,
    listResidual 0 148 j.val = expectedResidual 0 148 j.val := by decide +kernel
theorem dd_check_0_148 : expectedRowCheck 0 148 = true := by decide +kernel
theorem list_length_0_148 : (listFactorRows 0 148).length ≤ 197 := by decide +kernel
#check gram_check_0_148

theorem gram_check_0_149 : ∀ j : Fin 150,
    listResidual 0 149 j.val = expectedResidual 0 149 j.val := by decide +kernel
theorem dd_check_0_149 : expectedRowCheck 0 149 = true := by decide +kernel
theorem list_length_0_149 : (listFactorRows 0 149).length ≤ 197 := by decide +kernel
#check gram_check_0_149

theorem gram_check_0_150 : ∀ j : Fin 151,
    listResidual 0 150 j.val = expectedResidual 0 150 j.val := by decide +kernel
theorem dd_check_0_150 : expectedRowCheck 0 150 = true := by decide +kernel
theorem list_length_0_150 : (listFactorRows 0 150).length ≤ 197 := by decide +kernel
#check gram_check_0_150

theorem gram_check_0_151 : ∀ j : Fin 152,
    listResidual 0 151 j.val = expectedResidual 0 151 j.val := by decide +kernel
theorem dd_check_0_151 : expectedRowCheck 0 151 = true := by decide +kernel
theorem list_length_0_151 : (listFactorRows 0 151).length ≤ 197 := by decide +kernel
#check gram_check_0_151

end Hedetniemi.Round4
