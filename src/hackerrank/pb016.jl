function problem016(N::Integer)
    sum(digits(N))
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem016(BigInt(2)^N))
end
