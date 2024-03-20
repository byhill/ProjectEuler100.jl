module Problem027

using Primes
using .Iterators


"""
    problem027()

Problem 027 of Project Euler.

https://projecteuler.net/problem=027
"""
function problem027(N::Integer=1000)
    maxchain, maxa, maxb = 0, 0, 0

    for b in reverse(primes(N))
        maxchain >= b && return maxa * maxb
        for a = -N+((N+1)&1):2:N
            seq = chain(a, b)
            if seq > maxchain
                maxchain, maxa, maxb = seq, a, b
            end
        end
    end

    return maxa * maxb
end


function chain(a::Integer, b::Integer)
    for n in countfrom()
        y = n^2 + a * n + b
        isprime(y) || return n - 1
    end
end


export problem027
end  # module Problem027
using .Problem027
export problem027
