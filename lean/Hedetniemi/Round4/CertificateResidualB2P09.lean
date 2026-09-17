import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_72 : ∀ j : Fin 73,
    listResidual 2 72 j.val = expectedResidual 2 72 j.val := by decide +kernel
theorem dd_check_2_72 : expectedRowCheck 2 72 = true := by decide +kernel
theorem list_length_2_72 : (listFactorRows 2 72).length ≤ 197 := by decide +kernel
#check gram_check_2_72

theorem gram_check_2_73 : ∀ j : Fin 74,
    listResidual 2 73 j.val = expectedResidual 2 73 j.val := by decide +kernel
theorem dd_check_2_73 : expectedRowCheck 2 73 = true := by decide +kernel
theorem list_length_2_73 : (listFactorRows 2 73).length ≤ 197 := by decide +kernel
#check gram_check_2_73

theorem gram_check_2_74 : ∀ j : Fin 75,
    listResidual 2 74 j.val = expectedResidual 2 74 j.val := by decide +kernel
theorem dd_check_2_74 : expectedRowCheck 2 74 = true := by decide +kernel
theorem list_length_2_74 : (listFactorRows 2 74).length ≤ 197 := by decide +kernel
#check gram_check_2_74

theorem gram_check_2_75 : ∀ j : Fin 76,
    listResidual 2 75 j.val = expectedResidual 2 75 j.val := by decide +kernel
theorem dd_check_2_75 : expectedRowCheck 2 75 = true := by decide +kernel
theorem list_length_2_75 : (listFactorRows 2 75).length ≤ 197 := by decide +kernel
#check gram_check_2_75

theorem gram_check_2_76 : ∀ j : Fin 77,
    listResidual 2 76 j.val = expectedResidual 2 76 j.val := by decide +kernel
theorem dd_check_2_76 : expectedRowCheck 2 76 = true := by decide +kernel
theorem list_length_2_76 : (listFactorRows 2 76).length ≤ 197 := by decide +kernel
#check gram_check_2_76

theorem gram_check_2_77 : ∀ j : Fin 78,
    listResidual 2 77 j.val = expectedResidual 2 77 j.val := by decide +kernel
theorem dd_check_2_77 : expectedRowCheck 2 77 = true := by decide +kernel
theorem list_length_2_77 : (listFactorRows 2 77).length ≤ 197 := by decide +kernel
#check gram_check_2_77

theorem gram_check_2_78 : ∀ j : Fin 79,
    listResidual 2 78 j.val = expectedResidual 2 78 j.val := by decide +kernel
theorem dd_check_2_78 : expectedRowCheck 2 78 = true := by decide +kernel
theorem list_length_2_78 : (listFactorRows 2 78).length ≤ 197 := by decide +kernel
#check gram_check_2_78

theorem gram_check_2_79 : ∀ j : Fin 80,
    listResidual 2 79 j.val = expectedResidual 2 79 j.val := by decide +kernel
theorem dd_check_2_79 : expectedRowCheck 2 79 = true := by decide +kernel
theorem list_length_2_79 : (listFactorRows 2 79).length ≤ 197 := by decide +kernel
#check gram_check_2_79

end Hedetniemi.Round4
