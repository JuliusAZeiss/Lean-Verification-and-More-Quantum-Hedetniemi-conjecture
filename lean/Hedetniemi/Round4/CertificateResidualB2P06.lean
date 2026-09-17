import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_48 : ∀ j : Fin 49,
    listResidual 2 48 j.val = expectedResidual 2 48 j.val := by decide +kernel
theorem dd_check_2_48 : expectedRowCheck 2 48 = true := by decide +kernel
theorem list_length_2_48 : (listFactorRows 2 48).length ≤ 197 := by decide +kernel
#check gram_check_2_48

theorem gram_check_2_49 : ∀ j : Fin 50,
    listResidual 2 49 j.val = expectedResidual 2 49 j.val := by decide +kernel
theorem dd_check_2_49 : expectedRowCheck 2 49 = true := by decide +kernel
theorem list_length_2_49 : (listFactorRows 2 49).length ≤ 197 := by decide +kernel
#check gram_check_2_49

theorem gram_check_2_50 : ∀ j : Fin 51,
    listResidual 2 50 j.val = expectedResidual 2 50 j.val := by decide +kernel
theorem dd_check_2_50 : expectedRowCheck 2 50 = true := by decide +kernel
theorem list_length_2_50 : (listFactorRows 2 50).length ≤ 197 := by decide +kernel
#check gram_check_2_50

theorem gram_check_2_51 : ∀ j : Fin 52,
    listResidual 2 51 j.val = expectedResidual 2 51 j.val := by decide +kernel
theorem dd_check_2_51 : expectedRowCheck 2 51 = true := by decide +kernel
theorem list_length_2_51 : (listFactorRows 2 51).length ≤ 197 := by decide +kernel
#check gram_check_2_51

theorem gram_check_2_52 : ∀ j : Fin 53,
    listResidual 2 52 j.val = expectedResidual 2 52 j.val := by decide +kernel
theorem dd_check_2_52 : expectedRowCheck 2 52 = true := by decide +kernel
theorem list_length_2_52 : (listFactorRows 2 52).length ≤ 197 := by decide +kernel
#check gram_check_2_52

theorem gram_check_2_53 : ∀ j : Fin 54,
    listResidual 2 53 j.val = expectedResidual 2 53 j.val := by decide +kernel
theorem dd_check_2_53 : expectedRowCheck 2 53 = true := by decide +kernel
theorem list_length_2_53 : (listFactorRows 2 53).length ≤ 197 := by decide +kernel
#check gram_check_2_53

theorem gram_check_2_54 : ∀ j : Fin 55,
    listResidual 2 54 j.val = expectedResidual 2 54 j.val := by decide +kernel
theorem dd_check_2_54 : expectedRowCheck 2 54 = true := by decide +kernel
theorem list_length_2_54 : (listFactorRows 2 54).length ≤ 197 := by decide +kernel
#check gram_check_2_54

theorem gram_check_2_55 : ∀ j : Fin 56,
    listResidual 2 55 j.val = expectedResidual 2 55 j.val := by decide +kernel
theorem dd_check_2_55 : expectedRowCheck 2 55 = true := by decide +kernel
theorem list_length_2_55 : (listFactorRows 2 55).length ≤ 197 := by decide +kernel
#check gram_check_2_55

end Hedetniemi.Round4
