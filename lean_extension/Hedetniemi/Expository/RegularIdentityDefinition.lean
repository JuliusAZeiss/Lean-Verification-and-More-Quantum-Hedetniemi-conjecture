import Hedetniemi.Expository.RegularBase

namespace Hedetniemi.Expository
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- The XOR convolution encoding R²+112T². -/
def regularConvolution (x : ℕ) : ℤ :=
  ∑ y : Fin 1024,
    (regularGramKernel y.val * regularGramKernel (y.val ^^^ x) +
      112 * (regularKernel y.val * regularKernel (y.val ^^^ x)))

end Hedetniemi.Expository
