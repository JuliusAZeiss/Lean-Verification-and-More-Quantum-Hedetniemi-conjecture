import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_112 : ∀ j : Fin 113,
    listResidual 3 112 j.val = expectedResidual 3 112 j.val := by decide +kernel
theorem dd_check_3_112 : expectedRowCheck 3 112 = true := by decide +kernel
theorem list_length_3_112 : (listFactorRows 3 112).length ≤ 197 := by decide +kernel
#check gram_check_3_112

theorem gram_check_3_113 : ∀ j : Fin 114,
    listResidual 3 113 j.val = expectedResidual 3 113 j.val := by decide +kernel
theorem dd_check_3_113 : expectedRowCheck 3 113 = true := by decide +kernel
theorem list_length_3_113 : (listFactorRows 3 113).length ≤ 197 := by decide +kernel
#check gram_check_3_113

theorem gram_check_3_114 : ∀ j : Fin 115,
    listResidual 3 114 j.val = expectedResidual 3 114 j.val := by decide +kernel
theorem dd_check_3_114 : expectedRowCheck 3 114 = true := by decide +kernel
theorem list_length_3_114 : (listFactorRows 3 114).length ≤ 197 := by decide +kernel
#check gram_check_3_114

theorem gram_check_3_115 : ∀ j : Fin 116,
    listResidual 3 115 j.val = expectedResidual 3 115 j.val := by decide +kernel
theorem dd_check_3_115 : expectedRowCheck 3 115 = true := by decide +kernel
theorem list_length_3_115 : (listFactorRows 3 115).length ≤ 197 := by decide +kernel
#check gram_check_3_115

theorem gram_check_3_116 : ∀ j : Fin 117,
    listResidual 3 116 j.val = expectedResidual 3 116 j.val := by decide +kernel
theorem dd_check_3_116 : expectedRowCheck 3 116 = true := by decide +kernel
theorem list_length_3_116 : (listFactorRows 3 116).length ≤ 197 := by decide +kernel
#check gram_check_3_116

theorem gram_check_3_117 : ∀ j : Fin 118,
    listResidual 3 117 j.val = expectedResidual 3 117 j.val := by decide +kernel
theorem dd_check_3_117 : expectedRowCheck 3 117 = true := by decide +kernel
theorem list_length_3_117 : (listFactorRows 3 117).length ≤ 197 := by decide +kernel
#check gram_check_3_117

theorem gram_check_3_118 : ∀ j : Fin 119,
    listResidual 3 118 j.val = expectedResidual 3 118 j.val := by decide +kernel
theorem dd_check_3_118 : expectedRowCheck 3 118 = true := by decide +kernel
theorem list_length_3_118 : (listFactorRows 3 118).length ≤ 197 := by decide +kernel
#check gram_check_3_118

theorem gram_check_3_119 : ∀ j : Fin 120,
    listResidual 3 119 j.val = expectedResidual 3 119 j.val := by decide +kernel
theorem dd_check_3_119 : expectedRowCheck 3 119 = true := by decide +kernel
theorem list_length_3_119 : (listFactorRows 3 119).length ≤ 197 := by decide +kernel
#check gram_check_3_119

end Hedetniemi.Round4
