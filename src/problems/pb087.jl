module Problem087

using Primes


"""
    problem087()

Problem 087 of Project Euler.

https://projecteuler.net/problem=087
"""
function problem087(N::Integer=50_000_000)
    primesL = primes(isqrt(N))

    solns = falses(N)
    for p in primesL
        p = p^4
        p < N || break
        for q in primesL
            q = q^3
            p + q < N || break
            for r in primesL
                r = r^2
                p + q + r ≤ N || break
                solns[p+q+r] = true
            end
        end
    end

    return count(solns)
end


export problem087
end  # module Problem087
using .Problem087
export problem087
