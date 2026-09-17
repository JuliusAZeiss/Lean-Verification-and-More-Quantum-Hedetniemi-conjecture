import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_144 : ∀ j : Fin 145,
    listResidual 3 144 j.val = expectedResidual 3 144 j.val := by decide +kernel
theorem dd_check_3_144 : expectedRowCheck 3 144 = true := by decide +kernel
theorem list_length_3_144 : (listFactorRows 3 144).length ≤ 197 := by decide +kernel
#check gram_check_3_144

theorem gram_check_3_145 : ∀ j : Fin 146,
    listResidual 3 145 j.val = expectedResidual 3 145 j.val := by decide +kernel
theorem dd_check_3_145 : expectedRowCheck 3 145 = true := by decide +kernel
theorem list_length_3_145 : (listFactorRows 3 145).length ≤ 197 := by decide +kernel
#check gram_check_3_145

theorem gram_check_3_146 : ∀ j : Fin 147,
    listResidual 3 146 j.val = expectedResidual 3 146 j.val := by decide +kernel
theorem dd_check_3_146 : expectedRowCheck 3 146 = true := by decide +kernel
theorem list_length_3_146 : (listFactorRows 3 146).length ≤ 197 := by decide +kernel
#check gram_check_3_146

theorem gram_check_3_147 : ∀ j : Fin 148,
    listResidual 3 147 j.val = expectedResidual 3 147 j.val := by decide +kernel
theorem dd_check_3_147 : expectedRowCheck 3 147 = true := by decide +kernel
theorem list_length_3_147 : (listFactorRows 3 147).length ≤ 197 := by decide +kernel
#check gram_check_3_147

theorem gram_check_3_148 : ∀ j : Fin 149,
    listResidual 3 148 j.val = expectedResidual 3 148 j.val := by decide +kernel
theorem dd_check_3_148 : expectedRowCheck 3 148 = true := by decide +kernel
theorem list_length_3_148 : (listFactorRows 3 148).length ≤ 197 := by decide +kernel
#check gram_check_3_148

theorem gram_check_3_149 : ∀ j : Fin 150,
    listResidual 3 149 j.val = expectedResidual 3 149 j.val := by decide +kernel
theorem dd_check_3_149 : expectedRowCheck 3 149 = true := by decide +kernel
theorem list_length_3_149 : (listFactorRows 3 149).length ≤ 197 := by decide +kernel
#check gram_check_3_149

theorem gram_check_3_150 : ∀ j : Fin 151,
    listResidual 3 150 j.val = expectedResidual 3 150 j.val := by decide +kernel
theorem dd_check_3_150 : expectedRowCheck 3 150 = true := by decide +kernel
theorem list_length_3_150 : (listFactorRows 3 150).length ≤ 197 := by decide +kernel
#check gram_check_3_150

theorem gram_check_3_151 : ∀ j : Fin 152,
    listResidual 3 151 j.val = expectedResidual 3 151 j.val := by decide +kernel
theorem dd_check_3_151 : expectedRowCheck 3 151 = true := by decide +kernel
theorem list_length_3_151 : (listFactorRows 3 151).length ≤ 197 := by decide +kernel
#check gram_check_3_151

end Hedetniemi.Round4
