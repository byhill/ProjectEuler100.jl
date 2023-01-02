export problem048


"""
    problem048()

Problem 048 of Project Euler.

https://projecteuler.net/problem=048
"""
function problem048(N::Int=1000)
    return mod(sum(powermod(n, n, 10^10) for n = 1:N), 10^10)
end
