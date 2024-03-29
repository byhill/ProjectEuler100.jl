module Problem080

using ..ProjectEuler100


function sumsqrt(n, D)
    m = n * BigInt(10)^(2D)
    return sum(reverse(digits(isqrt(m)))[1:D])
end


"""
    problem080()

Problem 080 of Project Euler.

https://projecteuler.net/problem=080

Use BigInts and integer square roots.
"""
function problem080(D::Integer=100, N::Integer=100)
    return sum(sumsqrt(n, D) for n in 1:N if !issquare(n))
end


export problem080
end  # module Problem080
using .Problem080
export problem080
