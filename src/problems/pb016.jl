module Problem016


"""
    problem016()

Problem 016 of Project Euler.

https://projecteuler.net/problem=016
"""
function problem016(N::Integer=big(2)^1000)
    return sum(digits(N))
end


export problem016
end  # module Problem016
using .Problem016
export problem016
