import Hedetniemi.Round4.CertificateData
import Hedetniemi.Round4.CertificateFourier

namespace Hedetniemi.Round4
open scoped BigOperators

def blockFormulaN (a i j : Nat) : Int :=
  let x := kernelEntryN 0 i j
  let y := kernelEntryN 1 i j
  let z := kernelEntryN 2 i j
  let w := kernelEntryN 3 i j
  match a with
  | 0 => x+y+z+w
  | 1 => x-y+z-w
  | 2 => x+y-z-w
  | _ => x-y-z+w

theorem blockFormulaN_eq (a : Fin 4) (i j : Fin 197) :
    blockFormulaN a.val i.val j.val =
      ∑ s : Fin 4, walshInt a s * kernelEntry s i j := by
  fin_cases a <;>
    simp [blockFormulaN, Fin.sum_univ_succ, walshInt, kernelEntry] <;> ring

end Hedetniemi.Round4
