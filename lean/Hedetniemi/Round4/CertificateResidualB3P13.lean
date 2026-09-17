import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_104 : ∀ j : Fin 105,
    listResidual 3 104 j.val = expectedResidual 3 104 j.val := by decide +kernel
theorem dd_check_3_104 : expectedRowCheck 3 104 = true := by decide +kernel
theorem list_length_3_104 : (listFactorRows 3 104).length ≤ 197 := by decide +kernel
#check gram_check_3_104

theorem gram_check_3_105 : ∀ j : Fin 106,
    listResidual 3 105 j.val = expectedResidual 3 105 j.val := by decide +kernel
theorem dd_check_3_105 : expectedRowCheck 3 105 = true := by decide +kernel
theorem list_length_3_105 : (listFactorRows 3 105).length ≤ 197 := by decide +kernel
#check gram_check_3_105

theorem gram_check_3_106 : ∀ j : Fin 107,
    listResidual 3 106 j.val = expectedResidual 3 106 j.val := by decide +kernel
theorem dd_check_3_106 : expectedRowCheck 3 106 = true := by decide +kernel
theorem list_length_3_106 : (listFactorRows 3 106).length ≤ 197 := by decide +kernel
#check gram_check_3_106

theorem gram_check_3_107 : ∀ j : Fin 108,
    listResidual 3 107 j.val = expectedResidual 3 107 j.val := by decide +kernel
theorem dd_check_3_107 : expectedRowCheck 3 107 = true := by decide +kernel
theorem list_length_3_107 : (listFactorRows 3 107).length ≤ 197 := by decide +kernel
#check gram_check_3_107

theorem gram_check_3_108 : ∀ j : Fin 109,
    listResidual 3 108 j.val = expectedResidual 3 108 j.val := by decide +kernel
theorem dd_check_3_108 : expectedRowCheck 3 108 = true := by decide +kernel
theorem list_length_3_108 : (listFactorRows 3 108).length ≤ 197 := by decide +kernel
#check gram_check_3_108

theorem gram_check_3_109 : ∀ j : Fin 110,
    listResidual 3 109 j.val = expectedResidual 3 109 j.val := by decide +kernel
theorem dd_check_3_109 : expectedRowCheck 3 109 = true := by decide +kernel
theorem list_length_3_109 : (listFactorRows 3 109).length ≤ 197 := by decide +kernel
#check gram_check_3_109

theorem gram_check_3_110 : ∀ j : Fin 111,
    listResidual 3 110 j.val = expectedResidual 3 110 j.val := by decide +kernel
theorem dd_check_3_110 : expectedRowCheck 3 110 = true := by decide +kernel
theorem list_length_3_110 : (listFactorRows 3 110).length ≤ 197 := by decide +kernel
#check gram_check_3_110

theorem gram_check_3_111 : ∀ j : Fin 112,
    listResidual 3 111 j.val = expectedResidual 3 111 j.val := by decide +kernel
theorem dd_check_3_111 : expectedRowCheck 3 111 = true := by decide +kernel
theorem list_length_3_111 : (listFactorRows 3 111).length ≤ 197 := by decide +kernel
#check gram_check_3_111

end Hedetniemi.Round4
