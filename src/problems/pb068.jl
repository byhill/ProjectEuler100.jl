module Problem068


const solns = String[]


"""
    problem068()

Problem 068 of Project Euler.

https://projecteuler.net/problem=068
"""
function problem068(N::Int=5)
    empty!(solns)
    ring = zeros(Int, 2N)

    for S in 6:2N+2N-1+2N-2
        for inner in 1:2N
            ring[1] = inner
            fillring(ring, 2, 1 << inner, N, S)
        end
    end

    filter!(n -> length(n) == 16, solns)
    return parse(Int, maximum(solns))
end


function fillring(ring, i, used, N, S)
    if i > N  # We have filled the inner ring.
        outer = S - ring[1] - ring[N]
        valid(outer, used, N) || return nothing
        ring[2N] = outer
        ring[N+1] ≠ minimum(ring[N+1:2N]) && return nothing  # ring[N + 1] must be smallest number in outer ring

        ringstring = ""
        for i in 1:N
            ringstring *= string(ring[N+i]) * string(ring[i]) * string(ring[mod1(i + 1, N)])
        end

        push!(solns, ringstring)
        return nothing
    end

    for inner in 1:2N
        valid(inner, used, N) || continue
        outer = S - inner - ring[i-1]
        valid(outer, used, N) || continue
        outer == inner && continue
        ring[i] = inner
        ring[N+i-1] = outer
        fillring(ring, i + 1, used | (1 << inner) | (1 << outer), N, S)
    end

    return nothing
end


valid(n, used, N) = iszero(used & (1 << n)) && 0 < n ≤ 2N


export problem068
end  # module Problem068
using .Problem068
export problem068
