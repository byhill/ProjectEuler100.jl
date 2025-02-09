module Problem095

using ..ProjectEulerLibrary


"""
    problem095()

Problem 095 of Project Euler.

https://projecteuler.net/problem=095
"""
function problem095(N::Integer=10^6)
    σ = divisorsums(N)
    for n in 1:N
        σ[n] -= n
    end

    ans = 0
    max = 0
    chain = Int[]
    cache = falses(N)

    for n in 2:N
        cache[n] && continue

        push!(chain, n)
        m = σ[n]
        while 1 < m ≤ N && !cache[m]
            cache[m] = true
            push!(chain, m)
            m = σ[m]
        end

        if m in chain
            x = pop!(chain)
            n = x
            l = 1
            while x ≠ m
                x = pop!(chain)
                l += 1
                n = min(x, n)
            end

            if l > max
                ans = n
                max = l
            end
        end

        empty!(chain)
    end

    return ans
end


export problem095
end  # module Problem095
using .Problem095
export problem095
