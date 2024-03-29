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


const phi = totients(10^6)
cumsum!(phi, phi)


function problem072(N::Integer=10^6)
    return phi[N]
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem072(N))
end
