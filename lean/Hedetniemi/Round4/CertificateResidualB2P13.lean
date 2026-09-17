import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_104 : ∀ j : Fin 105,
    listResidual 2 104 j.val = expectedResidual 2 104 j.val := by decide +kernel
theorem dd_check_2_104 : expectedRowCheck 2 104 = true := by decide +kernel
theorem list_length_2_104 : (listFactorRows 2 104).length ≤ 197 := by decide +kernel
#check gram_check_2_104

theorem gram_check_2_105 : ∀ j : Fin 106,
    listResidual 2 105 j.val = expectedResidual 2 105 j.val := by decide +kernel
theorem dd_check_2_105 : expectedRowCheck 2 105 = true := by decide +kernel
theorem list_length_2_105 : (listFactorRows 2 105).length ≤ 197 := by decide +kernel
#check gram_check_2_105

theorem gram_check_2_106 : ∀ j : Fin 107,
    listResidual 2 106 j.val = expectedResidual 2 106 j.val := by decide +kernel
theorem dd_check_2_106 : expectedRowCheck 2 106 = true := by decide +kernel
theorem list_length_2_106 : (listFactorRows 2 106).length ≤ 197 := by decide +kernel
#check gram_check_2_106

theorem gram_check_2_107 : ∀ j : Fin 108,
    listResidual 2 107 j.val = expectedResidual 2 107 j.val := by decide +kernel
theorem dd_check_2_107 : expectedRowCheck 2 107 = true := by decide +kernel
theorem list_length_2_107 : (listFactorRows 2 107).length ≤ 197 := by decide +kernel
#check gram_check_2_107

theorem gram_check_2_108 : ∀ j : Fin 109,
    listResidual 2 108 j.val = expectedResidual 2 108 j.val := by decide +kernel
theorem dd_check_2_108 : expectedRowCheck 2 108 = true := by decide +kernel
theorem list_length_2_108 : (listFactorRows 2 108).length ≤ 197 := by decide +kernel
#check gram_check_2_108

theorem gram_check_2_109 : ∀ j : Fin 110,
    listResidual 2 109 j.val = expectedResidual 2 109 j.val := by decide +kernel
theorem dd_check_2_109 : expectedRowCheck 2 109 = true := by decide +kernel
theorem list_length_2_109 : (listFactorRows 2 109).length ≤ 197 := by decide +kernel
#check gram_check_2_109

theorem gram_check_2_110 : ∀ j : Fin 111,
    listResidual 2 110 j.val = expectedResidual 2 110 j.val := by decide +kernel
theorem dd_check_2_110 : expectedRowCheck 2 110 = true := by decide +kernel
theorem list_length_2_110 : (listFactorRows 2 110).length ≤ 197 := by decide +kernel
#check gram_check_2_110

theorem gram_check_2_111 : ∀ j : Fin 112,
    listResidual 2 111 j.val = expectedResidual 2 111 j.val := by decide +kernel
theorem dd_check_2_111 : expectedRowCheck 2 111 = true := by decide +kernel
theorem list_length_2_111 : (listFactorRows 2 111).length ≤ 197 := by decide +kernel
#check gram_check_2_111

end Hedetniemi.Round4
