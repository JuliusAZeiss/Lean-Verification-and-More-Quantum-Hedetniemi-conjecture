#!/usr/bin/env python3
"""Portable exact finite-certificate verifier. Python 3.9+, standard library only.

The general operator/gadget theorem remains an analytical dependency; this
program is not a Lean proof of the resulting quantum-coloring separation.
No assert statements, floating arithmetic, NumPy, or prior research imports.
"""
import argparse
import copy
from fractions import Fraction
import gzip
import hashlib
import json
from pathlib import Path


class VerificationError(Exception):
    pass


def require(condition, message):
    if not condition:
        raise VerificationError(message)


def exact_keys(value, names, where):
    require(type(value) is dict, where + " must be an object")
    require(set(value) == set(names), where + " has missing or unexpected keys")


def integer(value, where, minimum=None, maximum=None):
    require(type(value) is int, where + " must be an integer, not a boolean")
    require(minimum is None or value >= minimum, where + " is too small")
    require(maximum is None or value <= maximum, where + " is too large")
    return value


def integer_list(value, where, minimum=None, maximum=None):
    require(type(value) is list, where + " must be a list")
    return [integer(x, where + " entry", minimum, maximum) for x in value]


def unique_json_object(pairs):
    result = {}
    for key, value in pairs:
        require(key not in result, "duplicate JSON key: " + key)
        result[key] = value
    return result


def reject_json_constant(value):
    raise VerificationError("nonfinite JSON constant: " + value)


def read_json(path, compressed=False):
    opener = gzip.open if compressed else open
    with opener(path, "rt", encoding="utf-8") as handle:
        return json.load(handle, object_pairs_hook=unique_json_object,
                         parse_constant=reject_json_constant)


def local_file(directory, name):
    require(type(name) is str and name not in ("", ".", ".."), "invalid data filename")
    require(Path(name).name == name and "/" not in name and "\\" not in name,
            "data filenames must name a file within the bundle")
    path = directory / name
    require(path.is_file(), "missing data file: " + name)
    return path


def parent_generators():
    # Polynomial x^11+x^9+x^7+x^6+x^5+x+1; XOR is polynomial subtraction.
    generators = []
    for power in range(1, 23):
        remainder = 1 << power
        while remainder.bit_length() > 11:
            remainder ^= 0xAE3 << (remainder.bit_length() - 12)
        generators.append(remainder >> 1)
    require(len(set(generators)) == 22 and 0 not in generators,
            "parent must have 22 distinct nonzero generators")
    pairs = {s ^ t for s in generators for t in generators}
    require(set(generators).isdisjoint(pairs), "parent has a closed three-step walk")
    require(not any((s ^ p) in pairs for s in generators for p in pairs),
            "parent has a closed five-step walk")
    return generators


def validate_instance(instance):
    exact_keys(instance, ["schema_version", "certificate_file", "gram_file",
                         "vertex_selection", "fibers", "diagonal_congruence", "colors", "expected"], "instance")
    require(integer(instance["schema_version"], "instance schema") == 2, "unsupported instance schema")
    selection = instance["vertex_selection"]
    require(type(selection) is dict and "kind" in selection, "invalid vertex selection")
    if selection["kind"] == "all":
        exact_keys(selection, ["kind"], "vertex selection")
    else:
        exact_keys(selection, ["kind", "coordinates"], "vertex selection")
        require(selection["kind"] == "explicit", "unknown vertex selection")
        coordinates = integer_list(selection["coordinates"], "selected coordinates", 0, 1023)
        require(coordinates and len(set(coordinates)) == len(coordinates), "empty/duplicate selected coordinates")
    exact_keys(instance["fibers"], ["default", "exceptions"], "fibers")
    integer(instance["fibers"]["default"], "default fiber size", 1)
    require(type(instance["fibers"]["exceptions"]) is dict, "fiber exceptions must be an object")
    for key, value in instance["fibers"]["exceptions"].items():
        require(type(key) is str and key.isascii() and key.isdecimal()
                and str(int(key)) == key, "fiber coordinate must be a canonical nonnegative integer string")
        integer(int(key), "fiber coordinate", 0, 1023)
        integer(value, "exceptional fiber size", 1)
    congruence = instance["diagonal_congruence"]
    exact_keys(congruence, ["default", "exceptions"], "diagonal congruence")
    integer(congruence["default"], "default congruence weight")
    require(type(congruence["exceptions"]) is dict, "congruence exceptions must be an object")
    for key, value in congruence["exceptions"].items():
        require(type(key) is str and key.isascii() and key.isdecimal()
                and str(int(key)) == key, "congruence coordinate must be a canonical nonnegative integer string")
        integer(int(key), "congruence coordinate", 0, 1023)
        integer(value, "exceptional congruence weight")
    integer(instance["colors"], "colors", 1)
    expected_keys = ["base_vertices", "first_factor_vertices", "second_factor_vertices",
                     "certificate_trace", "certificate_entry_sum", "lifted_numerator",
                     "lifted_denominator", "strict_gap_numerator"]
    exact_keys(instance["expected"], expected_keys, "expected results")
    for key in expected_keys:
        integer(instance["expected"][key], "expected " + key, 1)


def reconstruct_certificate(certificate):
    exact_keys(certificate, ["schema_version", "rank", "cosets", "basis", "steps",
                            "specs", "integer_weights"], "matrix certificate")
    require(integer(certificate["schema_version"], "certificate schema") == 1,
            "unsupported matrix schema")
    rank = integer(certificate["rank"], "translation rank", 0, 10)
    order = 1 << rank
    basis = integer_list(certificate["basis"], "basis", 1, 1023)
    require(len(basis) == 10, "basis must have ten vectors")
    decoded = []
    for coordinate in range(1024):
        original = 0
        for bit, vector in enumerate(basis):
            if (coordinate >> bit) & 1:
                original ^= vector
        decoded.append(original)
    require(len(set(decoded)) == 1024, "coordinate basis is linearly dependent")
    encoded = {original: coordinate for coordinate, original in enumerate(decoded)}
    generators = parent_generators()
    steps = integer_list(certificate["steps"], "coordinate generators", 1, 1023)
    require(len(steps) == 22 and set(steps) == {encoded[s] for s in generators},
            "coordinate generators do not match the reconstructed parent")
    cosets = integer_list(certificate["cosets"], "cosets", 0, 1024 // order - 1)
    require(cosets and len(set(cosets)) == len(cosets), "empty or duplicate cosets")
    k, n = len(cosets), len(cosets) * order
    coordinates = [q * order + x for q in cosets for x in range(order)]
    original_vertices = [decoded[v] for v in coordinates]
    specs, weights = certificate["specs"], certificate["integer_weights"]
    require(type(specs) is list, "specs must be a list")
    weights = integer_list(weights, "matrix weights")
    require(len(specs) == len(weights), "spec and weight counts differ")
    rows, seen, diagonal_specs = [{} for _ in range(n)], set(), set()
    for spec, weight in zip(specs, weights):
        require(type(spec) is list and len(spec) == 4, "invalid matrix orbit specification")
        kind, i, j, shift = spec
        require(kind in ("diag", "edge"), "unknown matrix orbit kind")
        integer(i, "orbit row", 0, k - 1)
        integer(j, "orbit column", i, k - 1)
        integer(shift, "orbit shift", 0, order - 1)
        require(tuple(spec) not in seen, "duplicate matrix orbit")
        seen.add(tuple(spec))
        if kind == "diag":
            require(i == j and shift == 0, "diagonal orbit is not diagonal")
            diagonal_specs.add(i)
        else:
            require(((cosets[i] ^ cosets[j]) * order + shift) in steps,
                    "matrix orbit is not an actual graph edge")
        for x in range(order):
            u, v = i * order + x, j * order + (x ^ shift)
            rows[u][v] = rows[u].get(v, 0) + weight
            if i != j:
                rows[v][u] = rows[v].get(u, 0) + weight
    require(diagonal_specs == set(range(k)), "a diagonal orbit is missing")
    for u, row in enumerate(rows):
        for v, value in row.items():
            require(rows[v].get(u, 0) == value, "matrix is not symmetric")
            require(value == 0 or u == v or original_vertices[u] ^ original_vertices[v] in generators,
                    "matrix has an unsupported off-diagonal entry")
            for translation in range(order):
                tu = (u // order) * order + ((u % order) ^ translation)
                tv = (v // order) * order + ((v % order) ^ translation)
                require(rows[tu].get(tv, 0) == value, "matrix is not translation invariant")
    return rank, order, k, coordinates, steps, rows


def verify_fourier_gram(order, k, rows, gram):
    exact_keys(gram, ["schema_version", "scale", "lower_triangular_integer_factors"], "Gram certificate")
    require(integer(gram["schema_version"], "Gram schema") == 1, "unsupported Gram schema")
    scale = integer(gram["scale"], "Gram scale", 1)
    factors = gram["lower_triangular_integer_factors"]
    require(type(factors) is list and len(factors) == order, "wrong number of Gram factors")
    characters = [[-1 if bin(a & x).count("1") % 2 else 1 for x in range(order)]
                  for a in range(order)]
    for x in range(order):
        for y in range(order):
            require(sum(characters[a][x] * characters[a][y] for a in range(order))
                    == (order if x == y else 0), "character completeness failed")
    margins = []
    for a in range(order):
        block = [[sum(rows[i * order].get(j * order + z, 0) * characters[a][z]
                      for z in range(order)) for j in range(k)] for i in range(k)]
        require(all(block[i][j] == block[j][i] for i in range(k) for j in range(k)),
                "Fourier block is not symmetric")
        # Exact intertwining on every matrix row; this checks the claimed
        # Fourier decomposition, beyond just constructing candidate blocks.
        for u, row in enumerate(rows):
            actual = [0] * k
            for v, weight in row.items():
                actual[v // order] += weight * characters[a][v % order]
            expected = [characters[a][u % order] * entry for entry in block[u // order]]
            require(actual == expected, "Fourier intertwining failed")
        factor = factors[a]
        require(type(factor) is list and len(factor) == k, "wrong Gram factor dimension")
        for i, row in enumerate(factor):
            integer_list(row, "Gram factor row")
            require(len(row) == i + 1, "Gram factor must be lower triangular")
        residual_diagonal, absolute_row_sums = [0] * k, [0] * k
        for i in range(k):
            for j in range(i, k):
                dot = sum(factor[i][h] * factor[j][h] for h in range(i + 1))
                residual = scale * scale * block[i][j] - dot
                if i == j:
                    residual_diagonal[i] = residual
                else:
                    absolute_row_sums[i] += abs(residual)
                    absolute_row_sums[j] += abs(residual)
        margin = min(residual_diagonal[i] - absolute_row_sums[i] for i in range(k))
        require(margin > 0, "Gram residual is not strictly positively diagonally dominant")
        margins.append(margin)
    return margins


def verify_data(instance, certificate, gram):
    validate_instance(instance)
    rank, order, k, coordinates, steps, rows = reconstruct_certificate(certificate)
    margins = verify_fourier_gram(order, k, rows, gram)
    full_trace = sum(rows[v].get(v, 0) for v in range(len(rows)))
    full_sum = sum(sum(row.values()) for row in rows)
    require(full_trace > 0, "matrix trace is not positive")
    selected = instance["vertex_selection"]
    retained = set(coordinates if selected["kind"] == "all" else selected["coordinates"])
    require(retained <= set(coordinates), "selected vertex is absent from the certified matrix")
    kept = [i for i, v in enumerate(coordinates) if v in retained]
    renumber = {v: i for i, v in enumerate(kept)}
    active_rows = [{renumber[v]: weight for v, weight in rows[u].items() if v in renumber}
                   for u in kept]
    active_coordinates = [coordinates[v] for v in kept]
    n = len(kept)
    retained_trace = sum(active_rows[v].get(v, 0) for v in range(n))
    retained_sum = sum(sum(row.values()) for row in active_rows)
    require(retained_trace > 0, "retained principal matrix trace is not positive")
    # A principal restriction followed by D M D remains PSD. Integer weights
    # can be negative or zero: the positive lifted trace is checked below.
    congruence = instance["diagonal_congruence"]
    weights_by_coordinate = {int(v): w for v, w in congruence["exceptions"].items()}
    require(set(weights_by_coordinate) <= retained, "congruence weight is outside the retained graph")
    weights = [weights_by_coordinate.get(v, congruence["default"]) for v in active_coordinates]
    active_rows = [{v: entry * weights[u] * weights[v] for v, entry in row.items()}
                   for u, row in enumerate(active_rows)]
    congruence_trace = sum(active_rows[v].get(v, 0) for v in range(n))
    congruence_sum = sum(sum(row.values()) for row in active_rows)
    exceptions = {int(v): s for v, s in instance["fibers"]["exceptions"].items()}
    require(set(exceptions) <= retained, "exceptional fiber is outside the retained graph")
    sizes = [exceptions.get(v, instance["fibers"]["default"]) for v in active_coordinates]
    denominator = sum(active_rows[v].get(v, 0) * sizes[v] for v in range(n))
    numerator = sum(weight * sizes[u] * sizes[v]
                    for u, row in enumerate(active_rows) for v, weight in row.items())
    colors = instance["colors"]
    require(denominator > 0, "lifted trace is not positive")
    strict_gap = numerator - colors * denominator
    require(strict_gap > 0, "supported PSD lower bound does not exceed product colors")
    index = {v: i for i, v in enumerate(active_coordinates)}
    neighbors = [{index[v ^ step] for step in steps if v ^ step in index}
                 for v in active_coordinates]
    e_values, o_values = [], []
    for i in range(n):
        even = {i} | {w for v in neighbors[i] for w in neighbors[v]}
        odd = neighbors[i]
        require(even.isdisjoint(odd), "even and odd local regions overlap")
        require(all(neighbors[v].isdisjoint(even) for v in even), "even local region is not independent")
        require(all(neighbors[v].isdisjoint(odd) for v in odd), "odd local region is not independent")
        far = set(range(n)) - even - odd
        require(all(neighbors[v].isdisjoint(far) for v in odd), "odd-to-far edge exists")
        e = max(sizes[v] for v in even)
        o = max([sizes[v] for v in odd] + [0])
        require(colors >= 2 * e + o + 2 and colors >= n + e + 1,
                "generalized gadget palette capacity is insufficient")
        e_values.append(e)
        o_values.append(o)
    first_count = sum(sizes)
    second_count = colors + 1 + sum(2 * e + o + 2 for e, o in zip(e_values, o_values))
    actual = dict(base_vertices=n, first_factor_vertices=first_count,
                  second_factor_vertices=second_count, certificate_trace=full_trace,
                  certificate_entry_sum=full_sum, lifted_numerator=numerator,
                  lifted_denominator=denominator, strict_gap_numerator=strict_gap)
    require(actual == instance["expected"], "computed results differ from the declared instance")
    beta = Fraction(numerator, denominator)
    return dict(status="EXACT FINITE CERTIFICATE VERIFIED", model="projective quantum coloring",
                lean_executed_by_this_program=False, general_operator_gadget_proof="analytical dependency, not checked by this program",
                parent_vertices=1024, parent_degree=22, parent_no_closed_walk_three_or_five=True,
                full_matrix_vertices=len(rows), translation_rank=rank,
                retained_matrix_trace=retained_trace, retained_matrix_entry_sum=retained_sum,
                congruence_matrix_trace=congruence_trace, congruence_matrix_entry_sum=congruence_sum,
                diagonal_congruence_verified=True,
                fourier_blocks=order, fourier_block_size=k,
                fourier_character_completeness=True, fourier_intertwining_rows=order * len(rows),
                gram_residual_margins=margins, graph_colors=colors,
                quantum_first_lower=-(-beta.numerator // beta.denominator),
                quantum_second_exact=colors + 1, lifted_ratio=str(beta),
                strict_gap=str(Fraction(strict_gap, denominator)),
                local_even_capacities=sorted(set(e_values)),
                local_odd_capacities=sorted(set(o_values)), **actual)


def tamper_tests(instance, certificate, gram):
    passed = []

    def rejects(name, change):
        i, c, g = copy.deepcopy(instance), copy.deepcopy(certificate), copy.deepcopy(gram)
        change(i, c, g)
        try:
            verify_data(i, c, g)
        except VerificationError:
            passed.append(name)
            return
        raise VerificationError("tamper test was incorrectly accepted: " + name)

    rejects("dependent_coordinate_basis", lambda i, c, g: c["basis"].__setitem__(1, c["basis"][0]))
    rejects("wrong_parent_generator", lambda i, c, g: c["steps"].__setitem__(0, 0))
    rejects("boolean_instead_of_integer", lambda i, c, g: c["integer_weights"].__setitem__(0, True))

    def unsupported_edge(i, c, g):
        target = next(s for s in c["specs"] if s[0] == "edge")
        target[2] = target[1]
        target[3] = 0
    rejects("unsupported_matrix_edge", unsupported_edge)
    rejects("corrupted_gram_factor", lambda i, c, g:
            g["lower_triangular_integer_factors"][0][0].__setitem__(0, 10**30))

    def zero_fiber(i, c, g):
        coordinate = str(c["cosets"][0] * (1 << c["rank"]))
        i["fibers"]["exceptions"][coordinate] = 0
    rejects("zero_fiber", zero_fiber)
    rejects("boolean_congruence_weight", lambda i, c, g:
            i["diagonal_congruence"].__setitem__("default", True))
    rejects("zero_congruence", lambda i, c, g:
            i.__setitem__("diagonal_congruence", {"default": 0, "exceptions": {}}))
    def scaled_congruence(i, c, g):
        old = i["diagonal_congruence"]
        i["diagonal_congruence"] = {"default": 2 * old["default"],
                                    "exceptions": {v: 2 * w for v, w in old["exceptions"].items()}}
    rejects("incorrect_congruence", scaled_congruence)
    rejects("missing_strict_separation", lambda i, c, g: i.__setitem__("colors", 10**12))
    rejects("incorrect_factor_order", lambda i, c, g:
            i["expected"].__setitem__("first_factor_vertices", i["expected"]["first_factor_vertices"] + 1))
    try:
        json.loads('{"a":1,"a":2}', object_pairs_hook=unique_json_object)
    except VerificationError:
        passed.append("duplicate_json_keys")
    else:
        raise VerificationError("duplicate JSON keys were incorrectly accepted")
    return passed


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--instance", type=Path, default=Path(__file__).with_name("instance.json"))
    parser.add_argument("--skip-tamper-tests", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    try:
        instance = read_json(args.instance)
        validate_instance(instance)
        certificate_path = local_file(args.instance.parent, instance["certificate_file"])
        gram_path = local_file(args.instance.parent, instance["gram_file"])
        certificate, gram = read_json(certificate_path), read_json(gram_path, compressed=True)
        result = verify_data(instance, certificate, gram)
        result["tamper_tests_rejected"] = ([] if args.skip_tamper_tests else tamper_tests(instance, certificate, gram))
        result["sha256_identification_only"] = {path.name: hashlib.sha256(path.read_bytes()).hexdigest()
                                                for path in [args.instance, certificate_path, gram_path]}
        output = args.output or args.instance.with_name("verification_result.json")
        output.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
        print(json.dumps(result, indent=2))
        print("Finite integer certificate passed. This program does not run Lean; use ../lean/check.py for the complete formal proof.")
    except (VerificationError, OSError, ValueError, TypeError, KeyError, StopIteration) as exc:
        parser.exit(1, "VERIFICATION FAILED: " + str(exc) + "\n")


if __name__ == "__main__":
    main()
