import Mathlib.Algebra.Group.Pi.Basic
import Mathlib.Algebra.Order.Ring.Int

/-!
# Positive-part algebra

These are the coordinatewise identities used in the lattice formulation of
the manuscript.
-/

namespace Erdos539

/-- A lattice point in dimension `d`. -/
abbrev LatticePoint (d : ℕ) := Fin d → ℤ

/-- The positive part `max(z,0)` of an integer. -/
def posPart (z : ℤ) : ℤ := max z 0

/-- Coordinatewise positive part. -/
def vectorPosPart {d : ℕ} (x : LatticePoint d) : LatticePoint d :=
  fun i ↦ posPart (x i)

/-- The coordinatewise positive difference `(x-y)⁺`. -/
def positiveDifference {d : ℕ} (x y : LatticePoint d) : LatticePoint d :=
  vectorPosPart (x - y)

theorem posPart_nonneg (z : ℤ) : 0 ≤ posPart z := by
  simp [posPart]

theorem sub_eq_posPart_sub_reverse (z : ℤ) :
    z = posPart z - posPart (-z) := by
  by_cases hz : 0 ≤ z
  · rw [show posPart z = z by simp [posPart, hz]]
    rw [show posPart (-z) = 0 by simp [posPart, hz]]
    simp
  · have hz' : z ≤ 0 := le_of_not_ge hz
    rw [show posPart z = 0 by simp [posPart, hz']]
    rw [show posPart (-z) = -z by simp [posPart, hz']]
    simp

theorem sub_eq_positiveDifference_sub_reverse {d : ℕ}
    (x y : LatticePoint d) :
    x - y = positiveDifference x y - positiveDifference y x := by
  funext i
  simpa [positiveDifference, vectorPosPart] using
    sub_eq_posPart_sub_reverse (x i - y i)

theorem positiveDifference_translate {d : ℕ}
    (x y t : LatticePoint d) :
    positiveDifference (x + t) (y + t) = positiveDifference x y := by
  funext i
  simp [positiveDifference, vectorPosPart, posPart]

/-- Delete or repeat coordinates according to `σ`. -/
def coordinateProjection {d e : ℕ} (σ : Fin e → Fin d)
    (x : LatticePoint d) : LatticePoint e :=
  fun i ↦ x (σ i)

theorem coordinateProjection_positiveDifference {d e : ℕ}
    (σ : Fin e → Fin d) (x y : LatticePoint d) :
    coordinateProjection σ (positiveDifference x y) =
      positiveDifference (coordinateProjection σ x) (coordinateProjection σ y) := by
  rfl

end Erdos539
