import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_72 : ∀ j : Fin 73,
    listResidual 3 72 j.val = expectedResidual 3 72 j.val := by decide +kernel
theorem dd_check_3_72 : expectedRowCheck 3 72 = true := by decide +kernel
theorem list_length_3_72 : (listFactorRows 3 72).length ≤ 197 := by decide +kernel
#check gram_check_3_72

theorem gram_check_3_73 : ∀ j : Fin 74,
    listResidual 3 73 j.val = expectedResidual 3 73 j.val := by decide +kernel
theorem dd_check_3_73 : expectedRowCheck 3 73 = true := by decide +kernel
theorem list_length_3_73 : (listFactorRows 3 73).length ≤ 197 := by decide +kernel
#check gram_check_3_73

theorem gram_check_3_74 : ∀ j : Fin 75,
    listResidual 3 74 j.val = expectedResidual 3 74 j.val := by decide +kernel
theorem dd_check_3_74 : expectedRowCheck 3 74 = true := by decide +kernel
theorem list_length_3_74 : (listFactorRows 3 74).length ≤ 197 := by decide +kernel
#check gram_check_3_74

theorem gram_check_3_75 : ∀ j : Fin 76,
    listResidual 3 75 j.val = expectedResidual 3 75 j.val := by decide +kernel
theorem dd_check_3_75 : expectedRowCheck 3 75 = true := by decide +kernel
theorem list_length_3_75 : (listFactorRows 3 75).length ≤ 197 := by decide +kernel
#check gram_check_3_75

theorem gram_check_3_76 : ∀ j : Fin 77,
    listResidual 3 76 j.val = expectedResidual 3 76 j.val := by decide +kernel
theorem dd_check_3_76 : expectedRowCheck 3 76 = true := by decide +kernel
theorem list_length_3_76 : (listFactorRows 3 76).length ≤ 197 := by decide +kernel
#check gram_check_3_76

theorem gram_check_3_77 : ∀ j : Fin 78,
    listResidual 3 77 j.val = expectedResidual 3 77 j.val := by decide +kernel
theorem dd_check_3_77 : expectedRowCheck 3 77 = true := by decide +kernel
theorem list_length_3_77 : (listFactorRows 3 77).length ≤ 197 := by decide +kernel
#check gram_check_3_77

theorem gram_check_3_78 : ∀ j : Fin 79,
    listResidual 3 78 j.val = expectedResidual 3 78 j.val := by decide +kernel
theorem dd_check_3_78 : expectedRowCheck 3 78 = true := by decide +kernel
theorem list_length_3_78 : (listFactorRows 3 78).length ≤ 197 := by decide +kernel
#check gram_check_3_78

theorem gram_check_3_79 : ∀ j : Fin 80,
    listResidual 3 79 j.val = expectedResidual 3 79 j.val := by decide +kernel
theorem dd_check_3_79 : expectedRowCheck 3 79 = true := by decide +kernel
theorem list_length_3_79 : (listFactorRows 3 79).length ≤ 197 := by decide +kernel
#check gram_check_3_79

end Hedetniemi.Round4
