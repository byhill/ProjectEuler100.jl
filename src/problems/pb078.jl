module Problem078

using .Iterators


"""
    problem078()

Problem 078 of Project Euler.

https://projecteuler.net/problem=078

Pentagonal number theory and partitions.
https://en.wikipedia.org/wiki/Pentagonal_number_theorem
"""
function problem078(d::Int=10^6)
    k = 1
    pentagonals = Int[1, 2]
    p = Int[1]

    for n in countfrom(1)
        if pentagonals[end] <= n
            k += 1
            push!(pentagonals, k * (3k - 1) ÷ 2)
            push!(pentagonals, -k * (-3k - 1) ÷ 2)
        end

        (i, m) = (1, 0)
        while pentagonals[i] <= n
            m = mod(m + (i % 4 in [1, 2] ? p[n-pentagonals[i]+1] : -p[n-pentagonals[i]+1]), d)
            i += 1
        end
        push!(p, m)
        p[n] == 0 && return n - 1
    end
end


export problem078
end  # module Problem078
using .Problem078
export problem078
