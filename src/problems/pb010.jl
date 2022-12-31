export problem010


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
function problem010(N::Int=2_000_000)
    N -= 1
    V = [N ÷ n for n = 1:isqrt(N)]
    V = [V; collect(V[end]-1:-1:0)]
    S = Dict{Int,Int}(v => sumto(v) - 1 for v in V)  # Initialize S[v] = 2 + ... + v

    # At the end of each iteration, S[v] contains the sum of all numbers up to v
    # that only have prime divisors greater than p
    for p = 2:isqrt(N)
        S[p] <= S[p-1] && continue  # p is not prime
        for v in V
            v < p^2 && break
            S[v] -= p * (S[v÷p] - S[p-1])
        end
    end

    return S[N]
end
