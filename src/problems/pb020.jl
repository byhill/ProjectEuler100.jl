module Problem020


"""
    problem020()

Problem 020 of Project Euler.

https://projecteuler.net/problem=020
"""
function problem020(n::Integer=100)
    return sum(digits(factorial(big(n))))
end


export problem020
end  # module Problem020
using .Problem020
export problem020
