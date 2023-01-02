export problem046


"""
    problem046()

Problem 046 of Project Euler.

https://projecteuler.net/problem=046
"""
function problem046()
    primes = Set{Int}((2, 3, 5, 7))
    for n in countfrom(11, 2)
        if isprime(n)
            push!(primes, n)
        elseif !any(n - 2m^2 in primes for m = 1:isqrt(n ÷ 2))
            return n
        end
    end
end
