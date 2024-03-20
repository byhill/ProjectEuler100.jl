function problem002(N::Integer)
    ans = 2
    a, b = 8, 2
    while a <= N
        ans += a
        a, b = 4a + b, a
    end

    return ans
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem002(N))
end
