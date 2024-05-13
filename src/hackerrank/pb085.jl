function problem085(N::Integer)
    area = 0
    diff = N
    for a in 1:ceil(Int, (-1 + sqrt(1 + 8N)) / 2)
        bfloat = (-1 + sqrt(1 + 16N / (a * (a + 1)))) / 2
        for b in (floor(Int, bfloat), ceil(Int, bfloat))
            r = div(a * (a + 1) * b * (b + 1), 4)
            if abs(r - N) <= diff && a * b > area
                diff, area = abs(r - N), a * b
            end
        end
    end

    return area
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem085(N))
end
