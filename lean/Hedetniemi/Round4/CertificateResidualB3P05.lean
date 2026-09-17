import Hedetniemi.Round4.CertificateResidualBasic

namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem gram_check_3_40 : ∀ j : Fin 41,
    listResidual 3 40 j.val = expectedResidual 3 40 j.val := by decide +kernel
theorem dd_check_3_40 : expectedRowCheck 3 40 = true := by decide +kernel
theorem list_length_3_40 : (listFactorRows 3 40).length ≤ 197 := by decide +kernel
#check gram_check_3_40

theorem gram_check_3_41 : ∀ j : Fin 42,
    listResidual 3 41 j.val = expectedResidual 3 41 j.val := by decide +kernel
theorem dd_check_3_41 : expectedRowCheck 3 41 = true := by decide +kernel
theorem list_length_3_41 : (listFactorRows 3 41).length ≤ 197 := by decide +kernel
#check gram_check_3_41

theorem gram_check_3_42 : ∀ j : Fin 43,
    listResidual 3 42 j.val = expectedResidual 3 42 j.val := by decide +kernel
theorem dd_check_3_42 : expectedRowCheck 3 42 = true := by decide +kernel
theorem list_length_3_42 : (listFactorRows 3 42).length ≤ 197 := by decide +kernel
#check gram_check_3_42

theorem gram_check_3_43 : ∀ j : Fin 44,
    listResidual 3 43 j.val = expectedResidual 3 43 j.val := by decide +kernel
theorem dd_check_3_43 : expectedRowCheck 3 43 = true := by decide +kernel
theorem list_length_3_43 : (listFactorRows 3 43).length ≤ 197 := by decide +kernel
#check gram_check_3_43

theorem gram_check_3_44 : ∀ j : Fin 45,
    listResidual 3 44 j.val = expectedResidual 3 44 j.val := by decide +kernel
theorem dd_check_3_44 : expectedRowCheck 3 44 = true := by decide +kernel
theorem list_length_3_44 : (listFactorRows 3 44).length ≤ 197 := by decide +kernel
#check gram_check_3_44

theorem gram_check_3_45 : ∀ j : Fin 46,
    listResidual 3 45 j.val = expectedResidual 3 45 j.val := by decide +kernel
theorem dd_check_3_45 : expectedRowCheck 3 45 = true := by decide +kernel
theorem list_length_3_45 : (listFactorRows 3 45).length ≤ 197 := by decide +kernel
#check gram_check_3_45

theorem gram_check_3_46 : ∀ j : Fin 47,
    listResidual 3 46 j.val = expectedResidual 3 46 j.val := by decide +kernel
theorem dd_check_3_46 : expectedRowCheck 3 46 = true := by decide +kernel
theorem list_length_3_46 : (listFactorRows 3 46).length ≤ 197 := by decide +kernel
#check gram_check_3_46

theorem gram_check_3_47 : ∀ j : Fin 48,
    listResidual 3 47 j.val = expectedResidual 3 47 j.val := by decide +kernel
theorem dd_check_3_47 : expectedRowCheck 3 47 = true := by decide +kernel
theorem list_length_3_47 : (listFactorRows 3 47).length ≤ 197 := by decide +kernel
#check gram_check_3_47

end Hedetniemi.Round4
