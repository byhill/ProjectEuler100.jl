module Problem064

using ..ProjectEuler100


function cfperiod(n)
    a = a0 = isqrt(n)
    x, y, i = a0, 1, 0
    while a ≠ 2a0
        x = a * y - x
        y = div(n - x * x, y)
        a = div(a0 + x, y)
        i += 1
    end

    return i
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
