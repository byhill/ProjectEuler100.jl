export problem006


"""
    problem006()

Problem 006 of Project Euler.

https://projecteuler.net/problem=006

The sum from 1 to n is n(n + 1) / 2.
The sum of successive squares from 1 to n^2 is n(n + 1)(2n + 1) / 6.
"""
function problem006(n::Integer=100)
    return sumto(n)^2 - sumsquaresto(n)
end
