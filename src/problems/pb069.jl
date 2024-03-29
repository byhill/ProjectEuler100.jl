module Problem069

using Primes


"""
    problem069()

Problem 069 of Project Euler.

https://projecteuler.net/problem=069
"""
function problem069(N::Integer=10^6)
    n = one(N)
    for p in primes(200)  # Large enough for all 128bit inputs
        (n *= p) > N && return n ÷ p
    end

    return 0
end


export problem069
end  # module Problem069
using .Problem069
export problem069
