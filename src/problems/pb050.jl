module Problem050

using Primes


"""
    problem050()

Problem 050 of Project Euler.

https://projecteuler.net/problem=050

Use a sliding window type of algorithm.  Doesn't prove uniqueness.
"""
function problem050(N::Integer=10^6)
    mask = primesmask(N)
    primesL = filter(n -> mask[n], eachindex(mask))
    primesum = cumsum(primesL)

    i = searchsortedlast(primesum, N)
    l, u = 1, i + 1  # (lower, upper)
    psum = primesum[i]
    while true
        if psum ≥ N  # Then decrement i and try again
            i -= 1
            l, u = 1, i + 1
            psum = primesum[i]
        else
            mask[psum] && return psum
            psum -= primesL[l]
            psum += primesL[u]
            l += 1
            u += 1
        end
    end
end


export problem050
end  # module Problem050
using .Problem050
export problem050
