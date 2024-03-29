const MOD = 10^9 + 7
const cache = Dict{Tuple{Int,Int},Int}()


function f(n, m)
    return get!(cache, (n, m)) do
        m == 0 && return 0
        n == 0 && return 1
        n < 0 && return 0
        return mod(f(n - m, m) + f(n, m - 1), MOD)
    end
end


function problem076(N)
    return f(N, N - 1)
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem076(N))
end
