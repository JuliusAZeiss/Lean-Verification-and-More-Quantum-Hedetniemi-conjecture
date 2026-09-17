import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_112 : ∀ j : Fin 113,
    listResidual 1 112 j.val = expectedResidual 1 112 j.val := by decide +kernel
theorem dd_check_1_112 : expectedRowCheck 1 112 = true := by decide +kernel
theorem list_length_1_112 : (listFactorRows 1 112).length ≤ 197 := by decide +kernel
#check gram_check_1_112

theorem gram_check_1_113 : ∀ j : Fin 114,
    listResidual 1 113 j.val = expectedResidual 1 113 j.val := by decide +kernel
theorem dd_check_1_113 : expectedRowCheck 1 113 = true := by decide +kernel
theorem list_length_1_113 : (listFactorRows 1 113).length ≤ 197 := by decide +kernel
#check gram_check_1_113

theorem gram_check_1_114 : ∀ j : Fin 115,
    listResidual 1 114 j.val = expectedResidual 1 114 j.val := by decide +kernel
theorem dd_check_1_114 : expectedRowCheck 1 114 = true := by decide +kernel
theorem list_length_1_114 : (listFactorRows 1 114).length ≤ 197 := by decide +kernel
#check gram_check_1_114

theorem gram_check_1_115 : ∀ j : Fin 116,
    listResidual 1 115 j.val = expectedResidual 1 115 j.val := by decide +kernel
theorem dd_check_1_115 : expectedRowCheck 1 115 = true := by decide +kernel
theorem list_length_1_115 : (listFactorRows 1 115).length ≤ 197 := by decide +kernel
#check gram_check_1_115

theorem gram_check_1_116 : ∀ j : Fin 117,
    listResidual 1 116 j.val = expectedResidual 1 116 j.val := by decide +kernel
theorem dd_check_1_116 : expectedRowCheck 1 116 = true := by decide +kernel
theorem list_length_1_116 : (listFactorRows 1 116).length ≤ 197 := by decide +kernel
#check gram_check_1_116

theorem gram_check_1_117 : ∀ j : Fin 118,
    listResidual 1 117 j.val = expectedResidual 1 117 j.val := by decide +kernel
theorem dd_check_1_117 : expectedRowCheck 1 117 = true := by decide +kernel
theorem list_length_1_117 : (listFactorRows 1 117).length ≤ 197 := by decide +kernel
#check gram_check_1_117

theorem gram_check_1_118 : ∀ j : Fin 119,
    listResidual 1 118 j.val = expectedResidual 1 118 j.val := by decide +kernel
theorem dd_check_1_118 : expectedRowCheck 1 118 = true := by decide +kernel
theorem list_length_1_118 : (listFactorRows 1 118).length ≤ 197 := by decide +kernel
#check gram_check_1_118

theorem gram_check_1_119 : ∀ j : Fin 120,
    listResidual 1 119 j.val = expectedResidual 1 119 j.val := by decide +kernel
theorem dd_check_1_119 : expectedRowCheck 1 119 = true := by decide +kernel
theorem list_length_1_119 : (listFactorRows 1 119).length ≤ 197 := by decide +kernel
#check gram_check_1_119

end Hedetniemi.Round4
