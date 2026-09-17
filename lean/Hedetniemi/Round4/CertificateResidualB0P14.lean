import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_112 : ∀ j : Fin 113,
    listResidual 0 112 j.val = expectedResidual 0 112 j.val := by decide +kernel
theorem dd_check_0_112 : expectedRowCheck 0 112 = true := by decide +kernel
theorem list_length_0_112 : (listFactorRows 0 112).length ≤ 197 := by decide +kernel
#check gram_check_0_112

theorem gram_check_0_113 : ∀ j : Fin 114,
    listResidual 0 113 j.val = expectedResidual 0 113 j.val := by decide +kernel
theorem dd_check_0_113 : expectedRowCheck 0 113 = true := by decide +kernel
theorem list_length_0_113 : (listFactorRows 0 113).length ≤ 197 := by decide +kernel
#check gram_check_0_113

theorem gram_check_0_114 : ∀ j : Fin 115,
    listResidual 0 114 j.val = expectedResidual 0 114 j.val := by decide +kernel
theorem dd_check_0_114 : expectedRowCheck 0 114 = true := by decide +kernel
theorem list_length_0_114 : (listFactorRows 0 114).length ≤ 197 := by decide +kernel
#check gram_check_0_114

theorem gram_check_0_115 : ∀ j : Fin 116,
    listResidual 0 115 j.val = expectedResidual 0 115 j.val := by decide +kernel
theorem dd_check_0_115 : expectedRowCheck 0 115 = true := by decide +kernel
theorem list_length_0_115 : (listFactorRows 0 115).length ≤ 197 := by decide +kernel
#check gram_check_0_115

theorem gram_check_0_116 : ∀ j : Fin 117,
    listResidual 0 116 j.val = expectedResidual 0 116 j.val := by decide +kernel
theorem dd_check_0_116 : expectedRowCheck 0 116 = true := by decide +kernel
theorem list_length_0_116 : (listFactorRows 0 116).length ≤ 197 := by decide +kernel
#check gram_check_0_116

theorem gram_check_0_117 : ∀ j : Fin 118,
    listResidual 0 117 j.val = expectedResidual 0 117 j.val := by decide +kernel
theorem dd_check_0_117 : expectedRowCheck 0 117 = true := by decide +kernel
theorem list_length_0_117 : (listFactorRows 0 117).length ≤ 197 := by decide +kernel
#check gram_check_0_117

theorem gram_check_0_118 : ∀ j : Fin 119,
    listResidual 0 118 j.val = expectedResidual 0 118 j.val := by decide +kernel
theorem dd_check_0_118 : expectedRowCheck 0 118 = true := by decide +kernel
theorem list_length_0_118 : (listFactorRows 0 118).length ≤ 197 := by decide +kernel
#check gram_check_0_118

theorem gram_check_0_119 : ∀ j : Fin 120,
    listResidual 0 119 j.val = expectedResidual 0 119 j.val := by decide +kernel
theorem dd_check_0_119 : expectedRowCheck 0 119 = true := by decide +kernel
theorem list_length_0_119 : (listFactorRows 0 119).length ≤ 197 := by decide +kernel
#check gram_check_0_119

end Hedetniemi.Round4
