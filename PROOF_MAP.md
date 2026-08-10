# Proof map

This file is a navigation aid for the complete argument in
[`paper/erdos539_lower_bound_audited.pdf`](paper/erdos539_lower_bound_audited.pdf).
Equation and result numbers below refer to that manuscript.

## Target

For

\[
h(n)=\min_{|A|=n}\left|\left\{a/\gcd(a,b):a,b\in A\right\}\right|,
\]

Theorem 1.1 proves the existence of an absolute \(c>0\) such that

\[
h(n)\ge \sqrt n\exp\!\left(c(\log n)^{1/3}\right)
\]

for all sufficiently large \(n\).

## Dependency chain

```text
unique factorization
        |
        v
Proposition 2.1: arithmetic ↔ lattice positive differences
        |
        +------------------------------+
        |                              |
        v                              v
Lemma 2.2                    rooted orthant graphs (Section 3)
elementary D(F) facts                  |
        |                              v
        |                    Lemma 4.1: codegree amplification
        |                              |
        |                              v
        |                    Theorem 5.1: fixed-dimensional bound
        |                              |
        v                              |
Ruzsa sum-difference (Lemma 6.1)       |
        |                              |
        v                              |
weak PFR (Theorem 6.2) ----------------+
        |
        v
Section 7: dimension reduction + fixed-dimensional estimate
        |
        v
(1 + log L)^3 ≳ log n, where |D(F)| = L√n
        |
        v
Theorem 1.1
```

## Result-by-result ledger

### Proposition 2.1 - prime-valuation reformulation

For the primes occurring in \(A\), write each integer as a vector of prime
exponents. Coordinatewise,

\[
v_p\!\left(\frac a{\gcd(a,b)}\right)
=v_p(a)-\min(v_p(a),v_p(b))
=\max(v_p(a)-v_p(b),0).
\]

Unique factorization therefore identifies \(Q(A)\) with \(D(F)\). The converse
translates a finite lattice set into the nonnegative orthant and encodes its
vectors using distinct primes.

### Lemma 2.2 - elementary positive-difference facts

The identity

\[
x-y=(x-y)^+-(y-x)^+
\]

gives \(F-F\subset D(F)-D(F)\). A generic linear ordering produces
\(|F-F|\ge 2|F|-1\), hence \(|D(F)|\ge |F|^{1/2}\). Coordinate deletion
commutes with positive parts and cannot increase \(|D(F)|\).

### Lemma 4.1 - rooted codegree amplification

For a rooted bipartite graph of density \(\delta\) with active side sizes
\(x,y\), assume every finite \(W\subset\mathbb R^p\) satisfies
\(|D(W)|\ge c|W|^\alpha\), where \(1/2<\alpha\le1\). Then

\[
|\Delta(G)|\ge
\frac c{16}\sqrt{2\alpha-1}\,
\delta^{2\alpha}x^\alpha y^{1/2}.
\]

The proof double-counts common neighborhoods, splits unordered right-vertex
pairs into dyadic codegree levels, and assigns to each positive right-side
difference a disjoint shelf \(D(W)\times\{a\}\).

### Theorem 5.1 - fixed-dimensional induction

After translating one point to the origin, an orthant contains a subset
\(B\) with \(|B|\ge2^{-d}|F|\). A mixed orthant becomes a rooted graph. Lemma
4.1 and the inductive hypothesis in the smaller coordinate block yield an
exponent stronger than the target; interpolation with the elementary square-
root bound gives exactly

\[
|D(F)|\ge e^{-4d}|F|^{1/2+1/(4d^2-2)}.
\]

The manuscript keeps the constant recurrence explicit in equations (15)-(17).

### Theorem 6.2 - external weak PFR input

If \(|A+A|\le K|A|\) for finite \(A\subset\mathbb Z^D\), a polynomially large
subset \(A'\) has ordinary affine dimension \(O(\log K)\). This is the only
nonstandard external structural input. The manuscript uses the integer
consequence of Gowers-Green-Manners-Tao and records the dependence as absolute
constants \(B,D_0\).

### Section 7 - final assembly

Write \(|D(F)|=L\sqrt n\). Lemma 2.2 and Ruzsa's inequality give
\(|F+F|\le L^6n\). Weak PFR supplies \(F'\subset F\) with

\[
|F'|\ge 2^{-B}nL^{-6B},
\qquad
d=\dim_{\mathrm{aff}}F'\le D_1(1+\log L).
\]

An injective coordinate projection preserves enough positive differences to
apply Theorem 5.1. Taking logarithms and cancelling the baseline
\(\tfrac12\log n\) yields

\[
C_1(1+\log L)\ge
\frac{\log n}{4D_1^2(1+\log L)^2}.
\]

Thus \((1+\log L)^3\gg\log n\), which is the claimed stretched-exponential
gain over \(\sqrt n\).

## Scope

This chain proves a lower bound for every \(n\)-element input set. It does not
construct an extremal set and therefore does not supply a matching upper bound
or determine the unknown subpolynomial factor in \(h(n)\).
