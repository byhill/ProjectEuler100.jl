export problem007


"""
    problem007()

Problem 007 of Project Euler.

https://projecteuler.net/problem=007

The upper bound for the nth prime is n * (log n + log log n).
You can then create your own sieve or use the prime sieve from the Julia package Primes.
"""
function problem007(n::Int=10001)
    return primes(nthprime_upperbound(n))[n]
end
