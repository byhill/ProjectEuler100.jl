export problem021


"""
    problem021()

Problem 021 of Project Euler.

https://projecteuler.net/problem=021

Interpreted as sum of all amicable pairs less than 10_000.
"""
function problem021(N::Int=10_000)
    N -= 1
    d = σₓ(1, N)
    for n = 2:N
        d[n] -= n
    end

    return sum(n + d[n] for n = 1:N if d[n] < n && d[d[n]] == n; init=0)
end
