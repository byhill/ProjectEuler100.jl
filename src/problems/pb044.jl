module Problem044

using .Iterators
using ..ProjectEulerLibrary


"""
    problem044()

Problem 044 of Project Euler.

https://projecteuler.net/problem=044
"""
function problem044()
    for d in countfrom()
        D = d * (3d - 1)
        for x in filter(x -> iszero(mod(D, x)), 1:isqrt(D))
            y = D ÷ x
            (n, r) = divrem(3x + y + 1, 6)
            r ≠ 0 && continue
            m = n - x
            Pn = n * (3n - 1) ÷ 2
            Pm = m * (3m - 1) ÷ 2
            m > 0 && ispentagonal(Pn + Pm) && return D >> 1
        end
    end
end


export problem044
end  # module Problem044
using .Problem044
export problem044
