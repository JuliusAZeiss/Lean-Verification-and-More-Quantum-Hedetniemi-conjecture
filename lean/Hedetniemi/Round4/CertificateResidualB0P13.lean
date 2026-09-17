import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_104 : ∀ j : Fin 105,
    listResidual 0 104 j.val = expectedResidual 0 104 j.val := by decide +kernel
theorem dd_check_0_104 : expectedRowCheck 0 104 = true := by decide +kernel
theorem list_length_0_104 : (listFactorRows 0 104).length ≤ 197 := by decide +kernel
#check gram_check_0_104

theorem gram_check_0_105 : ∀ j : Fin 106,
    listResidual 0 105 j.val = expectedResidual 0 105 j.val := by decide +kernel
theorem dd_check_0_105 : expectedRowCheck 0 105 = true := by decide +kernel
theorem list_length_0_105 : (listFactorRows 0 105).length ≤ 197 := by decide +kernel
#check gram_check_0_105

theorem gram_check_0_106 : ∀ j : Fin 107,
    listResidual 0 106 j.val = expectedResidual 0 106 j.val := by decide +kernel
theorem dd_check_0_106 : expectedRowCheck 0 106 = true := by decide +kernel
theorem list_length_0_106 : (listFactorRows 0 106).length ≤ 197 := by decide +kernel
#check gram_check_0_106

theorem gram_check_0_107 : ∀ j : Fin 108,
    listResidual 0 107 j.val = expectedResidual 0 107 j.val := by decide +kernel
theorem dd_check_0_107 : expectedRowCheck 0 107 = true := by decide +kernel
theorem list_length_0_107 : (listFactorRows 0 107).length ≤ 197 := by decide +kernel
#check gram_check_0_107

theorem gram_check_0_108 : ∀ j : Fin 109,
    listResidual 0 108 j.val = expectedResidual 0 108 j.val := by decide +kernel
theorem dd_check_0_108 : expectedRowCheck 0 108 = true := by decide +kernel
theorem list_length_0_108 : (listFactorRows 0 108).length ≤ 197 := by decide +kernel
#check gram_check_0_108

theorem gram_check_0_109 : ∀ j : Fin 110,
    listResidual 0 109 j.val = expectedResidual 0 109 j.val := by decide +kernel
theorem dd_check_0_109 : expectedRowCheck 0 109 = true := by decide +kernel
theorem list_length_0_109 : (listFactorRows 0 109).length ≤ 197 := by decide +kernel
#check gram_check_0_109

theorem gram_check_0_110 : ∀ j : Fin 111,
    listResidual 0 110 j.val = expectedResidual 0 110 j.val := by decide +kernel
theorem dd_check_0_110 : expectedRowCheck 0 110 = true := by decide +kernel
theorem list_length_0_110 : (listFactorRows 0 110).length ≤ 197 := by decide +kernel
#check gram_check_0_110

theorem gram_check_0_111 : ∀ j : Fin 112,
    listResidual 0 111 j.val = expectedResidual 0 111 j.val := by decide +kernel
theorem dd_check_0_111 : expectedRowCheck 0 111 = true := by decide +kernel
theorem list_length_0_111 : (listFactorRows 0 111).length ≤ 197 := by decide +kernel
#check gram_check_0_111

end Hedetniemi.Round4
