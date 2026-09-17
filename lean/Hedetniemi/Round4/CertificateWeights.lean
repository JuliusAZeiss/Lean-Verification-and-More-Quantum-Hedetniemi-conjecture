import Hedetniemi.Round4.WeightRows.All

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem weighted_numerator_int :
    (∑ u : Fin 788, ∑ v : Fin 788, weightedTermInt u v) = 1020438226912198088 := by
  rw [weighted_sum_sparse]
  change (∑ u : Fin 788, weightedSparseRow u) = 1020438226912198088
  simp_rw [weightedRow_exact]
  decide

theorem weighted_denominator_int :
    (∑ u : Fin 788, (fiberSize u : ℤ) * integerWeight u * integerWeight u * sourceMatrixInt u u) =
      861856598314848 := by decide

theorem weighted_numerator :
    (∑ u : Fin 788, ∑ v : Fin 788,
      ((fiberSize u : ℝ) * (fiberSize v : ℝ)) * weightedMatrix u v) =
      1020438226912198088 := by
  have h := congrArg (fun z : ℤ => (z : ℝ)) weighted_numerator_int
  simp only [weightedTermInt,Int.cast_sum,Int.cast_mul,Int.cast_natCast,Int.cast_ofNat] at h
  simpa only [weightedMatrix,sourceMatrix,mul_assoc] using h

theorem weighted_denominator :
    (∑ u : Fin 788, (fiberSize u : ℝ) * weightedMatrix u u) = 861856598314848 := by
  have h := congrArg (fun z : ℤ => (z : ℝ)) weighted_denominator_int
  simp only [Int.cast_sum,Int.cast_mul,Int.cast_natCast,Int.cast_ofNat] at h
  simpa only [weightedMatrix,sourceMatrix,mul_assoc] using h

end Hedetniemi.Round4
