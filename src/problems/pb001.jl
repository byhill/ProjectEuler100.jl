export problem001


"""
    problem001()

Problem 001 of Project Euler.

https://projecteuler.net/problem=001

Recall that

    ∑{k = 1}^n = 1 + 2 + ... + (n - 1) + n = n * (n + 1) ÷ 2.

Then use the inclusion-exclusion principle.
"""
function problem001(n::Integer=1000)
    n -= 1
    return 3sumto(n ÷ 3) + 5sumto(n ÷ 5) - 15sumto(n ÷ 15)
end
