module ArithmeticFunctions

using Primes

export divisorsum_sieve


"""
    σₓ(x::Int, N::Int)

Returns a vector σ of length N,
where σ[n] is the sum of x'th powers of the positive divisors of n.
"""
function divisorsum_sieve(x::Int, N::Int)
    sieve = zeros(Int, N)
    sieve[1] = 1

    for p in primes(N)
        q = 1
        coeff = 1
        while p * q ≤ N
            q *= p
            coeff += q^x
            sieve[q] = coeff
            for n in 2:N÷q
                iszero(sieve[n]) && continue
                iszero(n % p) && continue
                sieve[n*q] = sieve[n] * sieve[q]
            end
        end
    end

    return sieve
end


function divisorsum_sieve(N::Int)
    sieve = zeros(Int, N)
    sieve[1] = 1

    for p in primes(N)
        q = 1
        coeff = 1
        while p * q ≤ N
            q *= p
            coeff += q
            sieve[q] = coeff
            for n in 2:N÷q
                iszero(sieve[n]) && continue
                iszero(n % p) && continue
                sieve[n*q] = sieve[n] * sieve[q]
            end
        end
    end

    return sieve
end

end
