module Problem073

using Primes

const F = Int[]


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
function problem073(N::Integer=12000)
    resize!(F, N)
    fill!(F, 0)

    for n in 2:N
        F[n] = F[n-1] + (n - 1) ÷ 2 - n ÷ 3
    end

    return ie(N, 1, primes(N))
end


# inclusion-exclusion
function ie(N::Int, i::Int, primes)
    N < 1 && return 0
    iszero(F[N]) && return F[N]

    ans = F[N]
    for j = i:length(primes)
        p = primes[j]
        p > N && break
        ans -= ie(N ÷ p, j + 1, primes)
    end

    return ans
end

export problem073
end  # module Problem073
using .Problem073
export problem073
export problem073
