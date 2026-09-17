import Hedetniemi.Round4.SmallGraphs
import Hedetniemi.Round4.CertificateData
namespace Hedetniemi.Round4
/-- Exact graph-support condition for one shifted matrix entry. -/
def KernelSupportAt (s : Fin 4) (i j : Fin 197) : Prop :=
  kernelEntryN s.val i.val j.val = 0 ∨ (i = j ∧ s = 0) ∨
    ∃ a : Fin 22, 4 * ((cosetCoordinate i).val ^^^ (cosetCoordinate j).val) + s.val = step a
instance (s : Fin 4) (i j : Fin 197) : Decidable (KernelSupportAt s i j) :=
by
  unfold KernelSupportAt
  infer_instance
end Hedetniemi.Round4
