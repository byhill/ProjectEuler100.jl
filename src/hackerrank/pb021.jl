function problem021(N::Integer)
    N -= 1
    L = N > 5048 ? ceil(Int, N * log(log(N)) * exp(0.578)) : 14304
    d = ones(Int, L)
    for n in 2:L>>1, m = 2n:n:L
        d[m] += n
    end

    s = 0
    for n in 1:N
        d[n] != n && d[d[n]] == n && (s += n)
    end

    return s
end


T = parse(Int64, readline())
for _ in 1:T
    N = parse(Int64, readline())
    println(problem021(N))
end
