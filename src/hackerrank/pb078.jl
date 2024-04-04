const MOD = 10^9 + 7


function problem078(N::Integer)
    pentagonals = [1, 2]
    p = Vector{Int}(undef, N + 1)

    k = 1
    while pentagonals[end] <= N
        k += 1
        push!(pentagonals, div(k * (3k - 1), 2))
        push!(pentagonals, div(-k * (-3k - 1), 2))
    end
    for n in 1:N
        m = 0
        i = 1
        while pentagonals[i] <= n
            m = mod(m + (i % 4 in (1, 2) ? 1 : -1) * p[n-pentagonals[i]+1], MOD)
            i += 1
        end
        p[n+1] = m
    end

    popfirst!(p)
    return p
end


p = problem078(6 * 10^4)
T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(p[N])
end
