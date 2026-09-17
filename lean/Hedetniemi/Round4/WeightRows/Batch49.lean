import Hedetniemi.Round4.WeightRows.Defs
namespace Hedetniemi.Round4
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000
theorem weighted_row_784 : weightedSparseRow 784 = weightedRowExpected 784 := by decide
theorem weighted_row_785 : weightedSparseRow 785 = weightedRowExpected 785 := by decide
theorem weighted_row_786 : weightedSparseRow 786 = weightedRowExpected 786 := by decide
theorem weighted_row_787 : weightedSparseRow 787 = weightedRowExpected 787 := by decide
end Hedetniemi.Round4
