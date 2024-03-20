module Problem028


"""
    problem028()

Problem 028 of Project Euler.

https://projecteuler.net/problem=028
"""
function problem028(N::Int=1001)
    n = (N - 1) >> 1
    return (16n^3 + 30n^2 + 26n + 3) ÷ 3
end


export problem028
end  # module Problem028
using .Problem028
export problem028
