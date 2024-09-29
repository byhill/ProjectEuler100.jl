module Problem034

using ..ProjectEulerLibrary


"""
    problem034()

Problem 034 of Project Euler.

https://projecteuler.net/problem=034
"""
function problem034()
    return sum(n for n in 3:7factorial(9) if n == digit_factorial(n))
end


export problem034
end  # module Problem034
using .Problem034
export problem034
