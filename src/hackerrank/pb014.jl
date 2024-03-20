const cache = Dict{Int,Int}(1 => 1)


function collatzlength(n::Int)
    get!(cache, n) do
        1 + collatzlength(iseven(n) ? n >> 1 : 3n + 1)
    end
end


function problem014(limit::Integer)
    c = zeros(Int, limit)
    c[1] = 1
    maxn = 1
    for n = 2:limit
        if collatzlength(n) >= collatzlength(maxn)
            maxn = n
        end
        c[n] = maxn
    end

    T = parse(Int, readline())
    for _ in 1:T
        N = parse(Int, readline())
        println(c[N])
    end
end


problem014(5 * 10^6)
