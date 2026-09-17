import Hedetniemi.Round4.CertificateIdentityBasic
namespace Hedetniemi.Round4
open scoped BigOperators Matrix

theorem source_psd_from_checked_blocks
    (hpsd : ∀ a : Fin 4, Matrix.PosSemidef
      (fun i j : Fin 197 => (blockEntry a i j : ℝ)))
    (htransform : ∀ (a : Fin 4) (i j : Fin 197),
      blockEntry a i j = ∑ s : Fin 4, walshInt a s * kernelEntry s i j) :
    Matrix.PosSemidef (fun u v : Fin 788 => (sourceMatrixInt u v : ℝ)) := by
  let index (v : Fin 788) : Fin 197 := ⟨v.val / 4, by omega⟩
  let bit (v : Fin 788) : Fin 4 := ⟨v.val % 4, Nat.mod_lt _ (by omega)⟩
  apply four_block_posSemidef _
    (fun a i j => (blockEntry a i j : ℝ)) index bit hpsd
  intro u v
  have hi := walsh_four_reconstruction
    (fun s => kernelEntryN s (u.val / 4) (v.val / 4)) (bit u) (bit v)
  have hb (a : Fin 4) :
      (∑ s : Fin 4, walshInt a s * kernelEntryN s.val (u.val / 4) (v.val / 4)) =
        blockEntry a (index u) (index v) :=
    (htransform a (index u) (index v)).symm
  simp_rw [hb] at hi
  change 4 * sourceMatrixInt u v = _ at hi
  have hr := congrArg (fun z : ℤ => (z : ℝ)) hi
  simpa only [Int.cast_mul, Int.cast_ofNat, Int.cast_sum, walshInt_cast] using hr


end Hedetniemi.Round4
