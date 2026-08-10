# A stretched-exponential lower bound for Erdős Problem 539

[![Lean](https://github.com/sonpham-org/erdos-539-lower-bound/actions/workflows/lean.yml/badge.svg)](https://github.com/sonpham-org/erdos-539-lower-bound/actions/workflows/lean.yml)
[![Lean 4.32.2](https://img.shields.io/badge/Lean-4.32.2-blue.svg)](https://github.com/leanprover/lean4/releases/tag/v4.32.2)

For a finite set \(A\) of positive integers, put

\[
Q(A)=\left\{\frac{a}{\gcd(a,b)}:a,b\in A\right\},
\qquad
h(n)=\min_{|A|=n}|Q(A)|.
\]

The manuscript in this repository proves that there is an absolute constant
\(c>0\) such that, for all sufficiently large \(n\),

\[
\boxed{h(n)\ge \sqrt n\,\exp\!\left(c(\log n)^{1/3}\right).}
\]

This is a lower bound, not a full determination of \(h(n)\). Erdős Problem
539 remains open. The result shows in particular that \(h(n)/\sqrt n\to
\infty\), and rules out every fixed polylogarithmic correction to \(\sqrt n\).

## Read the proof

The complete audited argument is in
[`paper/erdos539_lower_bound_audited.pdf`](paper/erdos539_lower_bound_audited.pdf).
It is a nine-page, unrefereed research manuscript dated August 9, 2026.

The proof has four main moves:

1. Prime-valuation vectors identify \(Q(A)\) with the positive-difference set
   \(D(F)=\{(x-y)^+:x,y\in F\}\) of a finite lattice set.
2. A rooted bipartite codegree-amplification lemma converts common
   neighborhoods into disjoint shelves of positive differences.
3. Induction on the ambient dimension yields
   \(|D(F)|\ge e^{-4d}|F|^{1/2+1/(4d^2-2)}\) for finite
   \(F\subset\mathbb R^d\).
4. Weak Polynomial Freiman-Ruzsa theory extracts a polynomially large subset
   of affine dimension \(O(\log L)\), where \(|D(F)|=L\sqrt{|F|}\).
   Combining the two estimates forces \(\log L\gg(\log |F|)^{1/3}\).

[`PROOF_MAP.md`](PROOF_MAP.md) records the dependency chain and the exact role
of every named result.

## Lean status

The Lean project is intentionally honest about what is and is not formalized.
It currently provides:

- an executable definition of the cofactor set and the extremal statement;
- machine-checked positive-part identities behind the lattice reformulation;
- machine-checked coordinate-projection and translation identities;
- machine-checked exponent and final-cubic bookkeeping identities; and
- finite kernel-checked examples for the arithmetic definition.

The code contains no proof placeholders and declares no axioms. The main
lower-bound proposition is defined as a `Prop` in
[`Erdos539/Statement.lean`](Erdos539/Statement.lean), but is not presented as a
Lean theorem. The codegree-amplification lemma, fixed-dimensional induction,
weak PFR input, and final assembly remain to be formalized. See
[`FORMALIZATION.md`](FORMALIZATION.md) for the precise ledger.

Build with:

```bash
lake update
lake exe cache get
lake build
```

The project pins Lean and Mathlib to `v4.32.2`; GitHub Actions runs the same
build and rejects `sorry` or `admit` in Lean sources.

## Repository layout

```text
paper/                  audited manuscript and checksum
Erdos539/               Lean modules
Erdos539.lean           Lean library root
PROOF_MAP.md             proof architecture and dependencies
FORMALIZATION.md         machine-checking status ledger
.github/workflows/       reproducible Lean CI
```

## Context and references

- [Erdős Problem 539](https://www.erdosproblems.com/539)
- W. T. Gowers, B. Green, F. Manners, and T. Tao,
  [*On a conjecture of Marton*](https://arxiv.org/abs/2311.05762),
  *Annals of Mathematics* 201 (2025), 515-549.
- R. Holzman, V. F. Lev, and R. Pinchasi, *Projecting difference sets on the
  positive orthant*, *Combinatorics, Probability and Computing* 17 (2008),
  681-688.
- T. Tao and V. Vu, *Additive Combinatorics*, Cambridge University Press,
  2006.

## Authorship and citation

The manuscript is by Son Pham. Citation metadata is provided in
[`CITATION.cff`](CITATION.cff). The PDF is an archival snapshot and remains
under the author's copyright.
