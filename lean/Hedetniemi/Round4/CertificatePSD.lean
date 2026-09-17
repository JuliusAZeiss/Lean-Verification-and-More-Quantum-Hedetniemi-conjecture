import Hedetniemi.Round4.CertificateResidual
import Hedetniemi.Round4.CertificateSource

namespace Hedetniemi.Round4
open scoped BigOperators Matrix

theorem concrete_block_posSemidef (a : Fin 4) :
    Matrix.PosSemidef (fun i j : Fin 197 => (blockEntry a i j : ℝ)) :=
  concrete_list_block_posSemidef a

/-- The actual 788 by 788 integer matrix, cast to the reals, is PSD. -/
theorem sourceMatrixInt_posSemidef :
    Matrix.PosSemidef (fun u v : Fin 788 => (sourceMatrixInt u v : ℝ)) := by
  exact source_psd_from_checked_blocks concrete_block_posSemidef concrete_block_transform

#print axioms sourceMatrixInt_posSemidef
end Hedetniemi.Round4
