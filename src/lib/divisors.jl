export divisorcounts, divisorsums, divisor_sums_of_powers


@inline function _get_coprime_part(n, p)
    v = 0
    while n % p == 0
        n ÷= p
        v += 1
    end

    return n, v
end


"""
    divisorcounts(N::Int)

Returns a vector `d` such that for each 1 ≤ n ≤ N, 
`d[n]` is the number of divisors of n.
"""
function divisorcounts(N::Int64)
    sieve = ones(Int64, N)
    primes = Int64[]

    @inbounds for n in 2:N
        if sieve[n] == 1  # then n is prime
            push!(primes, n)
            sieve[n] = 2
        end

        for p in primes
            n * p ≤ N || break
            if n % p == 0
                k, v = _get_coprime_part(n, p)
                sieve[n*p] = sieve[k] * (v + 2)
                break
            else
                sieve[n*p] = 2sieve[n]
            end
        end
    end

    return sieve
end


"""
    divisorcounts(N::Int)

Returns a vector `σ` such that for each 1 ≤ n ≤ N, 
`σ[n]` is the sum of divisors of n.
"""
function divisorsums(N::Int64)
    sieve = ones(Int64, N)
    primes = Int64[]

    @inbounds for n in 2:N
        if sieve[n] == 1  # then n is prime
            push!(primes, n)
            sieve[n] = (n * n - 1) ÷ (n - 1)
        end

        for p in primes
            n * p ≤ N || break
            if n % p == 0
                k, v = _get_coprime_part(n, p)
                if k == 1
                    sieve[n*p] = (p^(v + 2) - 1) ÷ (p - 1)
                else
                    sieve[n*p] = sieve[k] * sieve[p^(v+1)]
                end
                break
            else
                sieve[n*p] = sieve[n] * sieve[p]
            end
        end
    end

    return sieve
end


"""
    divisor_sums_of_powers(e::Int64, N::T) where {T<:Integer}

Returns a vector `σ` such that for each 1 ≤ n ≤ N, 
`σ[n]` is the sum of the e'th powers of the divisors of n.

Overflow can occur.
"""
function divisor_sums_of_powers(e::Int64, N::T) where {T<:Integer}
    sieve = ones(T, N)
    primes = Int64[]

    @inbounds for n in 2:N
        if isone(sieve[n])  # then n is prime
            push!(primes, n)
            q = T(n)^e
            sieve[n] = (q * q - 1) ÷ (q - 1)
        end

        for p in primes
            n * p ≤ N || break
            q = T(p)^e
            if iszero(n % p)
                k, v = _get_coprime_part(n, p)
                if k == 1
                    sieve[n*p] = (q^(v + 2) - 1) ÷ (q - 1)
                else
                    sieve[n*p] = sieve[k] * sieve[p^(v+1)]
                end
                break
            else
                sieve[n*p] = sieve[n] * sieve[p]
            end
        end
    end

    return sieve
end


"""
    divisor_sums_of_powers(e::Int64, N::T, m::Int64) where {T<:Integer}

Returns a vector `σ` such that for each 1 ≤ n ≤ N, 
`σ[n]` is the sum of the e'th powers of the divisors of n, mod m.
"""
function divisor_sums_of_powers(e::Int64, N::T, m::Int64) where {T<:Integer}
    sieve = ones(T, N)
    primes = Int64[]

    @inbounds for n in 2:N
        if isone(sieve[n])  # then n is prime
            push!(primes, n)
            q = powermod(T(n), e, m)
            sieve[n] = mod((mod(q * q, m) - 1) * invmod(q - 1, m), m)
        end

        for p in primes
            n * p ≤ N || break
            q = powermod(T(p), e, m)
            if iszero(n % p)
                k, v = _get_coprime_part(n, p)
                if k == 1
                    sieve[n*p] = mod((powermod(q, v + 2, m) - 1) * invmod(q - 1, m), m)
                else
                    sieve[n*p] = mod(sieve[k] * sieve[p^(v+1)], m)
                end
                break
            else
                sieve[n*p] = mod(sieve[n] * sieve[p], m)
            end
        end
    end

    return sieve
end
