import Hedetniemi.Round4.CertificateResidualChecks
import Hedetniemi.Round4.CertificateIdentities

namespace Hedetniemi.Round4
open scoped BigOperators Matrix

theorem concrete_residual_eq (a : Fin 4) (i j : Fin 197) :
    listResidual a.val i.val j.val = expectedResidual a.val i.val j.val :=
  checked_residual_table_eq a (concrete_block_symmetry a)
    (fun i => (all_residual_checks a i).1) i j

theorem concrete_list_block_posSemidef (a : Fin 4) :
    Matrix.PosSemidef (fun i j : Fin 197 => (blockEntry a i j : ℝ)) :=
  checked_residual_table_posSemidef a (concrete_block_symmetry a) (all_residual_checks a)

end Hedetniemi.Round4
