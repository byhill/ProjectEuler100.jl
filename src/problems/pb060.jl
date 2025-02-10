module Problem060

using Primes
using .Iterators
using ..ProjectEulerLibrary

const arr = Int[]
const cliques = Vector{Int}[]
const prime_neighbours = Dict{Int,Vector{Int}}()


# Fermet's primality test
pseudoprimepair(pq, qp) = isone(powermod(2, pq - 1, pq)) && isone(powermod(2, qp - 1, qp))


function findcliques(p, neighbours, depth)
    depth == 0 && (push!(cliques, copy(arr)); return)

    nbrsI = filter!(<(p), intersect(neighbours, prime_neighbours[p]))
    length(nbrsI) ≥ depth || return

    for q in nbrsI
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
    primes1 = Int[3]
    ip1 = 1  # index of primes 1 mod 3
    primes2 = Int[3]
    ip2 = 1  # index of primes 2 mod 3
    primesL = [3]

    while true
        for p in primes(max(6, last(primesL)), N)
            push!(primesL, p)
        end

        # Find prime pairs
        for p in primesL[ip:end]
            push!((p % 3 == 1 ? primes1 : primes2), p)
            prime_neighbours[p] = []
        end
        for (i, pL) in ((ip1, primes1), (ip2, primes2))
            for (j, p) in enumerate(pL[i:end])
                for q in pL[1:i+j-2]
                    if pseudoprimepair(concat(p, q), concat(q, p))
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
        filter!(clique -> all(isprime(concat(p, q)) for (p, q) in product(clique, clique) if p ≠ q), cliques)
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
