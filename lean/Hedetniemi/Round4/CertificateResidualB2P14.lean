import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_112 : ∀ j : Fin 113,
    listResidual 2 112 j.val = expectedResidual 2 112 j.val := by decide +kernel
theorem dd_check_2_112 : expectedRowCheck 2 112 = true := by decide +kernel
theorem list_length_2_112 : (listFactorRows 2 112).length ≤ 197 := by decide +kernel
#check gram_check_2_112

theorem gram_check_2_113 : ∀ j : Fin 114,
    listResidual 2 113 j.val = expectedResidual 2 113 j.val := by decide +kernel
theorem dd_check_2_113 : expectedRowCheck 2 113 = true := by decide +kernel
theorem list_length_2_113 : (listFactorRows 2 113).length ≤ 197 := by decide +kernel
#check gram_check_2_113

theorem gram_check_2_114 : ∀ j : Fin 115,
    listResidual 2 114 j.val = expectedResidual 2 114 j.val := by decide +kernel
theorem dd_check_2_114 : expectedRowCheck 2 114 = true := by decide +kernel
theorem list_length_2_114 : (listFactorRows 2 114).length ≤ 197 := by decide +kernel
#check gram_check_2_114

theorem gram_check_2_115 : ∀ j : Fin 116,
    listResidual 2 115 j.val = expectedResidual 2 115 j.val := by decide +kernel
theorem dd_check_2_115 : expectedRowCheck 2 115 = true := by decide +kernel
theorem list_length_2_115 : (listFactorRows 2 115).length ≤ 197 := by decide +kernel
#check gram_check_2_115

theorem gram_check_2_116 : ∀ j : Fin 117,
    listResidual 2 116 j.val = expectedResidual 2 116 j.val := by decide +kernel
theorem dd_check_2_116 : expectedRowCheck 2 116 = true := by decide +kernel
theorem list_length_2_116 : (listFactorRows 2 116).length ≤ 197 := by decide +kernel
#check gram_check_2_116

theorem gram_check_2_117 : ∀ j : Fin 118,
    listResidual 2 117 j.val = expectedResidual 2 117 j.val := by decide +kernel
theorem dd_check_2_117 : expectedRowCheck 2 117 = true := by decide +kernel
theorem list_length_2_117 : (listFactorRows 2 117).length ≤ 197 := by decide +kernel
#check gram_check_2_117

theorem gram_check_2_118 : ∀ j : Fin 119,
    listResidual 2 118 j.val = expectedResidual 2 118 j.val := by decide +kernel
theorem dd_check_2_118 : expectedRowCheck 2 118 = true := by decide +kernel
theorem list_length_2_118 : (listFactorRows 2 118).length ≤ 197 := by decide +kernel
#check gram_check_2_118

theorem gram_check_2_119 : ∀ j : Fin 120,
    listResidual 2 119 j.val = expectedResidual 2 119 j.val := by decide +kernel
theorem dd_check_2_119 : expectedRowCheck 2 119 = true := by decide +kernel
theorem list_length_2_119 : (listFactorRows 2 119).length ≤ 197 := by decide +kernel
#check gram_check_2_119

end Hedetniemi.Round4
