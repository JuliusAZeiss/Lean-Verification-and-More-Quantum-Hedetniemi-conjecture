import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_104 : ∀ j : Fin 105,
    listResidual 1 104 j.val = expectedResidual 1 104 j.val := by decide +kernel
theorem dd_check_1_104 : expectedRowCheck 1 104 = true := by decide +kernel
theorem list_length_1_104 : (listFactorRows 1 104).length ≤ 197 := by decide +kernel
#check gram_check_1_104

theorem gram_check_1_105 : ∀ j : Fin 106,
    listResidual 1 105 j.val = expectedResidual 1 105 j.val := by decide +kernel
theorem dd_check_1_105 : expectedRowCheck 1 105 = true := by decide +kernel
theorem list_length_1_105 : (listFactorRows 1 105).length ≤ 197 := by decide +kernel
#check gram_check_1_105

theorem gram_check_1_106 : ∀ j : Fin 107,
    listResidual 1 106 j.val = expectedResidual 1 106 j.val := by decide +kernel
theorem dd_check_1_106 : expectedRowCheck 1 106 = true := by decide +kernel
theorem list_length_1_106 : (listFactorRows 1 106).length ≤ 197 := by decide +kernel
#check gram_check_1_106

theorem gram_check_1_107 : ∀ j : Fin 108,
    listResidual 1 107 j.val = expectedResidual 1 107 j.val := by decide +kernel
theorem dd_check_1_107 : expectedRowCheck 1 107 = true := by decide +kernel
theorem list_length_1_107 : (listFactorRows 1 107).length ≤ 197 := by decide +kernel
#check gram_check_1_107

theorem gram_check_1_108 : ∀ j : Fin 109,
    listResidual 1 108 j.val = expectedResidual 1 108 j.val := by decide +kernel
theorem dd_check_1_108 : expectedRowCheck 1 108 = true := by decide +kernel
theorem list_length_1_108 : (listFactorRows 1 108).length ≤ 197 := by decide +kernel
#check gram_check_1_108

theorem gram_check_1_109 : ∀ j : Fin 110,
    listResidual 1 109 j.val = expectedResidual 1 109 j.val := by decide +kernel
theorem dd_check_1_109 : expectedRowCheck 1 109 = true := by decide +kernel
theorem list_length_1_109 : (listFactorRows 1 109).length ≤ 197 := by decide +kernel
#check gram_check_1_109

theorem gram_check_1_110 : ∀ j : Fin 111,
    listResidual 1 110 j.val = expectedResidual 1 110 j.val := by decide +kernel
theorem dd_check_1_110 : expectedRowCheck 1 110 = true := by decide +kernel
theorem list_length_1_110 : (listFactorRows 1 110).length ≤ 197 := by decide +kernel
#check gram_check_1_110

theorem gram_check_1_111 : ∀ j : Fin 112,
    listResidual 1 111 j.val = expectedResidual 1 111 j.val := by decide +kernel
theorem dd_check_1_111 : expectedRowCheck 1 111 = true := by decide +kernel
theorem list_length_1_111 : (listFactorRows 1 111).length ≤ 197 := by decide +kernel
#check gram_check_1_111

end Hedetniemi.Round4
