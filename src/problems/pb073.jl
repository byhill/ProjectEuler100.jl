export problem073


module Problem073
export problem073

using Primes

"""
    problem073()

Problem 073 of Project Euler.

https://projecteuler.net/problem=073

Let R(N) be the number of reduced fractions between x and y,
and let F(N) be the number of fractions (not necessarily reduced) between x and y
(so, for example, 1/2 and 2/4 are treated as distinct)
with denominator at most N.
Then F(N) = F[N - 1] + (n - 1) / 2 - n / 3.
Also, F(N) = ∑ R(N / n), where division is integer division.
Then by the mobius inversion formula, we have

    R(N) = ∑ μ(n) F(N/n).

While we can use the sum as it is, we can also calculate R(N) directly
using the principle of inclusion-exclusion, as we do below.

It is HIGHLY recommended to read the overview to this problem,
as some of the concepts explained in the overview
are highly pertinent to later PE problems.
"""
function problem073(N::Int=12000)
    F = zeros(Int, N)
    for n = 2:N
        F[n] = F[n-1] + (n - 1) ÷ 2 - n ÷ 3
    end

    return ie(N, 1, primes(N), F)
end


# inclusion-exclusion
function ie(N::Int, i::Int, primes, F)
    N < 1 && return 0
    c = F[N]
    c == 0 && return c
    for j = i:length(primes)
        p = primes[j]
        p > N && break
        c -= ie(N ÷ p, j + 1, primes, F)
    end
    return c
end

end  # module Problem073
using .Problem073
