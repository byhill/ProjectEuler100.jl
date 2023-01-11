export problem097


"""
    problem097()

Problem 097 of Project Euler.

https://projecteuler.net/problem=097
"""
function problem097()
    return mod(28433 * powermod(2, 7830457, 10^10) + 1, 10^10)
end
