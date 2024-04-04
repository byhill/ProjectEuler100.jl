module Problem078

using OffsetArrays: Origin
using .Iterators

O(A) = Origin(0)(A)


"""
    problem078()

Problem 078 of Project Euler.

https://projecteuler.net/problem=078

Pentagonal number theory and partitions.
https://en.wikipedia.org/wiki/Pentagonal_number_theorem
"""
function problem078(d::Integer=10^6)
    k = 1
    pentagonals = [1, 2]
    p = O([1])

    for n in countfrom()
        if pentagonals[end] ≤ n
            k += 1
            push!(pentagonals, k * (3k - 1) ÷ 2)
            push!(pentagonals, -k * (-3k - 1) ÷ 2)
        end

        m = 0
        for (i, q) in enumerate(pentagonals)
            q > n && break
            m = mod(m + (i % 4 in (1, 2) ? 1 : -1) * p[n-q], d)
        end
        push!(p, m)
        iszero(p[n]) && return n
    end
end


export problem078
end  # module Problem078
using .Problem078
export problem078
