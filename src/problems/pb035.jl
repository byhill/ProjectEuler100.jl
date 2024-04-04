module Problem035

using Primes
using ..ProjectEuler100

@inline rotate(n::Integer) = n ÷ 10 + (n % 10) * 10^ilog(10, n)


"""
    problem035()

Problem 035 of Project Euler.

https://projecteuler.net/problem=035
"""
function problem035(N::Integer=10^6)
    primesL = primes(N)
    primeset = Set(primesL)
    ans = 0

    for p in primesL
        q = rotate(p)
        while q ≠ p
            q in primeset || break
            q = rotate(q)
        end
        q == p && (ans += 1)
    end

    return ans
end


export problem035
end  # module Problem035
using .Problem035
export problem035
