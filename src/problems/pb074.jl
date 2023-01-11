export problem074


"""
    problem074()

Problem 074 of Project Euler.

https://projecteuler.net/problem=074
"""
function problem074(N::Int=10^6)
    cache = Dict{Int,Int}()
    c = 0

    for n = 1:N
        if n in keys(cache)
            cache[n] == 60 && (c += 1)
            continue
        end

        m = n
        chain = Int[]
        while !(m in chain) && !(m in keys(cache))
            push!(chain, m)
            m = digit_factorial(m)
        end
        reverse!(chain)
        if m in chain
            i = findfirst(isequal(m), chain)
            for u in chain[1:i]
                cache[u] = i
            end
            chain = chain[i+1:end]
        end

        offset = m in keys(cache) ? cache[m] : 0
        for (i, m) in enumerate(chain)
            cache[m] = i + offset
        end
        cache[n] == 60 && (c += 1)
    end

    return c
end
