using .Iterators

function problem003(N::Integer)
    for d in countfrom(2)
        d <= isqrt(N) || return N
        while N % d == 0
            N = div(N, d)
        end
        N == 1 && return d
    end
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem003(N))
end
