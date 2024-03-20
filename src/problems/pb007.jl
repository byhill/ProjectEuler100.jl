module Problem007

using Primes


"""
    problem007()

Problem 007 of Project Euler.

https://projecteuler.net/problem=007

To find all primes below a limit, you can use a sieve (e.g., The Sieve of Eratosthenes).
Then either you can use a binary search or use a proven upper bound for the nth prime.
The following gives an upper bound for the nth prime.
https://en.wikipedia.org/wiki/Prime_number_theorem#Approximations_for_the_nth_prime_number
"""
function problem007(N::Integer=10001)
    return primes(floor(Int, N * log(N) + N * log(log(N + 1)) + 13))[N]
end


export problem007
end  # module Problem007
using .Problem007
export problem007
