export problem014


module Problem014

export problem014

const cache = Dict{Int,Int}()


"""
    problem014()

Problem 014 of Project Euler.

https://projecteuler.net/problem=014

Use memoization.
"""
function problem014(N::Int=10^6)
    empty!(cache)  # for benchmarking purposes
    cache[1] = 1
    return argmax(collatzlength, N÷2:N-1)
end


function collatzlength(n::Int)
    return get!(cache, n) do
        return 1 + collatzlength(n % 2 == 0 ? n ÷ 2 : 3n + 1)
    end
end

end  # module

using .Problem014
