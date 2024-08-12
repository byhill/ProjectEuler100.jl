function totients(N::T) where {T<:Integer}
    phi = ones(T, N)
    primes = T[]
    @inbounds for n in 2:N
        if phi[n] == 1  # then n is prime
            push!(primes, n)
            phi[n] = n - 1
        end
        for p in primes
            n * p <= N || break
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


const digitsn = Int[]
const digitsm = Int[]


@inline function digitpermutation(n, m)
    ln = ndigits(n)
    lm = ndigits(m)
    ln == lm || return false

    resize!(digitsn, ln)
    resize!(digitsm, lm)
    digits!(digitsn, n)
    digits!(digitsm, m)
    sort!(digitsn)
    sort!(digitsm)
    return digitsn == digitsm
end

function problem070(N)
    phi = totients(N)

    min_n = 3
    min_phi = 1
    for n in 2:N-1
        n * min_phi < min_n * phi[n] || continue
        digitpermutation(n, phi[n]) || continue
        min_n = n
        min_phi = phi[n]
    end

    return min_n
end

N = parse(Int, readline())
println(problem070(N))
