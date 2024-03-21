function problem039(N::Integer)
    perimeters = zeros(Int, N)
    for m = 2:isqrt(N), n = m-1:-2:1
        gcd(m, n) != 1 && continue
        a = m^2 - n^2
        b = 2m * n
        c = m^2 + n^2
        perimeters[(a+b+c):(a+b+c):N] .+= 1
    end

    maxsolns = zeros(Int, N)
    M = perimeters[1]
    for i = 2:N
        maxsolns[i] = perimeters[i] > M ? i : maxsolns[i-1]
        M = max(M, perimeters[i])
    end

    return maxsolns
end


const maxsolns = problem039(5 * 10^6)

T = parse(Int, readline())
for i in 1:T
    N = parse(Int, readline())
    println(maxsolns[N])
end
