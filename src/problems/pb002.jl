export problem002


"""
    problem002()

Problem 002 of Project Euler.

https://projecteuler.net/problem=002

The even Fibonacci numbers are precisely the Fibonacci numbers whose
index is divisible by 3.

A recurrence is given by

    f(n + 1) = 4f(n) + f(n -1).
"""
function problem002(N::Int=4000000)
    s = 2
    (fₙ, fₙ₋₁) = (8, 2)
    while fₙ <= N
        s += fₙ
        (fₙ, fₙ₋₁) = (4fₙ + fₙ₋₁, fₙ)
    end
    return s
end
