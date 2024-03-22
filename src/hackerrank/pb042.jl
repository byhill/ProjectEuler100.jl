@inline issquare(n::Integer) = isqrt(n)^2 == n


function problem042(t::Integer)
    return issquare(8t + 1) ? div(-1 + isqrt(1 + 8t), 2) : -1
end


T = parse(Int, readline())
for _ in 1:T
    t = parse(Int, readline())
    println(problem042(t))
end
