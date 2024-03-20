module Problem005


"""
    problem005()

Problem 005 of Project Euler.

https://projecteuler.net/problem=005
"""
function problem005(N::Integer=20)
    return reduce(lcm, 1:N)
end


export problem005
end  # module Problem005
using .Problem005
export problem005
