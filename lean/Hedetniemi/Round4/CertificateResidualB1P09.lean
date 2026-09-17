import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_72 : ∀ j : Fin 73,
    listResidual 1 72 j.val = expectedResidual 1 72 j.val := by decide +kernel
theorem dd_check_1_72 : expectedRowCheck 1 72 = true := by decide +kernel
theorem list_length_1_72 : (listFactorRows 1 72).length ≤ 197 := by decide +kernel
#check gram_check_1_72

theorem gram_check_1_73 : ∀ j : Fin 74,
    listResidual 1 73 j.val = expectedResidual 1 73 j.val := by decide +kernel
theorem dd_check_1_73 : expectedRowCheck 1 73 = true := by decide +kernel
theorem list_length_1_73 : (listFactorRows 1 73).length ≤ 197 := by decide +kernel
#check gram_check_1_73

theorem gram_check_1_74 : ∀ j : Fin 75,
    listResidual 1 74 j.val = expectedResidual 1 74 j.val := by decide +kernel
theorem dd_check_1_74 : expectedRowCheck 1 74 = true := by decide +kernel
theorem list_length_1_74 : (listFactorRows 1 74).length ≤ 197 := by decide +kernel
#check gram_check_1_74

theorem gram_check_1_75 : ∀ j : Fin 76,
    listResidual 1 75 j.val = expectedResidual 1 75 j.val := by decide +kernel
theorem dd_check_1_75 : expectedRowCheck 1 75 = true := by decide +kernel
theorem list_length_1_75 : (listFactorRows 1 75).length ≤ 197 := by decide +kernel
#check gram_check_1_75

theorem gram_check_1_76 : ∀ j : Fin 77,
    listResidual 1 76 j.val = expectedResidual 1 76 j.val := by decide +kernel
theorem dd_check_1_76 : expectedRowCheck 1 76 = true := by decide +kernel
theorem list_length_1_76 : (listFactorRows 1 76).length ≤ 197 := by decide +kernel
#check gram_check_1_76

theorem gram_check_1_77 : ∀ j : Fin 78,
    listResidual 1 77 j.val = expectedResidual 1 77 j.val := by decide +kernel
theorem dd_check_1_77 : expectedRowCheck 1 77 = true := by decide +kernel
theorem list_length_1_77 : (listFactorRows 1 77).length ≤ 197 := by decide +kernel
#check gram_check_1_77

theorem gram_check_1_78 : ∀ j : Fin 79,
    listResidual 1 78 j.val = expectedResidual 1 78 j.val := by decide +kernel
theorem dd_check_1_78 : expectedRowCheck 1 78 = true := by decide +kernel
theorem list_length_1_78 : (listFactorRows 1 78).length ≤ 197 := by decide +kernel
#check gram_check_1_78

theorem gram_check_1_79 : ∀ j : Fin 80,
    listResidual 1 79 j.val = expectedResidual 1 79 j.val := by decide +kernel
theorem dd_check_1_79 : expectedRowCheck 1 79 = true := by decide +kernel
theorem list_length_1_79 : (listFactorRows 1 79).length ≤ 197 := by decide +kernel
#check gram_check_1_79

end Hedetniemi.Round4
