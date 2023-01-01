export problem030


"""
    problem030()

Problem 030 of Project Euler.

https://projecteuler.net/problem=030
"""
function problem030(p::Int64=5)
    L = first(n for n in countfrom() if ndigits(n * 9^p) <= n)
    dpowers = [d^p for d in 0:9]
    dpower_sums = [sum(d) for d in with_replacement_combinations(dpowers, L)]
    unique!(dpower_sums)

    return sum(n for n in dpower_sums if n == sum(d^p for d in digits(n))) - 1
end
