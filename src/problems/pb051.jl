module Problem051

using Combinatorics
using Primes
using .Iterators
using ..ProjectEulerLibrary


"""
    problem051()

Problem 051 of Project Euler.

https://projecteuler.net/problem=051
"""
function problem051(N=8)
    return first(p for s in countfrom() for p in primes(10^(s - 1), 10^s) if isprimefamily(N, p))
end

function isprimefamily(N, p)
    for digit in 0:10-N
        I = findall(isequal(digit), digits(p))

        for J in powerset(I, 1)
            family_size = 1
            pdigits = digits(p)

            for d in digit+1:9
                pdigits[J] .= d
                isprime(undigits(pdigits)) && (family_size += 1)
                N - family_size > 9 - d && break
                family_size == N && return true
            end

        end

    end

    return false
end


export problem051
end  # module Problem051
using .Problem051
export problem051
