sumto(n) = div(n * (n + 1), 2)


function problem001(N::Integer=1000)
    N -= 1
    return 3sumto(div(N, 3)) + 5sumto(div(N, 5)) - 15sumto(div(N, 15))
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem001(N))
end
