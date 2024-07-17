function problem094(N)
    perimeters = 0
    x = 2
    v = 1

    while true
        p1 = 12v^2 + 4
        p2 = 24v^2 + 12v * x + 2
        p1 > N && return perimeters
        perimeters += p1
        p2 <= N && (perimeters += p2)
        x, v = 2x + 3v, x + 2v
    end
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem094(N))
end
