function problem057(N::Integer)
    p2, p1 = big(1), big(3)
    q2, q1 = big(1), big(2)
    for i in 2:N
        p2, p1 = p1, 2p1 + p2
        q2, q1 = q1, 2q1 + q2
        ndigits(p1) > ndigits(q1) && (println(i))
    end
end


N = parse(Int, readline())
problem057(N)
