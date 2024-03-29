module Problem077

using Primes
using .Iterators

const cache = Dict{Tuple{Int,Int},Int}()


function f(n, i, primes)
    return get!(cache, (n, i)) do
        i == 0 && return 0
        n == 0 && return 1
        n < 0 && return 0
        p = primes[i]
        return f(n - p, i, primes) + f(n, i - 1, primes)
    end
end


"""
    problem077()

Problem 077 of Project Euler.

https://projecteuler.net/problem=077

Very similar to the previous problem...
"""
function problem077(N::Integer=5000)
    empty!(cache)
    pL = 10
    primesL = primes(pL)

    i = 1
    for n in countfrom(2)
        n == primesL[i] && (i += 1)
        i == length(primesL) && (pL *= 10; primesL = primes(pL))
        f(n, i - 1, primesL) > N && return n
    end
end


export problem077
end  # module Problem077
using .Problem077
export problem077
