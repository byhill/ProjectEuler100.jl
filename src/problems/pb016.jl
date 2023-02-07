export problem016


"""
    problem016(n::BigInt=2^1000)

Problem 016 of Project Euler.

https://projecteuler.net/problem=016

Use BigInts...
"""
function problem016(N::Integer=BigInt(2)^1000)
    return sum(digits(N))  # digits(x::BigInt) seems type-unstable...
end
