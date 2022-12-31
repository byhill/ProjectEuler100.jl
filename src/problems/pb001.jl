export problem001


"""
    problem001()

Problem 001 of Project Euler.

https://projecteuler.net/problem=001

Recall that

    ∑{k = 1}^n = 1 + 2 + ... + (n - 1) + n = n * (n + 1) ÷ 2.

Then use the inclusion-exclusion principle.
"""
function problem001(N::Integer=1000)
    N -= 1
    return 3sumto(N ÷ 3) + 5sumto(N ÷ 5) - 15sumto(N ÷ 15)
end
