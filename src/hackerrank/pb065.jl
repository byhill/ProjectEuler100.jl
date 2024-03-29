function problem065(N::Integer)
    p, q = big(1), big(2)
    for n in 2:N
        p, q = q, (iszero(mod(n, 3)) ? div(2(n + 1), 3) : 1) * q + p
    end

    return sum(digits(q))
end


N = parse(Int, readline())
println(problem065(N))
