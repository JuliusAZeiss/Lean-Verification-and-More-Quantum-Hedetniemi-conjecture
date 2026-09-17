import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_72 : ∀ j : Fin 73,
    listResidual 0 72 j.val = expectedResidual 0 72 j.val := by decide +kernel
theorem dd_check_0_72 : expectedRowCheck 0 72 = true := by decide +kernel
theorem list_length_0_72 : (listFactorRows 0 72).length ≤ 197 := by decide +kernel
#check gram_check_0_72

theorem gram_check_0_73 : ∀ j : Fin 74,
    listResidual 0 73 j.val = expectedResidual 0 73 j.val := by decide +kernel
theorem dd_check_0_73 : expectedRowCheck 0 73 = true := by decide +kernel
theorem list_length_0_73 : (listFactorRows 0 73).length ≤ 197 := by decide +kernel
#check gram_check_0_73

theorem gram_check_0_74 : ∀ j : Fin 75,
    listResidual 0 74 j.val = expectedResidual 0 74 j.val := by decide +kernel
theorem dd_check_0_74 : expectedRowCheck 0 74 = true := by decide +kernel
theorem list_length_0_74 : (listFactorRows 0 74).length ≤ 197 := by decide +kernel
#check gram_check_0_74

theorem gram_check_0_75 : ∀ j : Fin 76,
    listResidual 0 75 j.val = expectedResidual 0 75 j.val := by decide +kernel
theorem dd_check_0_75 : expectedRowCheck 0 75 = true := by decide +kernel
theorem list_length_0_75 : (listFactorRows 0 75).length ≤ 197 := by decide +kernel
#check gram_check_0_75

theorem gram_check_0_76 : ∀ j : Fin 77,
    listResidual 0 76 j.val = expectedResidual 0 76 j.val := by decide +kernel
theorem dd_check_0_76 : expectedRowCheck 0 76 = true := by decide +kernel
theorem list_length_0_76 : (listFactorRows 0 76).length ≤ 197 := by decide +kernel
#check gram_check_0_76

theorem gram_check_0_77 : ∀ j : Fin 78,
    listResidual 0 77 j.val = expectedResidual 0 77 j.val := by decide +kernel
theorem dd_check_0_77 : expectedRowCheck 0 77 = true := by decide +kernel
theorem list_length_0_77 : (listFactorRows 0 77).length ≤ 197 := by decide +kernel
#check gram_check_0_77

theorem gram_check_0_78 : ∀ j : Fin 79,
    listResidual 0 78 j.val = expectedResidual 0 78 j.val := by decide +kernel
theorem dd_check_0_78 : expectedRowCheck 0 78 = true := by decide +kernel
theorem list_length_0_78 : (listFactorRows 0 78).length ≤ 197 := by decide +kernel
#check gram_check_0_78

theorem gram_check_0_79 : ∀ j : Fin 80,
    listResidual 0 79 j.val = expectedResidual 0 79 j.val := by decide +kernel
theorem dd_check_0_79 : expectedRowCheck 0 79 = true := by decide +kernel
theorem list_length_0_79 : (listFactorRows 0 79).length ≤ 197 := by decide +kernel
#check gram_check_0_79

end Hedetniemi.Round4
