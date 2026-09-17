#!/usr/bin/env python3
"""Exact finite checks for the paper's 1024-vertex regular base.

Uses Python integers only. This program does not execute Lean and does not
check the abstract operator or product-coloring proofs.
"""
import hashlib
import json
from collections import Counter
from pathlib import Path

GENERATORS = (
    1, 2, 4, 8, 16, 31, 32, 64, 128, 245, 256, 371,
    431, 457, 512, 619, 697, 711, 805, 861, 915, 1022,
)


def convolution(f, g):
    result = Counter()
    for x, a in f.items():
        for y, b in g.items():
            result[x ^ y] += a * b
    return {x: a for x, a in result.items() if a}


def verify(generators=GENERATORS, scale=4096, coefficient=112, colors=1538):
    if colors != 3 * 512 + 2:
        raise ValueError("The gadget parameter must equal 3 times the fiber size plus 2.")
    if len(generators) != 22 or len(set(generators)) != 22:
        raise ValueError("The generator list must contain 22 distinct elements.")
    if any(type(x) is not int or not 0 < x < 1024 for x in generators):
        raise ValueError("The generators must be nonzero 10-bit integers.")
    S = set(generators)
    pair = {x ^ y for x in S for y in S}
    triple = {x ^ y for x in pair for y in S}
    if S & pair or pair & triple:
        raise ValueError("A forbidden odd closed walk was detected.")

    a = {x: 1 for x in S}
    m = {**a, 0: 10}
    r = convolution(a, a)
    r[0] = r.get(0, 0) - 180
    for x in S:
        r[x] = r.get(x, 0) - 8
    r = {x: v for x, v in r.items() if v}
    r_piecewise = {x: (-158 if x == 0 else -8 if x in S
                       else 2 if x in pair else 0) for x in range(1024)}
    if any(r.get(x, 0) != r_piecewise[x] for x in range(1024)):
        raise ValueError("The polynomial and piecewise residuals differ.")

    for x in range(1024):
        cubic = sum(r.get(x ^ s, 0) for s in S) + 14 * r.get(x, 0) + 240 * m.get(x, 0)
        if cubic != 12:
            raise ValueError("The sparse cubic identity fails at x=" + str(x))

    r2, m2 = convolution(r, r), convolution(m, m)
    for x in range(1024):
        if r2.get(x, 0) + coefficient * m2.get(x, 0) != scale * m.get(x, 0):
            raise ValueError("The sum-of-squares identity fails at x=" + str(x))
    trace = 1024 * m[0]
    entry_sum = 1024 * sum(m.values())
    gap = 512 * entry_sum - colors * trace
    if gap <= 0:
        raise ValueError("The matrix bound does not exclude this color count.")
    return {
        "base_order": 1024, "base_degree": len(S), "fiber_size": 512,
        "product_colors": colors, "first_factor_order": 1024 * 512,
        "second_factor_order": colors + 1 + 1024 * colors,
        "matrix_trace": trace, "matrix_entry_sum": entry_sum,
        "strict_gap": gap, "xor_identities_checked": 1024,
        "sparse_cubic_identities_checked": 1024,
        "polynomial_residual_equals_piecewise_residual": True,
    }


def main():
    result = verify()
    damaged = [
        {"generators": (0,) + GENERATORS[1:]},
        {"generators": (2,) + GENERATORS[1:]},
        {"generators": (3,) + GENERATORS[1:]},
        {"scale": 4095},
        {"coefficient": 111},
        {"colors": 1639},
    ]
    for kwargs in damaged:
        try:
            verify(**kwargs)
        except ValueError:
            continue
        raise RuntimeError("A deliberately damaged input was accepted: " + str(kwargs))
    result.update({
        "status": "INTEGER_CHECKS_PASSED",
        "lean_executed_by_this_program": False,
        "rejection_tests_passed": len(damaged),
        "checker_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "scope": "Regular base, exact matrix identity, totals and graph-order arithmetic.",
    })
    destination = Path(__file__).with_name("regular_verification_result.json")
    destination.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
