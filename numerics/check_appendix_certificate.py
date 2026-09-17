#!/usr/bin/env python3
"""Exact checks of the certificate of Appendix A, following the text of the paper.

The script rebuilds every object from its description in the paper and from the
three data files in data/. It uses Python integers only (no floating-point
arithmetic, no third-party packages). It is independent of data/verify.py and of
the Lean sources.

Checked statements (numbering of the paper):
  * V_0 has 788 elements, is a union of 197 cosets of {0,1,2,3}, and equals the
    vertex selection in instance.json; `cosets` and `steps` in
    matrix_certificate.json are the 197 values floor(nu/4) and the set S;
  * `specs` lists the 197 vertex orbits and the 1992 edge orbits of the group
    {0,1,2,3} on F_0, which has 7180 edges;
  * M_0, built from the orbit weights as described in the proof of Lemma 19, is
    symmetric, supported on F_0, and of the form (24) with four symmetric
    197 x 197 matrices;
  * the residuals q^2 * K-hat_a - L_a L_a^T of the four Fourier blocks (25) are
    diagonally dominant with nonnegative diagonal (26), with q = 10^6 and the
    factors L_a of gram_certificate.json.gz;
  * the totals (22) and (23): tr M_0 = 400025192, sum(M_0) = 1202501792,
    394 sum(M_0) - 1184 tr M_0 = 155878720;
  * the orders of G_0, G'_0 and H_0;
  * Table 1 (the weights w_v) and the fiber sizes s_v agree with instance.json;
  * sum(M-tilde) = 1020438226912198088, tr M-tilde = 861856598314848 and
    sum(M-tilde) - 1184 tr M-tilde = 14507418056.
"""
import gzip
import json
from pathlib import Path

DATA = Path(__file__).resolve().parent.parent / "data"
S = {1, 2, 4, 8, 16, 31, 32, 64, 128, 245, 256, 371,
     431, 457, 512, 619, 697, 711, 805, 861, 915, 1022}
INDEX_SET = {0, 2, 4, 8, 23, 24, 30, 34, 40, 42, 46, 50, 53, 61}
TABLE_1 = {26: 72, 185: 72, 193: 73, 291: 73, 349: 73, 351: 75, 587: 73, 663: 73,
           785: 72, 868: 72, 932: 72, 964: 72, 992: 69, 994: 75, 996: 60, 998: 75,
           1004: 73, 1006: 75, 1012: 72, 1019: 72}
FAILED = []


def check(name, condition):
    print(("ok    " if condition else "FAIL  ") + name)
    if not condition:
        FAILED.append(name)


certificate = json.loads((DATA / "matrix_certificate.json").read_text(encoding="utf-8"))
instance = json.loads((DATA / "instance.json").read_text(encoding="utf-8"))
with gzip.open(DATA / "gram_certificate.json.gz", "rt", encoding="utf-8") as stream:
    gram = json.load(stream)

# --- the graph F_0 -------------------------------------------------------------------
V0 = [v for v in range(1024) if v // 16 not in INDEX_SET and not 112 <= v <= 123]
V0set = set(V0)
check("|V_0| = 788", len(V0) == 788)
check("V_0 equals the vertex selection in instance.json",
      instance["vertex_selection"]["coordinates"] == V0)
cosets = sorted({v // 4 for v in V0})
check("V_0 is a union of 197 cosets of {0,1,2,3}",
      len(cosets) == 197 and all(4 * k + x in V0set for k in cosets for x in range(4)))
check("`cosets` and `steps` of matrix_certificate.json are as described",
      certificate["cosets"] == cosets and set(certificate["steps"]) == S
      and len(certificate["steps"]) == 22)
edges = {(u, v) for u in V0 for v in V0 if u < v and u ^ v in S}
check("F_0 has 7180 edges", len(edges) == 7180)

# vertex (i, x) has coordinate 4 * cosets[i] + x and position 4 * i + x in increasing order
position = {4 * k + x: 4 * i + x for i, k in enumerate(cosets) for x in range(4)}
check("increasing order of coordinates is the order of the pairs (i, x)",
      [position[v] for v in V0] == list(range(788)))

# --- orbits ----------------------------------------------------------------------------
specs = [tuple(spec) for spec in certificate["specs"]]
weights = certificate["integer_weights"]
diag = [s for s in specs if s[0] == "diag"]
edge = [s for s in specs if s[0] == "edge"]
check("197 vertex orbits, 1992 edge orbits, 2189 integer weights",
      len(diag) == 197 and len(edge) == 1992 and len(weights) == 2189
      and len(specs) == 2189 and all(type(w) is int for w in weights))
check("the vertex orbits are (diag, i, i, 0) for i = 0..196",
      sorted(diag) == [("diag", i, i, 0) for i in range(197)])
orbit_of = {}
for kind, i, j, z in edge:
    orbit = frozenset(frozenset((4 * cosets[i] + x, 4 * cosets[j] + (x ^ z))) for x in range(4))
    for e in orbit:
        orbit_of.setdefault(e, set()).add(orbit)
check("the edge orbits in `specs` are exactly the orbits of {0,1,2,3} on E(F_0)",
      all(i <= j for _, i, j, _ in edge)
      and set(orbit_of) == {frozenset(e) for e in edges}
      and all(len(orbits) == 1 for orbits in orbit_of.values())
      and len({o for orbits in orbit_of.values() for o in orbits}) == 1992)

# --- the matrix M_0 ------------------------------------------------------------------------
n = 788
M = [dict() for _ in range(n)]


def add(u, v, value):
    M[u][v] = M[u].get(v, 0) + value


for (kind, i, j, z), weight in zip(specs, weights):
    for x in range(4):
        if kind == "diag":
            add(4 * i + x, 4 * i + x, weight)
        else:
            add(4 * i + x, 4 * j + (x ^ z), weight)
            if i != j:
                add(4 * j + (x ^ z), 4 * i + x, weight)
check("M_0 is symmetric",
      all(M[v].get(u, 0) == value for u in range(n) for v, value in M[u].items()))
check("M_0 is supported on F_0",
      all(u == v or value == 0 or V0[u] ^ V0[v] in S
          for u in range(n) for v, value in M[u].items()))
K = [[[M[4 * i].get(4 * j + z, 0) for j in range(197)] for i in range(197)] for z in range(4)]
check("(M_0)_{(i,x),(j,y)} = K_{x+y}(i,j)  (equation (24))",
      all(M[4 * i + x].get(4 * j + y, 0) == K[x ^ y][i][j]
          for i in range(197) for j in range(197) for x in range(4) for y in range(4)))
check("the four matrices K_z are symmetric",
      all(K[z][i][j] == K[z][j][i] for z in range(4) for i in range(197) for j in range(197)))

# --- positivity of the Fourier blocks --------------------------------------------------------
q = gram["scale"]
factors = gram["lower_triangular_integer_factors"]
check("q = 10^6, four lower-triangular integer factors with rows of length r + 1",
      type(q) is int and q == 10 ** 6 and len(factors) == 4
      and all(len(L) == 197 and all(len(L[r]) == r + 1 for r in range(197)) for L in factors)
      and all(type(x) is int for L in factors for row in L for x in row))
for a in range(4):                       # a = a_0 + 2 a_1, z = z_0 + 2 z_1
    sign = [(-1) ** bin(a & z).count("1") for z in range(4)]
    block = [[sum(sign[z] * K[z][i][j] for z in range(4)) for j in range(197)] for i in range(197)]
    L = factors[a]
    residual = [[0] * 197 for _ in range(197)]
    for i in range(197):
        for j in range(i + 1):
            value = q * q * block[i][j] - sum(L[i][k] * L[j][k] for k in range(j + 1))
            residual[i][j] = residual[j][i] = value
    slack = min(residual[i][i] - sum(abs(residual[i][j]) for j in range(197) if j != i)
                for i in range(197))
    check("block a = %d: the residual is diagonally dominant (26); least slack %d" % (a, slack),
          slack >= 0)

# --- totals ---------------------------------------------------------------------------------------
trace = sum(M[u].get(u, 0) for u in range(n))
total = sum(sum(row.values()) for row in M)
check("tr M_0 = 400025192 and sum(M_0) = 1202501792  (22)",
      trace == 400025192 and total == 1202501792)
check("394 sum(M_0) - 1184 tr M_0 = 155878720 > 0  (23)",
      394 * total - 1184 * trace == 155878720)
check("|V(G_0)| = 310472, |V(G'_0)| = 310317, |V(H_0)| = 934177, c_0 = 1184",
      788 * 394 == 310472 and 310472 - 155 == 310317
      and 789 * 1184 + 1 == 934177 and 3 * 394 + 2 == 1184)

# --- the second example -------------------------------------------------------------------------------
congruence = instance["diagonal_congruence"]
fibers = instance["fibers"]
check("Table 1 equals the exceptions of `diagonal_congruence`; the default weight is 74",
      congruence["default"] == 74
      and {int(k): v for k, v in congruence["exceptions"].items()} == TABLE_1)
check("`fibers`: s_v = 239 at the coordinate 996 and 394 otherwise",
      fibers["default"] == 394 and {int(k): v for k, v in fibers["exceptions"].items()} == {996: 239})
w = [TABLE_1.get(v, 74) for v in V0]
s = [239 if v == 996 else 394 for v in V0]
check("|V(G'_0)| is the sum of the fiber sizes", sum(s) == 310317)
lifted_sum = sum(s[u] * s[v] * w[u] * value * w[v] for u in range(n) for v, value in M[u].items())
lifted_trace = sum(s[u] * w[u] * w[u] * M[u].get(u, 0) for u in range(n))
check("sum(M-tilde) = 1020438226912198088 and tr M-tilde = 861856598314848",
      lifted_sum == 1020438226912198088 and lifted_trace == 861856598314848)
check("sum(M-tilde) - 1184 tr M-tilde = 14507418056 > 0",
      lifted_sum - 1184 * lifted_trace == 14507418056)

print()
if FAILED:
    raise SystemExit("FAILED: " + "; ".join(FAILED))
print("ALL CHECKS PASSED")
