module Problem047

using .Iterators

const divisors = Int[]


"""
    problem047()

Problem 047 of Project Euler.

https://projecteuler.net/problem=047

Find via sieving.
Search via binary search.
"""
function problem047(K::Integer=4)
    return first((ans for ans in (f(2^i + K, K) for i in countfrom(8)) if ans > 0))
end


"""
Finds the first K consecuive integers with K distinct prime factors up to N,
or 0 if no such K integers exists.
"""
function f(N::Integer, K::Integer)
    resize!(divisors, N)
    fill!(divisors, 0)

    consec = 0
    for n in 2:N
        if divisors[n] == 0
            consec = 0
            divisors[n:n:N] .+= 1
        elseif divisors[n] == K
            consec += 1
            consec == K && return n - K + 1
        else
            consec = 0
        end
    end

    return 0
end


export problem047
end  # module Problem047
using .Problem047
export problem047
