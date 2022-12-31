export problem012


"""
    problem012()

Problem 012 of Project Euler.

https://projecteuler.net/problem=012

Since triangle numbers are of the form n * (n + 1) ÷ 2,
and since (if say, n is even), n ÷ 2 and (n + 1) are coprime,
since the divisor count function d = σ₀ is multiplicative,
we have

    d[n * (n + 1) ÷ 2) = d[n ÷ 2] * d[n + 1].

We calculate d via a sieve.
"""
function problem012(divisors::Int=500)
    N = 2^4
    d = σₓ(0, N)
    n = 2

    while true
        if n + 2 == N  # resize sieve
            N *= 4
            d = σₓ(0, N)
        end

        divisors < d[n÷2] * d[n+1] && return n * (n + 1) ÷ 2
        n += 1
        divisors < d[n] * d[(n+1)÷2] && return n * (n + 1) ÷ 2
        n += 1
    end
end
