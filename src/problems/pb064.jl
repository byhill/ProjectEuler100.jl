module Problem064

using PellsEquation
using .Iterators
using ..ProjectEuler100


function cfperiod(N)
    a0 = isqrt(N)
    for (i, (a, _, _)) in zip(countfrom(0), continued_fraction(N))
        a == 2a0 && return i
    end

    return 0
end


"""
    problem064()

Problem 064 of Project Euler.

https://projecteuler.net/problem=064
"""
function problem064(N::Integer=10000)
    return count(isodd, (cfperiod(n) for n in 2:N if !issquare(n)))
end


export problem064
end  # module Problem064
using .Problem064
export problem064
