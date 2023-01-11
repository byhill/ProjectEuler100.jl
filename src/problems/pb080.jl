export problem080


"""
    problem080()

Problem 080 of Project Euler.

https://projecteuler.net/problem=080

Use BigInts and integer square roots.
"""
function problem080(D::Int=100, N::Int=100)
    function sumsqrt(n)
        m = n * BigInt(10)^(2D)
        return sum(reverse(digits(isqrt(m)))[1:D])
    end

    return sum(sumsqrt(n) for n = 1:N if !issquare(n))
end
