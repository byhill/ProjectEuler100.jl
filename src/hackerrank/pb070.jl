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
    return 1 + argmin([(digitpermutation(n, phi[n]) ? n / phi[n] : N) for n in 2:N-1])
end

N = parse(Int, readline())
println(problem070(N))
