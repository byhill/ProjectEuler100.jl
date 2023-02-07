export problem020


"""
    problem020(n::BigInt=factorial(BigInt(100)))

Problem 020 of Project Euler.

https://projecteuler.net/problem=020

Use BigInts...
"""
function problem020(n::Integer=factorial(BigInt(100)))
    return sum(digits(n))  # digits(x::BigInt) seems type-unstable
end
