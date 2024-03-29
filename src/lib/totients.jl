module Totients

export totients

"""
    totients(N::Integer)

A linear sieve.
Returns an vector `φ` of length `N`,
where `φ[n]` is the Euler totient function evaluated at `n`.
"""
function totients(N::T) where {T<:Integer}
    phi = ones(T, N)
    primes = T[]
    @inbounds for n in 2:N
        if phi[n] == 1  # then n is prime
            push!(primes, n)
            phi[n] = n - 1
        end
        for p in primes
            n * p ≤ N || break
            if mod(n, p) == 0
                phi[n*p] = phi[n] * p
                break
            else
                phi[n*p] = phi[n] * (p - 1)
            end
        end
    end

    return phi
end

end
