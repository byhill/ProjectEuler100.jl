function problem020(n::Integer)
    return sum(digits(factorial(big(n))))
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem020(N))
end
