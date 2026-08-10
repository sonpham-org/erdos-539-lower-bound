import Mathlib.Data.Finset.Prod
import Mathlib.Data.Nat.GCD.Basic
import Mathlib.Order.Lattice.Nat

/-!
# Arithmetic definitions for Erdős Problem 539

This file gives an executable cofactor set and the extremal predicate used by
the manuscript. The definition follows the positive-integer formulation of the
problem.
-/

namespace Erdos539

/-- The set `{a / gcd(a,b) : a,b ∈ A}`. -/
def cofactorSet (A : Finset ℕ) : Finset ℕ :=
  (A ×ˢ A).image fun ab ↦ ab.1 / Nat.gcd ab.1 ab.2

/-- Every member of `A` is a positive integer. -/
def IsPositiveSet (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, 0 < a

/-- `m` is a uniform lower bound for all positive `n`-element input sets. -/
def IsCofactorLowerBound (n m : ℕ) : Prop :=
  ∀ A : Finset ℕ,
    A.card = n → IsPositiveSet A → m ≤ (cofactorSet A).card

/-- The extremal threshold `h(n)` from Erdős Problem 539. -/
noncomputable def cofactorThreshold (n : ℕ) : ℕ :=
  sSup {m | IsCofactorLowerBound n m}

theorem cofactorSet_nonempty {A : Finset ℕ} (hA : A.Nonempty) :
    (cofactorSet A).Nonempty := by
  rcases hA with ⟨a, ha⟩
  refine ⟨a / Nat.gcd a a, ?_⟩
  rw [Finset.mem_image]
  exact ⟨(a, a), by simp [ha], rfl⟩

example : cofactorSet {1, 2, 3} = {1, 2, 3} := by
  decide

example : cofactorSet {6, 10, 15} = {1, 2, 3, 5} := by
  decide

end Erdos539
