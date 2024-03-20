function divisor_counts(limit)
    d = ones(Int, limit)
    for n = 2:limit, m = n:n:limit
        d[m] += 1
    end

    return d
end


function problem012(divisors::Integer=500)
    dlimit = 2^4
    d = divisor_counts(dlimit)
    n = 2

    while true
        if n + 2 == dlimit
            dlimit *= 4
            d = divisor_counts(dlimit)
        end

        if divisors < d[div(n, 2)] * d[n + 1]
            return div(n * (n + 1), 2)
        end
        n += 1
        if divisors < d[n] * d[div(n + 1, 2)]
            return div(n * (n + 1), 2)
        end
        n += 1
    end
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem012(N))
end
