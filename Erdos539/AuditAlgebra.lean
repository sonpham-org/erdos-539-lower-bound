import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Data.Real.Basic

/-!
# Algebraic bookkeeping checks

This file machine-checks selected exponent manipulations from Sections 5 and 7
of the manuscript. It does not formalize their combinatorial hypotheses.
-/

namespace Erdos539.AuditAlgebra

/-- The exponent produced by codegree amplification exceeds `1/2` by the
quantity used in equation (16). -/
theorem amplifiedExponent_offset (ε : ℝ) (hε : 4 + 6 * ε ≠ 0) :
    (2 * (1 / 2 + ε)) / (3 * (1 / 2 + ε) + 1 / 2) - 1 / 2 =
      ε / (4 + 6 * ε) := by
  have hden : 3 * (1 / 2 + ε) + 1 / 2 ≠ 0 := by
    rw [show 3 * (1 / 2 + ε) + 1 / 2 = (4 + 6 * ε) / 2 by ring]
    exact div_ne_zero hε (by norm_num)
  have hε' : 4 + ε * 6 ≠ 0 := by
    simpa [mul_comm] using hε
  field_simp [hden, hε, hε']
  all_goals
    try field_simp [hε']
    ring

/-- Substituting `ε = 1/(4p²-2)` gives the displayed recurrence denominator. -/
theorem recurrence_denominator (p : ℝ)
    (h₁ : 4 * p ^ 2 - 2 ≠ 0) (h₂ : 16 * p ^ 2 - 2 ≠ 0) :
    (1 / (4 * p ^ 2 - 2)) / (4 + 6 * (1 / (4 * p ^ 2 - 2))) =
      1 / (16 * p ^ 2 - 2) := by
  field_simp [h₁, h₂]
  ring

/-- The interpolation weight in Section 5 has the claimed closed form. -/
theorem interpolation_weight (p d : ℝ)
    (hp : 16 * p ^ 2 - 2 ≠ 0) (hd : 4 * d ^ 2 - 2 ≠ 0) :
    (1 / (4 * d ^ 2 - 2)) / (1 / (16 * p ^ 2 - 2)) =
      (16 * p ^ 2 - 2) / (4 * d ^ 2 - 2) := by
  field_simp [hp, hd]

/-- Clearing the positive denominator in the final estimate yields the cubic
inequality used to obtain the stretched-exponential exponent. -/
theorem final_cubic_step (C X t : ℝ) (ht : 0 ≤ t)
    (h : X / (1 + t) ^ 2 ≤ C * (1 + t)) :
    X ≤ C * (1 + t) ^ 3 := by
  have hpos : 0 < (1 + t) ^ 2 := sq_pos_of_pos (by linarith)
  have h' : X ≤ C * (1 + t) * (1 + t) ^ 2 :=
    (div_le_iff₀ hpos).mp h
  calc
    X ≤ C * (1 + t) * (1 + t) ^ 2 := h'
    _ = C * (1 + t) ^ 3 := by ring

end Erdos539.AuditAlgebra
