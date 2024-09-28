module Totients

export totients

"""
    totients(N::Integer)

A linear sieve.
Returns an vector `φ` of length `N`,
where `φ[n]` is the Euler totient function evaluated at `n`.
"""
function totients(N::T) where {T<:Integer}
    φ = ones(T, N)
    primes = T[]
    @inbounds for n in 2:N
        if φ[n] == 1  # then n is prime
            push!(primes, n)
            φ[n] = n - 1
        end
        for p in primes
            n * p ≤ N || break
            if mod(n, p) == 0
                φ[n*p] = φ[n] * p
                break
            else
                φ[n*p] = φ[n] * (p - 1)
            end
        end
    end

    return φ
end

end
