function problem005(N::Integer)
    return reduce(lcm, 1:N)
end


T = parse(Int, readline())
for _ = 1:T
    N = parse(Int, readline())
    println(problem005(N))
end
