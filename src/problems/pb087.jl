module Problem087

using Primes


"""
    problem087()

Problem 087 of Project Euler.

https://projecteuler.net/problem=087

Essentially clever brute-force.
"""
function problem087(N::Int=50_000_000)
    primesL = primes(isqrt(N))

    primes_squared = Int[]
    primes_cubed = Int[]
    primes_tesseracted = Int[]
    for p in primesL
        p^2 >= N && break
        push!(primes_squared, p^2)
    end
    for p in primesL
        p^3 >= N && break
        push!(primes_cubed, p^3)
    end
    for p in primesL
        p^4 >= N && break
        push!(primes_tesseracted, p^4)
    end

    solns = Int[]
    for p in primes_tesseracted
        for q in primes_cubed
            p + q >= N && break
            for r in primes_squared
                p + q + r >= N && break
                push!(solns, p + q + r)
            end
        end
    end

    return length(unique(solns))
end


export problem087
end  # module Problem087
using .Problem087
export problem087
