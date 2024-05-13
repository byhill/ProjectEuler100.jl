function cuboids(a::Integer, bc::Integer)
    2a < bc && return 0
    return a >= bc ? bc >> 1 : a - (bc - 1) >> 1
end


function cuboids(M::Integer)
    total = zeros(Int, M)
    for u in 1:2isqrt(M)
        for v in u-1:-2:1
            isone(gcd(u, v)) || continue
            x = u^2 - v^2
            y = 2u * v
            for k in 1:div(M, x)
                total[k*x] += cuboids(k * x, k * y)
            end
            for k in 1:div(M, y)
                total[k*y] += cuboids(k * y, k * x)
            end
        end
    end

    for t in 2:M
        total[t] += total[t-1]
    end

    return total
end


function problem086()
    total = cuboids(4 * 10^5)

    T = parse(Int, readline())
    for _ in 1:T
        N = parse(Int, readline())
        println(total[N])
    end
end


problem086()
