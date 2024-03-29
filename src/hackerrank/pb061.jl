using .Iterators

const cyclic_sets = Int[]
const cycle = Int[]



function seq(f)
    arr = Int[]
    for n in countfrom()
        f(n) < 1000 && continue
        f(n) >= 10000 && return arr
        push!(arr, f(n))
    end
end


function findsets(figurates)
    if isempty(figurates)
        digits(cycle[1])[3:4] == digits(cycle[end])[1:2] || return
        length(unique(cycle)) == length(cycle) || return
        push!(cyclic_sets, sum(cycle))
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


function problem061(A::Vector{Int}=[3, 4, 5, 6, 7, 8])
    empty!(cyclic_sets)
    empty!(cycle)

    figurates = Dict(
        3 => seq(n -> div(n * (n + 1), 2)),
        4 => seq(n -> n^2),
        5 => seq(n -> div(n * (3n - 1), 2)),
        6 => seq(n -> n * (2n - 1)),
        7 => seq(n -> div(n * (5n - 3), 2)),
        8 => seq(n -> n * (3n - 2)),
    )

    findsets([s for (k, s) in figurates if k in A])
    sort!(cyclic_sets)
    unique!(cyclic_sets)
    for s in cyclic_sets
        println(s)
    end
end


parse(Int, readline())
T = [parse(Int, n) for n in split(readline(), " ")]
problem061(T)
