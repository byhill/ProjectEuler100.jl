module Problem023

using ..ProjectEuler100.ArithmeticFunctions


"""
    problem023()

Problem 023 of Project Euler.

https://projecteuler.net/problem=023
"""
function problem023()
    N = 28123
    d = divisorsum_sieve(1, N)
    for n in 1:N
        d[n] -= n
    end

    abundant = [d[n] > n for n in 1:N]
    abundantv = Int[]

    ans = 0
    for n in 1:N
        iseven(n) && abundant[n>>1] && push!(abundantv, n >> 1)
        if all(!abundant[n-m] for m in abundantv)
            ans += n
        end
    end

    return ans
end


export problem023
end  # module Problem023
using .Problem023
export problem023
