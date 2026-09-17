import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_0_40 : ∀ j : Fin 41,
    listResidual 0 40 j.val = expectedResidual 0 40 j.val := by decide +kernel
theorem dd_check_0_40 : expectedRowCheck 0 40 = true := by decide +kernel
theorem list_length_0_40 : (listFactorRows 0 40).length ≤ 197 := by decide +kernel
#check gram_check_0_40

theorem gram_check_0_41 : ∀ j : Fin 42,
    listResidual 0 41 j.val = expectedResidual 0 41 j.val := by decide +kernel
theorem dd_check_0_41 : expectedRowCheck 0 41 = true := by decide +kernel
theorem list_length_0_41 : (listFactorRows 0 41).length ≤ 197 := by decide +kernel
#check gram_check_0_41

theorem gram_check_0_42 : ∀ j : Fin 43,
    listResidual 0 42 j.val = expectedResidual 0 42 j.val := by decide +kernel
theorem dd_check_0_42 : expectedRowCheck 0 42 = true := by decide +kernel
theorem list_length_0_42 : (listFactorRows 0 42).length ≤ 197 := by decide +kernel
#check gram_check_0_42

theorem gram_check_0_43 : ∀ j : Fin 44,
    listResidual 0 43 j.val = expectedResidual 0 43 j.val := by decide +kernel
theorem dd_check_0_43 : expectedRowCheck 0 43 = true := by decide +kernel
theorem list_length_0_43 : (listFactorRows 0 43).length ≤ 197 := by decide +kernel
#check gram_check_0_43

theorem gram_check_0_44 : ∀ j : Fin 45,
    listResidual 0 44 j.val = expectedResidual 0 44 j.val := by decide +kernel
theorem dd_check_0_44 : expectedRowCheck 0 44 = true := by decide +kernel
theorem list_length_0_44 : (listFactorRows 0 44).length ≤ 197 := by decide +kernel
#check gram_check_0_44

theorem gram_check_0_45 : ∀ j : Fin 46,
    listResidual 0 45 j.val = expectedResidual 0 45 j.val := by decide +kernel
theorem dd_check_0_45 : expectedRowCheck 0 45 = true := by decide +kernel
theorem list_length_0_45 : (listFactorRows 0 45).length ≤ 197 := by decide +kernel
#check gram_check_0_45

theorem gram_check_0_46 : ∀ j : Fin 47,
    listResidual 0 46 j.val = expectedResidual 0 46 j.val := by decide +kernel
theorem dd_check_0_46 : expectedRowCheck 0 46 = true := by decide +kernel
theorem list_length_0_46 : (listFactorRows 0 46).length ≤ 197 := by decide +kernel
#check gram_check_0_46

theorem gram_check_0_47 : ∀ j : Fin 48,
    listResidual 0 47 j.val = expectedResidual 0 47 j.val := by decide +kernel
theorem dd_check_0_47 : expectedRowCheck 0 47 = true := by decide +kernel
theorem list_length_0_47 : (listFactorRows 0 47).length ≤ 197 := by decide +kernel
#check gram_check_0_47

end Hedetniemi.Round4
