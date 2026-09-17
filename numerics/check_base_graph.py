#!/usr/bin/env python3
"""Exact checks of the finite claims about the base graph F (Section 3 of the paper).

F is the Cayley graph of F_2^10 with connection set S. Elements of F_2^10 are the
integers 0..1023 and addition is bitwise exclusive-or. The script uses Python
integers only (no floating-point arithmetic, no third-party packages) and reads
no data file. It is independent of data/verify_regular.py and of the Lean sources.

Checked statements (numbering of the paper):
  * S has 22 elements, does not contain 0 and spans F_2^10 (F is simple,
    22-regular and connected);
  * Computation 1: |S^(2)| = 232, |S^(3)| = 792, and the two sets are disjoint;
  * Lemma 8(a): F has no closed walk of length three or five;
  * Computation 2 and Lemma 8(b): N_3 + 6 N_2 - 52 N_1 - 120 N_0 = 12 at all
    1024 points, that is, (A+10I)(A+2I)(A-6I) = 12 J, and the equivalent form
    (M+4I)R + 240M = 12J with M = A+10I, R = A^2-8A-180I = M^2-28M;
  * Equation (13): R^2 + 112 M^2 = 4096 M;
  * Lemma 8(c): tr M = 10*1024 and sum(M) = 32*1024;
  * the spectrum 22^1, 6^330, (-2)^616, (-10)^77 and the intersection array
    {22,21,20; 1,2,6} (Remark 11);
  * Remark 11: the code C = ker(sigma) has dimension 12 and minimum distance 6
    with exactly 77 words of weight 6, and there is a linear functional eta on C
    with eta(w) = 1 for all words w of weight 6 such that
    C' = {(w, eta(w))} is a [23,12,7] code;
  * the numbers of Theorem 1: |V(G)|, |V(H)|, c, and the bound 8192/5.
"""
from collections import Counter

S = [1, 2, 4, 8, 16, 31, 32, 64, 128, 245, 256, 371,
     431, 457, 512, 619, 697, 711, 805, 861, 915, 1022]
N = 1024
FAILED = []


def check(name, condition):
    print(("ok    " if condition else "FAIL  ") + name)
    if not condition:
        FAILED.append(name)


def rank_f2(vectors):
    basis = []
    for v in vectors:
        for b in basis:
            v = min(v, v ^ b)
        if v:
            basis.append(v)
    return len(basis)


def convolve(f, g):
    h = [0] * N
    support = [(y, fy) for y, fy in enumerate(f) if fy]
    for x in range(N):
        h[x] = sum(fy * g[x ^ y] for y, fy in support)
    return h


# --- the connection set -------------------------------------------------------
Sset = set(S)
check("|S| = 22, 0 not in S, S inside F_2^10",
      len(Sset) == 22 and 0 not in Sset and all(0 < s < N for s in S))
check("S spans F_2^10 (F is connected)", rank_f2(S) == 10)

# --- Computation 1 and Lemma 8(a) ----------------------------------------------
S2 = {a ^ b for a in S for b in S}
S3 = {a ^ b for a in S2 for b in S}
check("|S^(2)| = 232", len(S2) == 232)
check("|S^(3)| = 792", len(S3) == 792)
check("S^(2) and S^(3) are disjoint", not (S2 & S3))

n0 = [1 if x == 0 else 0 for x in range(N)]          # N_0
n1 = [1 if x in Sset else 0 for x in range(N)]       # N_1
n2 = convolve(n1, n1)                                # N_2
n3 = convolve(n2, n1)                                # N_3
n5 = convolve(convolve(n3, n1), n1)                  # N_5
check("N_3(0) = 0 and N_5(0) = 0 (no closed walk of length 3 or 5)",
      n3[0] == 0 and n5[0] == 0)

# --- Computation 2, Lemma 8(b), equation (13) -----------------------------------
check("N_3 + 6 N_2 - 52 N_1 - 120 N_0 = 12 at all 1024 points",
      all(n3[x] + 6 * n2[x] - 52 * n1[x] - 120 * n0[x] == 12 for x in range(N)))
m = [n1[x] + 10 * n0[x] for x in range(N)]                       # kernel of M = A + 10 I
r = [n2[x] - 8 * n1[x] - 180 * n0[x] for x in range(N)]          # kernel of R = A^2 - 8A - 180 I
mm = convolve(m, m)
check("R = M^2 - 28 M", all(r[x] == mm[x] - 28 * m[x] for x in range(N)))
mr = convolve(m, r)
check("(M + 4I) R + 240 M = 12 J",
      all(mr[x] + 4 * r[x] + 240 * m[x] == 12 for x in range(N)))
rr = convolve(r, r)
check("R^2 + 112 M^2 = 4096 M  (equation (13))",
      all(rr[x] + 112 * mm[x] == 4096 * m[x] for x in range(N)))
check("tr M = 10 * 1024 and sum(M) = 32 * 1024",
      N * m[0] == 10 * N and N * sum(m) == 32 * N)

# --- spectrum and intersection array ---------------------------------------------
spectrum = Counter(sum(-1 if bin(ch & s).count("1") & 1 else 1 for s in S) for ch in range(N))
check("spectrum of A is 22^1, 6^330, (-2)^616, (-10)^77",
      dict(spectrum) == {22: 1, 6: 330, -2: 616, -10: 77})

dist = {0: 0}
frontier = [0]
while frontier:
    nxt = []
    for x in frontier:
        for s in S:
            y = x ^ s
            if y not in dist:
                dist[y] = dist[x] + 1
                nxt.append(y)
    frontier = nxt
check("distance classes from 0 have sizes 1, 22, 231, 770",
      Counter(dist.values()) == Counter({0: 1, 1: 22, 2: 231, 3: 770}))
arrays = set()
for x in range(N):
    d = dist[x]
    down = sum(1 for s in S if dist[x ^ s] == d - 1)
    up = sum(1 for s in S if dist[x ^ s] == d + 1)
    arrays.add((d, down, up))
check("intersection array {22,21,20; 1,2,6}",
      arrays == {(0, 0, 22), (1, 1, 21), (2, 2, 20), (3, 6, 0)})

# --- Remark 11: the code C with parity-check columns S ----------------------------
# Coordinates of F_2^22 are indexed by the positions of S. The ten unit vectors
# 2^k belong to S, so C has a basis with one vector for each other element of S.
position = {s: j for j, s in enumerate(S)}
units = [1 << k for k in range(10)]
check("the ten unit vectors belong to S", all(u in position for u in units))
free = [s for s in S if s not in units]
basis = []
for s in free:
    word = 1 << position[s]
    for k in range(10):
        if s >> k & 1:
            word |= 1 << position[1 << k]
    basis.append(word)
check("dim C = 12", len(basis) == 12)


def syndrome(word):
    out = 0
    for j, s in enumerate(S):
        if word >> j & 1:
            out ^= s
    return out


check("the basis vectors lie in C = ker(sigma)", all(syndrome(w) == 0 for w in basis))
words = [0] * 4096            # words[mask] = sum of the basis vectors selected by mask
for mask in range(1, 4096):
    low = mask & -mask
    words[mask] = words[mask ^ low] ^ basis[low.bit_length() - 1]
weights = [bin(w).count("1") for w in words]
distribution = Counter(weights)
check("C has minimum distance 6", min(wt for wt in weights[1:]) == 6)
check("C has exactly 77 words of weight 6", distribution[6] == 77)

hexads = [mask for mask in range(4096) if weights[mask] == 6]
golay = {0: 1, 7: 253, 8: 506, 11: 1288, 12: 1288, 15: 506, 16: 253, 23: 1}
good = []
for eta in range(4096):        # eta(w) = parity of (eta & mask) for w = words[mask]
    if all(bin(eta & mask).count("1") & 1 for mask in hexads):
        extended = Counter(weights[mask] + (bin(eta & mask).count("1") & 1)
                           for mask in range(4096))
        if dict(extended) == golay:
            good.append(eta)
check("a functional eta with eta = 1 on all words of weight 6 gives a [23,12,7] code",
      len(good) >= 1)
print("      number of such functionals:", len(good))

# --- numbers of Theorem 1 -----------------------------------------------------------
t, p = 512, 1024
c = 3 * t + 2
check("c = 1538, |V(G)| = 524288, |V(H)| = 1576451",
      c == 1538 and p * t == 524288 and (p + 1) * c + 1 == 1576451)
check("512 * 32 / 10 = 8192/5, so k >= 1639", 5 * 512 * 32 == 8192 * 10 and -(-8192 // 5) == 1639)
check("t sum(M) > c tr M  (16384 p > 15380 p)", t * 32 * p > c * 10 * p)

print()
if FAILED:
    raise SystemExit("FAILED: " + "; ".join(FAILED))
print("ALL CHECKS PASSED")
