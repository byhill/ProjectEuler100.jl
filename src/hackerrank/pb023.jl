function divisor_sums(N::Integer)
    d = ones(N)
    for i = 2:N>>1, n = 2i:i:N
        d[n] += i
    end

    return d
end


function problem023()
    limit = 28123
    d = divisor_sums(limit)
    abundant = Set{Int64}()
    ans = Set{Int64}()

    for n = 1:limit
        !any((n - m) in abundant for m in abundant) && push!(ans, n)
        d[n] > n && push!(abundant, n)
    end

    return ans
end


T = parse(Int, readline())
ans = problem023()
for _ in 1:T
    N = parse(Int, readline())
    println(N in ans ? "NO" : "YES")
end
