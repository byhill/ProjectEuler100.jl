module Problem014

const cache = Dict{Int,Int}()


"""
    problem014()

Problem 014 of Project Euler.

https://projecteuler.net/problem=014

Dynamic programming
"""
function problem014(N::Int=10^6)
    empty!(cache)  # for benchmarking purposes
    cache[1] = 1

    # If n has a chain length l, then 2n has chain length l + 1
    return argmax(collatzlength, N>>1:N)
end


function collatzlength(n::Integer)
    get!(cache, n) do
        1 + collatzlength(iseven(n) ? n >> 1 : 3n + 1)
    end
end

export problem014
end  # module Problem014
using .Problem014
export problem014
