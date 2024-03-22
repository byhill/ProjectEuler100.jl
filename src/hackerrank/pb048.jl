const MOD = 10^10


function problem048(N::Integer)
    return sum(powermod(n, n, MOD) for n = 1:N) % MOD
end


N = parse(Int, readline())
println(problem048(N))
