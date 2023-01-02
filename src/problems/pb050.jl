export problem050


"""
    problem050()

Problem 050 of Project Euler.

https://projecteuler.net/problem=050

Use a sliding window type of algorithm.  Doesn't prove uniqueness.
"""
function problem050(N::Integer=10^6)
    primesL = primes(10isqrt(N))

    primesum = Vector{Int}(undef, length(primesL))
    primesum[1] = 2
    for i = 2:length(primesL)
        primesum[i] = primesum[i-1] + primesL[i]
    end

    i = searchsortedlast(primesum, N)
    (l, u) = (1, i + 1)  # (lower, upper)
    psum = primesum[i]
    while true
        if psum >= N  # Then decrement i and try again
            i -= 1
            (l, u) = (1, i + 1)
            psum = primesum[i]
        else
            isprime(psum) && return psum
            psum -= primesL[l]
            psum += primesL[u]
            l += 1
            u += 1
        end
    end
end
