module Problem061

using .Iterators

const cyclic_sets = Int[]
const cycle = Int[]



function seq(f)
    arr = Int[]
    for n in countfrom()
        f(n) < 1000 && continue
        f(n) ≥ 10000 && return arr
        push!(arr, f(n))
    end
end


function findsets(figurates)
    if isempty(figurates) && digits(cycle[1])[3:4] == digits(cycle[end])[1:2]
        length(unique(cycle)) == length(cycle) && push!(cyclic_sets, sum(cycle))
    elseif isempty(cycle)
        for n in figurates[1]
            push!(cycle, n)
            findsets(figurates[2:end])
            pop!(cycle)
        end
    else
        for (i, f) in enumerate(figurates)
            for n in [n for n in f if digits(n)[3:4] == digits(cycle[end])[1:2]]
                push!(cycle, n)
                findsets([figurates[1:i-1]; figurates[i+1:end]])
                pop!(cycle)
            end
        end
    end
end


"""
    problem061()

Problem 061 of Project Euler.

https://projecteuler.net/problem=061
"""
function problem061(A::Vector{Int}=[3, 4, 5, 6, 7, 8])
    empty!(cyclic_sets)
    empty!(cycle)

    figurates = Dict(
        3 => seq(n -> n * (n + 1) ÷ 2),
        4 => seq(n -> n^2),
        5 => seq(n -> n * (3n - 1) ÷ 2),
        6 => seq(n -> n * (2n - 1)),
        7 => seq(n -> n * (5n - 3) ÷ 2),
        8 => seq(n -> n * (3n - 2)),
    )

    findsets([s for (k, s) in figurates if k in A])
    return first(cyclic_sets)
end


export problem061
end  # module Problem061
using .Problem061
export problem061
