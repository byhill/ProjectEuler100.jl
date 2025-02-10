module Problem058

using Primes
using .Iterators


"""
    problem058()

Problem 058 of Project Euler.

https://projecteuler.net/problem=058
"""
function problem058(percent=10)
    n = 1
    primecount = 0
    for s in countfrom(2, 2)
        for _ in 1:4
            n += s
            isprime(n) && (primecount += 1)
        end

        100primecount < percent * (2s + 1) && return s + 1
    end
end


export problem058
end  # module Problem058
using .Problem058
export problem058
