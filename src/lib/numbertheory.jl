export σₓ

"""
    σₓ(x::Int, N::Int)

Returns a vector σ of length N,
where σ[n] is the sum of x'th powers of the positive divisors of n.
"""
function σₓ(x::Int, N::Int)
    σ = zeros(Int, N)
    σ[1] = 1

    for p in primes(N)
        q = 1
        coeff = 1
        while p * q < N
            q *= p
            coeff += q^x
            σ[q] = coeff
            for n = 2:N÷q
                σ[n] == 0 || n % p == 0 || (σ[n*q] = σ[n] * σ[q])
            end
        end
    end

    return σ
end
