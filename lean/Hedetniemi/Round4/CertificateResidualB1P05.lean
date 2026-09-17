import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_1_40 : ∀ j : Fin 41,
    listResidual 1 40 j.val = expectedResidual 1 40 j.val := by decide +kernel
theorem dd_check_1_40 : expectedRowCheck 1 40 = true := by decide +kernel
theorem list_length_1_40 : (listFactorRows 1 40).length ≤ 197 := by decide +kernel
#check gram_check_1_40

theorem gram_check_1_41 : ∀ j : Fin 42,
    listResidual 1 41 j.val = expectedResidual 1 41 j.val := by decide +kernel
theorem dd_check_1_41 : expectedRowCheck 1 41 = true := by decide +kernel
theorem list_length_1_41 : (listFactorRows 1 41).length ≤ 197 := by decide +kernel
#check gram_check_1_41

theorem gram_check_1_42 : ∀ j : Fin 43,
    listResidual 1 42 j.val = expectedResidual 1 42 j.val := by decide +kernel
theorem dd_check_1_42 : expectedRowCheck 1 42 = true := by decide +kernel
theorem list_length_1_42 : (listFactorRows 1 42).length ≤ 197 := by decide +kernel
#check gram_check_1_42

theorem gram_check_1_43 : ∀ j : Fin 44,
    listResidual 1 43 j.val = expectedResidual 1 43 j.val := by decide +kernel
theorem dd_check_1_43 : expectedRowCheck 1 43 = true := by decide +kernel
theorem list_length_1_43 : (listFactorRows 1 43).length ≤ 197 := by decide +kernel
#check gram_check_1_43

theorem gram_check_1_44 : ∀ j : Fin 45,
    listResidual 1 44 j.val = expectedResidual 1 44 j.val := by decide +kernel
theorem dd_check_1_44 : expectedRowCheck 1 44 = true := by decide +kernel
theorem list_length_1_44 : (listFactorRows 1 44).length ≤ 197 := by decide +kernel
#check gram_check_1_44

theorem gram_check_1_45 : ∀ j : Fin 46,
    listResidual 1 45 j.val = expectedResidual 1 45 j.val := by decide +kernel
theorem dd_check_1_45 : expectedRowCheck 1 45 = true := by decide +kernel
theorem list_length_1_45 : (listFactorRows 1 45).length ≤ 197 := by decide +kernel
#check gram_check_1_45

theorem gram_check_1_46 : ∀ j : Fin 47,
    listResidual 1 46 j.val = expectedResidual 1 46 j.val := by decide +kernel
theorem dd_check_1_46 : expectedRowCheck 1 46 = true := by decide +kernel
theorem list_length_1_46 : (listFactorRows 1 46).length ≤ 197 := by decide +kernel
#check gram_check_1_46

theorem gram_check_1_47 : ∀ j : Fin 48,
    listResidual 1 47 j.val = expectedResidual 1 47 j.val := by decide +kernel
theorem dd_check_1_47 : expectedRowCheck 1 47 = true := by decide +kernel
theorem list_length_1_47 : (listFactorRows 1 47).length ≤ 197 := by decide +kernel
#check gram_check_1_47

end Hedetniemi.Round4
