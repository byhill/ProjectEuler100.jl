module Problem066

using .Iterators
using ..ProjectEulerLibrary


function pellseqn(D)
    a = a0 = isqrt(D)
    p, q, i = 0, 1, 0
    x1, x = big(a), big(1)
    y1, y = big(1), big(0)
    while a ≠ 2a0
        p = a * q - p
        q = div(D - p * p, q)
        a = div(a0 + p, q)
        x1, x = a * x1 + x, x1
        y1, y = a * y1 + y, y1
        i += 1
    end

    return iseven(i) ? x : x * x + D * y * y
end


"""
    problem066()

Problem 066 of Project Euler.

https://projecteuler.net/problem=066
"""
function problem066(N::Integer=1000)
    return argmax(D -> issquare(D) ? 0 : pellseqn(D), 1:N)
end


export problem066
end  # module Problem066
using .Problem066
export problem066
