module Problem001

using ..ProjectEulerLibrary


"""
    problem001()

Problem 001 of Project Euler.

https://projecteuler.net/problem=001

Recall that

    ∑{k = 1}^n k = 1 + 2 + ... + (n - 1) + n = n * (n + 1) ÷ 2.

Then use the principle of inclusion-exclusion.
"""
function problem001(N::Integer=1000)
    N -= 1
    return 3sumto(N ÷ 3) + 5sumto(N ÷ 5) - 15sumto(N ÷ 15)
end


export problem001
end  # module Problem001
using .Problem001
export problem001
