module Problem066

using PellsEquation
using .Iterators
using ..ProjectEuler100


"""
    problem066()

Problem 066 of Project Euler.

https://projecteuler.net/problem=066
"""
function problem066(N::Integer=1000)
    return argmax(n -> issquare(n) ? 0 : first(first(drop(pellseqn(n), 1))), 1:N)
end


export problem066
end  # module Problem066
using .Problem066
export problem066
