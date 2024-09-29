module Problem055

using ..ProjectEulerLibrary


function islychrel(n::Integer)
    p = undigits(reverse(digits(n)))
    for _ in 1:50
        n += p
        p = undigits(reverse(digits(n)))
        n == p && return false
    end

    return true
end


"""
    problem55()

Problem 55 of Project Euler.

https://projecteuler.net/problem=55
"""
function problem055(N::Integer=10^4)
    return count(islychrel, big(1):N)
end


export problem055
end  # module Problem55
using .Problem055
export problem055
