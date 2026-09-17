import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_48 : ∀ j : Fin 49,
    listResidual 0 48 j.val = expectedResidual 0 48 j.val := by decide +kernel
theorem dd_check_0_48 : expectedRowCheck 0 48 = true := by decide +kernel
theorem list_length_0_48 : (listFactorRows 0 48).length ≤ 197 := by decide +kernel
#check gram_check_0_48

theorem gram_check_0_49 : ∀ j : Fin 50,
    listResidual 0 49 j.val = expectedResidual 0 49 j.val := by decide +kernel
theorem dd_check_0_49 : expectedRowCheck 0 49 = true := by decide +kernel
theorem list_length_0_49 : (listFactorRows 0 49).length ≤ 197 := by decide +kernel
#check gram_check_0_49

theorem gram_check_0_50 : ∀ j : Fin 51,
    listResidual 0 50 j.val = expectedResidual 0 50 j.val := by decide +kernel
theorem dd_check_0_50 : expectedRowCheck 0 50 = true := by decide +kernel
theorem list_length_0_50 : (listFactorRows 0 50).length ≤ 197 := by decide +kernel
#check gram_check_0_50

theorem gram_check_0_51 : ∀ j : Fin 52,
    listResidual 0 51 j.val = expectedResidual 0 51 j.val := by decide +kernel
theorem dd_check_0_51 : expectedRowCheck 0 51 = true := by decide +kernel
theorem list_length_0_51 : (listFactorRows 0 51).length ≤ 197 := by decide +kernel
#check gram_check_0_51

theorem gram_check_0_52 : ∀ j : Fin 53,
    listResidual 0 52 j.val = expectedResidual 0 52 j.val := by decide +kernel
theorem dd_check_0_52 : expectedRowCheck 0 52 = true := by decide +kernel
theorem list_length_0_52 : (listFactorRows 0 52).length ≤ 197 := by decide +kernel
#check gram_check_0_52

theorem gram_check_0_53 : ∀ j : Fin 54,
    listResidual 0 53 j.val = expectedResidual 0 53 j.val := by decide +kernel
theorem dd_check_0_53 : expectedRowCheck 0 53 = true := by decide +kernel
theorem list_length_0_53 : (listFactorRows 0 53).length ≤ 197 := by decide +kernel
#check gram_check_0_53

theorem gram_check_0_54 : ∀ j : Fin 55,
    listResidual 0 54 j.val = expectedResidual 0 54 j.val := by decide +kernel
theorem dd_check_0_54 : expectedRowCheck 0 54 = true := by decide +kernel
theorem list_length_0_54 : (listFactorRows 0 54).length ≤ 197 := by decide +kernel
#check gram_check_0_54

theorem gram_check_0_55 : ∀ j : Fin 56,
    listResidual 0 55 j.val = expectedResidual 0 55 j.val := by decide +kernel
theorem dd_check_0_55 : expectedRowCheck 0 55 = true := by decide +kernel
theorem list_length_0_55 : (listFactorRows 0 55).length ≤ 197 := by decide +kernel
#check gram_check_0_55

end Hedetniemi.Round4
