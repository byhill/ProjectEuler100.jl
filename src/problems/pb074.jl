module Problem074

using OffsetArrays: Origin
using ..ProjectEuler100

O(A) = Origin(0)(A)


"""
    problem074()

Problem 074 of Project Euler.

https://projecteuler.net/problem=074
"""
function problem074(N::Integer=10^6)
    cache = O(zeros(Int, max(N, 7factorial(9))))
    chain = Int[]

    for n in 1:N
        iszero(cache[n]) || continue

        empty!(chain)
        m = n
        while !(m in chain) && cache[m] == 0
            push!(chain, m)
            m = digit_factorial(m)
        end
        reverse!(chain)
        if m in chain
            i = findfirst(isequal(m), chain)
            for _ in 1:i
                cache[popfirst!(chain)] = i
            end
        end

        offset = cache[m]
        for (i, m) in enumerate(chain)
            cache[m] = i + offset
        end
    end

    return count(==(60), resize!(cache, N - 1))
end


export problem074
end  # module Problem074
using .Problem074
export problem074
