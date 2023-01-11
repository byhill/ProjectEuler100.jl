export problem076

module Problem076
export problem076

const cache = Dict{Tuple{Int,Int},Int}()

function f(n, m)
    return get!(cache, (n, m)) do
        m == 0 && return 0
        n == 0 && return 1
        n < 0 && return 0
        return f(n - m, m) + f(n, m - 1)
    end
end

"""
    problem076()

Problem 076 of Project Euler.

https://projecteuler.net/problem=076

Let f(n, m) be the number of ways that n can be written as the sum of integers at most m.
Then, with proper base cases, f(n, m) = f(n - m, m) + f(n, m - 1).
"""
function problem076(N::Int=100)
    empty!(cache)
    return f(N, N - 1)
end

end  # module Problem076
using .Problem076