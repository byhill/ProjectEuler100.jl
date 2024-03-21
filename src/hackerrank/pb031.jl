const MOD = 10^9 + 7


function problem031(total::Integer=200)
    coins = [1, 2, 5, 10, 20, 50, 100, 200]
    c = zeros(Int, total + 1)
    c[1] = 1

    for coin in coins
        for n in coin:total
            c[n+1] += c[n-coin+1]
            c[n+1] %= MOD
        end
    end

    return c
end


T = parse(Int, readline())
c = problem031(10^5)
for _ in 1:T
    N = parse(Int, readline())
    println(c[N+1])
end
