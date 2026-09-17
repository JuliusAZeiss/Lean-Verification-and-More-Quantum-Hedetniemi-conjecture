import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_2_40 : ∀ j : Fin 41,
    listResidual 2 40 j.val = expectedResidual 2 40 j.val := by decide +kernel
theorem dd_check_2_40 : expectedRowCheck 2 40 = true := by decide +kernel
theorem list_length_2_40 : (listFactorRows 2 40).length ≤ 197 := by decide +kernel
#check gram_check_2_40

theorem gram_check_2_41 : ∀ j : Fin 42,
    listResidual 2 41 j.val = expectedResidual 2 41 j.val := by decide +kernel
theorem dd_check_2_41 : expectedRowCheck 2 41 = true := by decide +kernel
theorem list_length_2_41 : (listFactorRows 2 41).length ≤ 197 := by decide +kernel
#check gram_check_2_41

theorem gram_check_2_42 : ∀ j : Fin 43,
    listResidual 2 42 j.val = expectedResidual 2 42 j.val := by decide +kernel
theorem dd_check_2_42 : expectedRowCheck 2 42 = true := by decide +kernel
theorem list_length_2_42 : (listFactorRows 2 42).length ≤ 197 := by decide +kernel
#check gram_check_2_42

theorem gram_check_2_43 : ∀ j : Fin 44,
    listResidual 2 43 j.val = expectedResidual 2 43 j.val := by decide +kernel
theorem dd_check_2_43 : expectedRowCheck 2 43 = true := by decide +kernel
theorem list_length_2_43 : (listFactorRows 2 43).length ≤ 197 := by decide +kernel
#check gram_check_2_43

theorem gram_check_2_44 : ∀ j : Fin 45,
    listResidual 2 44 j.val = expectedResidual 2 44 j.val := by decide +kernel
theorem dd_check_2_44 : expectedRowCheck 2 44 = true := by decide +kernel
theorem list_length_2_44 : (listFactorRows 2 44).length ≤ 197 := by decide +kernel
#check gram_check_2_44

theorem gram_check_2_45 : ∀ j : Fin 46,
    listResidual 2 45 j.val = expectedResidual 2 45 j.val := by decide +kernel
theorem dd_check_2_45 : expectedRowCheck 2 45 = true := by decide +kernel
theorem list_length_2_45 : (listFactorRows 2 45).length ≤ 197 := by decide +kernel
#check gram_check_2_45

theorem gram_check_2_46 : ∀ j : Fin 47,
    listResidual 2 46 j.val = expectedResidual 2 46 j.val := by decide +kernel
theorem dd_check_2_46 : expectedRowCheck 2 46 = true := by decide +kernel
theorem list_length_2_46 : (listFactorRows 2 46).length ≤ 197 := by decide +kernel
#check gram_check_2_46

theorem gram_check_2_47 : ∀ j : Fin 48,
    listResidual 2 47 j.val = expectedResidual 2 47 j.val := by decide +kernel
theorem dd_check_2_47 : expectedRowCheck 2 47 = true := by decide +kernel
theorem list_length_2_47 : (listFactorRows 2 47).length ≤ 197 := by decide +kernel
#check gram_check_2_47

end Hedetniemi.Round4
