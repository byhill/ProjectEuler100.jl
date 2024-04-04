module Problem079

using OffsetArrays: Origin
using ..ProjectEuler100


"""
    problem079()

Problem 079 of Project Euler.

https://projecteuler.net/problem=079

Topological Sort, Kahn's algorithm with adjacency list
(which here is asymptotically slower than adjacency lists, but faster for the small input size here)
"""
function problem079(filename="txt/pb079.txt")
    passcodes = map(line -> [parse(Int, d) for d in line], readlines(filename))
    G = Origin(0, 0)(falses(10, 10))
    characters = Origin(0)(falses(10))

    for p in passcodes
        for c in p
            characters[c] = true
        end
        G[p[1], p[2]] = true
        G[p[2], p[3]] = true
    end

    L = Int[]
    S = Int[]
    for i in 0:9
        any(G[:, i]) || push!(S, i)
    end

    while !isempty(S)
        n = pop!(S)
        push!(L, n)
        for i in 0:9
            G[n, i] || continue
            G[n, i] = false
            any(G[:, i]) || push!(S, i)
        end
    end

    any(G) && throw(error("No password exists"))
    intersect!(L, filter(i -> characters[i], 0:9))
    return concat(L...)
end


export problem079
end  # module Problem079
using .Problem079
export problem079
