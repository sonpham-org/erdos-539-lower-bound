# Lean formalization ledger

The Lean sources compile without proof placeholders and without declared
axioms. That statement is deliberately narrower than "the paper has been
formalized."

| Manuscript component | Lean file | Status |
|---|---|---|
| Cofactor-set definition | `Erdos539/Definitions.lean` | Executable and checked |
| Extremal lower-bound predicate | `Erdos539/Definitions.lean` | Defined |
| Main stretched-exponential proposition | `Erdos539/Statement.lean` | Precisely stated, not proved |
| Scalar positive-part decomposition | `Erdos539/PositivePart.lean` | Proved |
| Vector positive-difference decomposition | `Erdos539/PositivePart.lean` | Proved |
| Translation invariance | `Erdos539/PositivePart.lean` | Proved |
| Coordinate projection commutes with positive differences | `Erdos539/PositivePart.lean` | Proved |
| Finite cofactor-set examples | `Erdos539/Definitions.lean` | Checked by kernel `decide` |
| Fixed-dimensional exponent recurrence identities | `Erdos539/AuditAlgebra.lean` | Proved |
| Final denominator-clearing/cubic step | `Erdos539/AuditAlgebra.lean` | Proved |
| Proposition 2.1 as a cardinality-preserving prime-valuation bijection | - | Open |
| Lemma 2.2 cardinality bounds | - | Open |
| Lemma 3.1 root-axis cardinality bounds | - | Open |
| Lemma 4.1 codegree amplification | - | Open |
| Theorem 5.1 fixed-dimensional induction | - | Open |
| Lemma 6.1 manuscript instantiation | - | Open |
| Theorem 6.2 weak PFR interface and source theorem | - | Open |
| Section 7 asymptotic assembly | - | Open |

## Trust boundary

`Erdos539.Statement.StretchedExponentialLowerBound` is a definition whose value
is the proposition asserted by Theorem 1.1. It is not wrapped in an unproved
Lean `theorem`, and no local axiom is introduced to manufacture one. This keeps
`#print axioms`-style trust claims meaningful for the results that are actually
present.

The complete human proof remains the audited PDF. The Lean project is a sound
foundation for a future end-to-end formalization, plus a machine-checked audit
of several error-prone algebraic and coordinatewise steps.

## Suggested next milestones

1. Formalize finite positive-difference sets as `Finset` images and prove all
   three parts of Lemma 2.2, including the generic-order cardinality argument.
2. Build the prime-support encoding and prove Proposition 2.1.
3. Formalize rooted orthant graphs and Lemma 3.1.
4. Isolate the dyadic codegree calculation of Lemma 4.1 into counting lemmas.
5. Package the integer weak-PFR consequence with an explicit citation and
   assumptions suitable for Mathlib.
6. Complete the fixed-dimensional induction and final asymptotic argument.
