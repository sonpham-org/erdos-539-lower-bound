import Erdos539.Definitions
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-!
# Statement of the manuscript's main lower bound

The proposition is defined here exactly enough to serve as the target of a
future end-to-end formalization. No theorem claiming a proof is declared in
this file.
-/

namespace Erdos539.Statement

/-- Theorem 1.1 of the manuscript, as a proposition over the executable
cofactor-set definition. -/
def StretchedExponentialLowerBound : Prop :=
  ∃ c : ℝ, 0 < c ∧
    ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n →
      ∀ A : Finset ℕ,
        A.card = n → Erdos539.IsPositiveSet A →
          Real.sqrt (n : ℝ) *
              Real.exp (c * (Real.log (n : ℝ)) ^ (1 / 3 : ℝ)) ≤
            ((Erdos539.cofactorSet A).card : ℝ)

end Erdos539.Statement
