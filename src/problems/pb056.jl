export problem056


"""
    problem056()

Problem 056 of Project Euler.

https://projecteuler.net/problem=056
"""
function problem056(N::Integer=100)
    return maximum(n -> sum(digits(n)), a^b for a = BigInt(1):N-1 for b = 1:N-1)  # digits(x::BigInt) seems type-unstable
end
