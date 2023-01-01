export problem025


"""
    problem025()

Problem 025 of Project Euler.

https://projecteuler.net/problem=025

https://en.wikipedia.org/wiki/Fibonacci_number#Computation_by_rounding
"""
function problem025(N::Int=1000)
    phi = (1 + sqrt(5)) / 2
    return ceil(Int, (N - 1 + 0.5log10(5)) / log10(phi))
end
