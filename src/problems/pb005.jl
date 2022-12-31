export problem005


"""
    problem005()

Problem 005 of Project Euler.

https://projecteuler.net/problem=005

Least common multiple.
"""
function problem005(N::Int=20)
    return reduce(lcm, 1:N)
end
