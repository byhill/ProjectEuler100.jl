module Problem010

using ..ProjectEuler100.Primes


"""
    problem010()

Problem 010 of Project Euler.

https://projecteuler.net/problem=010

Using a prime sieve more than suffices for this problem.
But we consider a sublinear algorithm instead.

Let S(v, p) be the sum of all numbers less than or equal to v that are prime or
whose only prime factors are greater than p.
If p is not prime or v < p^2, then S(v, p) = S(v, p - 1).
Otherwise, S(v, p) is S(v, p - 1) minus the sum of all numbers at most v
that can be expressed as a product of p and another integer with no prime divisors smaller than p,
i.e.,

S(v, p) = S(v, p - 1) - p * [S(v / p, p - 1) - S(p - 1, p - 1)];    # p prime.

It's running time is O(N^(3 / 4)),
better than the O(n^(1 + epsilon)) of the prime sieve.
"""
function problem010(N::Integer=2000000)
    return primesum_function(N)(N)
end


export problem010
end  # module Problem010
using .Problem010
export problem010
