const MOD = 10^9 + 7


function problem015(w::Integer=20, h::Integer=20)
    return binomial(big(w + h), big(w)) % MOD
end


T = parse(Int, readline())
for _ in 1:T
    (N, M) = Tuple(parse(Int, n) for n in split(readline(), " "))
    println(problem015(N, M))
end
