import Hedetniemi.Expository.RegularSparse

namespace Hedetniemi.Expository
open scoped Matrix
set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- The sparse integer check yields this closed sum-of-squares identity. -/
theorem regularMatrix_sos :
    (4096 : ℝ) • regularMatrix =
      regularGramMatrixᴴ * regularGramMatrix +
        (112 : ℝ) • (regularMatrixᴴ * regularMatrix) :=
  regularMatrix_sos_sparse

/-- The adjacency matrix plus10I of the fixed1024-vertex graph is PSD. -/
theorem regularMatrix_posSemidef : regularMatrix.PosSemidef := by
  have hR := Matrix.posSemidef_conjTranspose_mul_self regularGramMatrix
  have hT := Matrix.posSemidef_conjTranspose_mul_self regularMatrix
  have hS := hR.add (real_matrix_posSemidef_smul hT (by norm_num : (0 : ℝ) ≤112))
  rw [←regularMatrix_sos] at hS
  have h := real_matrix_posSemidef_smul hS (by norm_num : (0 : ℝ) ≤1/4096)
  simpa only [smul_smul, show (1/4096 : ℝ)*4096=1 by norm_num, one_smul] using h

end Hedetniemi.Expository
