import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_48 : ∀ j : Fin 49,
    listResidual 1 48 j.val = expectedResidual 1 48 j.val := by decide +kernel
theorem dd_check_1_48 : expectedRowCheck 1 48 = true := by decide +kernel
theorem list_length_1_48 : (listFactorRows 1 48).length ≤ 197 := by decide +kernel
#check gram_check_1_48

theorem gram_check_1_49 : ∀ j : Fin 50,
    listResidual 1 49 j.val = expectedResidual 1 49 j.val := by decide +kernel
theorem dd_check_1_49 : expectedRowCheck 1 49 = true := by decide +kernel
theorem list_length_1_49 : (listFactorRows 1 49).length ≤ 197 := by decide +kernel
#check gram_check_1_49

theorem gram_check_1_50 : ∀ j : Fin 51,
    listResidual 1 50 j.val = expectedResidual 1 50 j.val := by decide +kernel
theorem dd_check_1_50 : expectedRowCheck 1 50 = true := by decide +kernel
theorem list_length_1_50 : (listFactorRows 1 50).length ≤ 197 := by decide +kernel
#check gram_check_1_50

theorem gram_check_1_51 : ∀ j : Fin 52,
    listResidual 1 51 j.val = expectedResidual 1 51 j.val := by decide +kernel
theorem dd_check_1_51 : expectedRowCheck 1 51 = true := by decide +kernel
theorem list_length_1_51 : (listFactorRows 1 51).length ≤ 197 := by decide +kernel
#check gram_check_1_51

theorem gram_check_1_52 : ∀ j : Fin 53,
    listResidual 1 52 j.val = expectedResidual 1 52 j.val := by decide +kernel
theorem dd_check_1_52 : expectedRowCheck 1 52 = true := by decide +kernel
theorem list_length_1_52 : (listFactorRows 1 52).length ≤ 197 := by decide +kernel
#check gram_check_1_52

theorem gram_check_1_53 : ∀ j : Fin 54,
    listResidual 1 53 j.val = expectedResidual 1 53 j.val := by decide +kernel
theorem dd_check_1_53 : expectedRowCheck 1 53 = true := by decide +kernel
theorem list_length_1_53 : (listFactorRows 1 53).length ≤ 197 := by decide +kernel
#check gram_check_1_53

theorem gram_check_1_54 : ∀ j : Fin 55,
    listResidual 1 54 j.val = expectedResidual 1 54 j.val := by decide +kernel
theorem dd_check_1_54 : expectedRowCheck 1 54 = true := by decide +kernel
theorem list_length_1_54 : (listFactorRows 1 54).length ≤ 197 := by decide +kernel
#check gram_check_1_54

theorem gram_check_1_55 : ∀ j : Fin 56,
    listResidual 1 55 j.val = expectedResidual 1 55 j.val := by decide +kernel
theorem dd_check_1_55 : expectedRowCheck 1 55 = true := by decide +kernel
theorem list_length_1_55 : (listFactorRows 1 55).length ≤ 197 := by decide +kernel
#check gram_check_1_55

end Hedetniemi.Round4
