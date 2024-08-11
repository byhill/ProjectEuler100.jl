module Problem060

using Primes
using .Iterators
using ..ProjectEuler100

const arr = Int[]
const cliques = Vector{Int}[]
const prime_neighbours = Dict{Int,Vector{Int}}()


pseudoprimepair(pq, qp) = isone(powermod(2, pq - 1, pq)) && isone(powermod(2, qp - 1, qp))


function findcliques(p, nbrs, depth)
    iszero(depth) && (push!(cliques, copy(arr)); return)
    nbrsI = intersect(nbrs, prime_neighbours[p])
    for q in filter(<(p), nbrsI)
        arr[depth] = q
        findcliques(q, nbrsI, depth - 1)
    end
end


"""
    problem060()

Problem 060 of Project Euler.

https://projecteuler.net/problem=060

Proves the result is indeed true.
"""
function problem060(K::Integer=5)
    empty!(arr)
    empty!(cliques)
    empty!(prime_neighbours)
    resize!(arr, K)
    prime_neighbours[3] = Int[]

    N = 1024
    ip = 1  # index of primes
    primes1 = Tuple{Int,Int}[(3, 10)]
    ip1 = 1  # index of primes 1 mod 3
    primes2 = Tuple{Int,Int}[(3, 10)]
    ip2 = 1  # index of primes 2 mod 3
    lp = 10  # length of p

    while true
        # Find prime pairs
        primesL = [[3]; primes(N)[4:end]]
        for p in primesL[max(2, ip):end]
            p > lp && (lp *= 10)
            push!((p % 3 == 1 ? primes1 : primes2), (p, lp))
            prime_neighbours[p] = []
        end
        for (i, pL) in ((ip1, primes1), (ip2, primes2))
            for (j, (p, lp)) in enumerate(pL[i:end])
                for (q, lq) in pL[1:i+j-2]
                    if pseudoprimepair(p * lq + q, q * lp + p)
                        push!(prime_neighbours[p], q)
                        push!(prime_neighbours[q], p)
                    end
                end
            end
        end

        # Find cliques of size K
        for p in primesL
            arr[end] = p
            for q in filter(<(p), prime_neighbours[p])
                arr[end-1] = q
                findcliques(q, prime_neighbours[p], K - 2)
            end
        end

        # verify that pseudoprime cliques are indeed prime cliques
        f(p, q) = isprime(undigits(vcat(digits(p), digits(q))))
        filter!(c -> all(f(p, q) for (p, q) in product(c, c) if p ≠ q), cliques)
        length(cliques) > 0 && N ≥ minimum(sum, cliques) && break

        # prepare for next iteration
        N = length(cliques) == 0 ? 2N : minimum(sum, cliques)
        ip = 1 + length(primesL)
        ip1 = 1 + length(primes1)
        ip2 = 1 + length(primes2)
    end

    return minimum(sum, cliques)
end


export problem060
end  # module Problem060
using .Problem060
export problem060
