function problem075()
    N = 5 * 10^6
    perimeters = zeros(Int, N)
    for m in 2:isqrt(N)
        for n in m-1:-2:1
            isone(gcd(m, n)) || continue
            a = m^2 - n^2
            b = 2m * n
            c = m^2 + n^2
            for k in 1:div(N, a + b + c)
                perimeters[k*(a+b+c)] += 1
            end
        end
    end

    answers = zeros(Int, N)
    for n in 2:N
        answers[n] = answers[n-1] + isone(perimeters[n])
    end

    return answers
end


ans = problem075()
T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(ans[N])
end
