#!/usr/bin/env python3
"""Exact comparison of the integer data embedded in the Lean sources with data/*.json.

Lean does not read the JSON files. The Lean theorems about the certificate of
Appendix A are statements about integer literals in the Lean sources. This script
decodes these literals from the source text and compares them, entry by entry,
with the matrices obtained from data/matrix_certificate.json and
data/gram_certificate.json.gz as described in the paper. It does not run Lean.
It uses Python integers only and no third-party packages.

Compared objects:
  * `stepData` (SmallGraphs.lean) and the set S (`steps`);
  * `cosetData` (SmallGraphs.lean) and the list `cosets`;
  * `kernelData0..3` (CertificateData.lean) and the four matrices K_z that are
    built from `specs` and `integer_weights`;
  * `blockData0..3` and the Fourier blocks K-hat_a = sum_z (-1)^(a.z) K_z;
  * `factorData0..3` and the lower-triangular factors L_a;
  * the 788 lists `factorRow<a>_<i>` (CertificateFactorB*P*.lean), which the
    positivity proof uses, their lookup trees (CertificateFactors.lean), and L_a;
  * `coordinateWeight` (CertificateGraph.lean) and `fiberSize` (SmallGraphs.lean)
    against `diagonal_congruence` and `fibers` of data/instance.json.

Decoding rules, as defined in CertificateData.lean:
  NatLookupTree.get: at a branch, take the left subtree if the index is even and
  the right subtree otherwise, and continue with the index divided by 2;
  unpackEntry x j = ((x / 2^(32 j)) mod 2^32) - 2^31;
  factorEntryN a i j = 0 for j > i;
  sourceMatrixInt u v = kernelEntryN (u mod 4 xor v mod 4) (u / 4) (v / 4), which
  is equation (24) of the paper with the vertex (i, x) at position 4 i + x.
"""
import gzip
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ROUND4 = ROOT / "lean" / "Hedetniemi" / "Round4"
DATA = ROOT / "data"
FAILED = []


def check(name, condition):
    print(("ok    " if condition else "FAIL  ") + name)
    if not condition:
        FAILED.append(name)


def find(pattern, text, what):
    match = re.search(pattern, text)
    if match is None:
        raise SystemExit("FAILED: cannot find %s in the Lean sources" % what)
    return match.group(1)


def expect(condition):
    if not condition:
        raise SystemExit("FAILED: malformed lookup tree in the Lean sources")


def parse_tree(text, leaf_pattern):
    tokens = re.findall(r"\(|\)|\.branch|\.leaf|" + leaf_pattern, text)
    position = 0

    def node():
        nonlocal position
        expect(tokens[position] == "(")
        position += 1
        if tokens[position] == ".leaf":
            value = tokens[position + 1]
            position += 2
        else:
            expect(tokens[position] == ".branch")
            position += 1
            value = (node(), node())
        expect(tokens[position] == ")")
        position += 1
        return value

    tree = node()
    expect(position == len(tokens))
    return tree


def lookup(tree, index):
    while isinstance(tree, tuple):
        tree = tree[0] if index % 2 == 0 else tree[1]
        index //= 2
    return tree


def unpack(x, j):
    return ((x >> (32 * j)) % 4294967296) - 2147483648


certificate = json.loads((DATA / "matrix_certificate.json").read_text(encoding="utf-8"))
instance = json.loads((DATA / "instance.json").read_text(encoding="utf-8"))
with gzip.open(DATA / "gram_certificate.json.gz", "rt", encoding="utf-8") as stream:
    gram = json.load(stream)
cosets = certificate["cosets"]
k = len(cosets)

# --- generators, cosets, weights, fiber sizes ---------------------------------------------
small = (ROUND4 / "SmallGraphs.lean").read_text(encoding="utf-8")
steps = [int(x) for x in find(r"def stepData : Array ℕ := #\[([^\]]*)\]", small, "stepData").split(",")]
check("stepData is the set S of the paper (22 elements)",
      len(steps) == 22 and sorted(steps) == sorted(certificate["steps"]))
coset_data = [int(x) for x in
              find(r"def cosetData : Array \(Fin 256\) := #\[([^\]]*)\]", small, "cosetData").split(",")]
check("cosetData equals `cosets` (197 values)", coset_data == cosets and k == 197)
check("fiberSize: 239 at the coordinate 996 and 394 otherwise",
      "if baseCoordinate v = 996 then 239 else 394" in small
      and instance["fibers"] == {"default": 394, "exceptions": {"996": 239}})

graph = (ROUND4 / "CertificateGraph.lean").read_text(encoding="utf-8")
body = graph[graph.index("def coordinateWeight"):graph.index("def integerWeight")]
lean_weights = {}
for n, value in re.findall(r"if n = (\d+) then (\d+)", body):
    lean_weights[int(n)] = int(value)
for members, value in re.findall(r"if n ∈ \(\[([\d,]+)\] : List ℕ\) then (\d+)", body):
    for n in members.split(","):
        lean_weights[int(n)] = int(value)
default = int(find(r"else (\d+)\s*$", body.strip(), "the default weight"))
congruence = instance["diagonal_congruence"]
check("coordinateWeight equals `diagonal_congruence` (default 74, twenty exceptions)",
      default == congruence["default"] == 74 and len(lean_weights) == 20
      and lean_weights == {int(key): value for key, value in congruence["exceptions"].items()})

# --- packed matrices in CertificateData.lean -------------------------------------------------
source = (ROUND4 / "CertificateData.lean").read_text(encoding="utf-8")
check("the decoding rules in CertificateData.lean are the ones implemented here",
      "| .leaf v, _ => v" in source
      and "if i % 2 = 0 then l.get (i / 2) else r.get (i / 2)" in source
      and "Int.ofNat ((x / 2^(32*j)) % 4294967296) - 2147483648" in source
      and ("def factorEntryN (a i j : Nat) : Int := "
           "if j ≤ i then unpackEntry ((factorData a).get i) j else 0") in source
      and ("def sourceMatrixInt (u v : Fin 788) : Int := kernelEntryN "
           "(Nat.xor (u.val % 4) (v.val % 4)) (u.val / 4) (v.val / 4)") in source)
packed = {}
for name in ("kernelData", "blockData", "factorData"):
    for a in range(4):
        text = find(r"def %s%d : NatLookupTree := (.*)" % (name, a), source, "%s%d" % (name, a))
        tree = parse_tree(text, r"\d+")
        packed[name, a] = [[unpack(int(lookup(tree, i)), j) for j in range(k)] for i in range(k)]

K = [[[0] * k for _ in range(k)] for _ in range(4)]
for (kind, i, j, z), weight in zip(certificate["specs"], certificate["integer_weights"]):
    if kind == "diag":
        K[0][i][i] += weight
    else:
        K[z][i][j] += weight
        if i != j:
            K[z][j][i] += weight
check("kernelData0..3 equal the matrices K_z built from the orbit weights",
      all(packed["kernelData", z] == K[z] for z in range(4)))
blocks = [[[sum((-1) ** bin(a & z).count("1") * K[z][i][j] for z in range(4))
            for j in range(k)] for i in range(k)] for a in range(4)]
check("blockData0..3 equal the Fourier blocks K-hat_a",
      all(packed["blockData", a] == blocks[a] for a in range(4)))
factors = gram["lower_triangular_integer_factors"]
check("factorData0..3 equal the factors L_a (entries above the diagonal are not used)",
      all(packed["factorData", a][i][j] == factors[a][i][j]
          for a in range(4) for i in range(k) for j in range(i + 1)))
check("the Gram scale in CertificateData.lean is q^2 = 10^12",
      "1000000000000 * blockEntryN a i j" in source
      and type(gram["scale"]) is int and gram["scale"] == 10 ** 6)

# --- the 788 factor rows used by the positivity proof ------------------------------------------
rows = {}
for path in sorted(ROUND4.glob("CertificateFactorB*P*.lean")):
    for match in re.finditer(r"def (factorRow\d_\d+) : List Int := \[([^\]]*)\]",
                             path.read_text(encoding="utf-8")):
        rows[match.group(1)] = [int(x) for x in match.group(2).split(",")]
check("there are 788 lists factorRow<a>_<i>", len(rows) == 4 * k)
tree_source = (ROUND4 / "CertificateFactors.lean").read_text(encoding="utf-8")
rows_ok = True
for a in range(4):
    text = find(r"def factorListTree%d : FactorListTree := (.*)" % a, tree_source, "factorListTree%d" % a)
    tree = parse_tree(text.replace("([] : List Int)", "EMPTY"), r"factorRow\d_\d+|EMPTY")
    for i in range(k):
        name = lookup(tree, i)
        rows_ok = rows_ok and name == "factorRow%d_%d" % (a, i) and rows[name] == factors[a][i]
check("factorListTree0..3 select the rows of L_a, and the lists equal these rows", rows_ok)

print()
if FAILED:
    raise SystemExit("FAILED: " + "; ".join(FAILED))
print("ALL CHECKS PASSED")
