module Problem045

using .Iterators
using ..ProjectEulerLibrary


"""
    problem045()

Problem 045 of Project Euler.

https://projecteuler.net/problem=045

Triangular number a necessarily hexagonal.
Thus, we are looking for numbers that are both hexagonal and pentagonal
"""
function problem045(c::Integer=3)
    for n in countfrom()
        hexg = n * (2n - 1)
        ispentagonal(hexg) && (c -= 1)
        c == 0 && return hexg
    end
end


export problem045
end  # module Problem045
using .Problem045
export problem045
