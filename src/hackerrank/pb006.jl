sumto(n::Integer) = div(n * (n + 1), 2)
sumsquaresto(n::Integer) = div(n * (n + 1) * (2n + 1), 6)


function problem006(N::Integer)
    return sumto(N)^2 - sumsquaresto(N)
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem006(N))
end
