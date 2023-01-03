export problem052


"""
    problem052()

Problem 052 of Project Euler.

https://projecteuler.net/problem=052
"""
function problem052(K::Integer=6)
    return first(n for n in countfrom(1) if all(sort(digits(n)) == sort(digits(k * n)) for k = 2:K))
end
