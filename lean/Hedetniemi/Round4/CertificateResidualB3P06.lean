import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_48 : ∀ j : Fin 49,
    listResidual 3 48 j.val = expectedResidual 3 48 j.val := by decide +kernel
theorem dd_check_3_48 : expectedRowCheck 3 48 = true := by decide +kernel
theorem list_length_3_48 : (listFactorRows 3 48).length ≤ 197 := by decide +kernel
#check gram_check_3_48

theorem gram_check_3_49 : ∀ j : Fin 50,
    listResidual 3 49 j.val = expectedResidual 3 49 j.val := by decide +kernel
theorem dd_check_3_49 : expectedRowCheck 3 49 = true := by decide +kernel
theorem list_length_3_49 : (listFactorRows 3 49).length ≤ 197 := by decide +kernel
#check gram_check_3_49

theorem gram_check_3_50 : ∀ j : Fin 51,
    listResidual 3 50 j.val = expectedResidual 3 50 j.val := by decide +kernel
theorem dd_check_3_50 : expectedRowCheck 3 50 = true := by decide +kernel
theorem list_length_3_50 : (listFactorRows 3 50).length ≤ 197 := by decide +kernel
#check gram_check_3_50

theorem gram_check_3_51 : ∀ j : Fin 52,
    listResidual 3 51 j.val = expectedResidual 3 51 j.val := by decide +kernel
theorem dd_check_3_51 : expectedRowCheck 3 51 = true := by decide +kernel
theorem list_length_3_51 : (listFactorRows 3 51).length ≤ 197 := by decide +kernel
#check gram_check_3_51

theorem gram_check_3_52 : ∀ j : Fin 53,
    listResidual 3 52 j.val = expectedResidual 3 52 j.val := by decide +kernel
theorem dd_check_3_52 : expectedRowCheck 3 52 = true := by decide +kernel
theorem list_length_3_52 : (listFactorRows 3 52).length ≤ 197 := by decide +kernel
#check gram_check_3_52

theorem gram_check_3_53 : ∀ j : Fin 54,
    listResidual 3 53 j.val = expectedResidual 3 53 j.val := by decide +kernel
theorem dd_check_3_53 : expectedRowCheck 3 53 = true := by decide +kernel
theorem list_length_3_53 : (listFactorRows 3 53).length ≤ 197 := by decide +kernel
#check gram_check_3_53

theorem gram_check_3_54 : ∀ j : Fin 55,
    listResidual 3 54 j.val = expectedResidual 3 54 j.val := by decide +kernel
theorem dd_check_3_54 : expectedRowCheck 3 54 = true := by decide +kernel
theorem list_length_3_54 : (listFactorRows 3 54).length ≤ 197 := by decide +kernel
#check gram_check_3_54

theorem gram_check_3_55 : ∀ j : Fin 56,
    listResidual 3 55 j.val = expectedResidual 3 55 j.val := by decide +kernel
theorem dd_check_3_55 : expectedRowCheck 3 55 = true := by decide +kernel
theorem list_length_3_55 : (listFactorRows 3 55).length ≤ 197 := by decide +kernel
#check gram_check_3_55

end Hedetniemi.Round4
