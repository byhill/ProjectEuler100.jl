const MOD = 10^9 + 7


function problem028(spiral_size)
    n = (spiral_size - 1) >> 1 % MOD
    return (16powermod(n, 3, MOD) % MOD + 30powermod(n, 2, MOD) % MOD + 26n % MOD + 3) * invmod(3, MOD) % MOD
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem028(N))
end
