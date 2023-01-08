export problem066


"""
    problem066()

Problem 066 of Project Euler.

https://projecteuler.net/problem=066
"""
function problem066(D::Integer=1000)
    return argmax(n -> issquare(n) ? 0 : pells_equation_fundamental_solution(n)[1], 1:D)
end
