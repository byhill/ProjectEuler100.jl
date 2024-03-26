module Problem057

using PellsEquation
using .Iterators


"""
    problem057()

Problem 057 of Project Euler.

https://projecteuler.net/problem=057
"""
function problem057(N::Integer=1000)
    return count(ndigits(P) > ndigits(Q) for (_, P, Q) in take(continued_fraction(2), N + 1))
end


export problem057
end  # module Problem057
using .Problem057
export problem057
