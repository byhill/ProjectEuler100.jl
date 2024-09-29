module Problem012

using ..ProjectEulerLibrary


"""
    problem012()

Problem 012 of Project Euler.

https://projecteuler.net/problem=012
"""
function problem012(divisors::Int=500)
    N = 2^4  # Arbitrary
    d = divisorsum_sieve(0, N)
    n = 2

    while true
        if n + 2 == N  # resize sieve
            N *= 4
            d = divisorsum_sieve(0, N)
        end

        divisors < d[n>>1] * d[n+1] && return n * (n + 1) >> 1
        n += 1
        divisors < d[n] * d[(n+1)>>1] && return n * (n + 1) >> 1
        n += 1
    end
end


export problem012
end  # module Problem012
using .Problem012
export problem012
