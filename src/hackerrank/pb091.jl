function problem091(N::Integer)
    return 3N^2 + sum(2min(div(y * gcd(x, y), x), div((N - x) * gcd(x, y), y)) for y in 1:N, x in 1:N)
end


N = parse(Int, readline())
println(problem091(N))
