using .Iterators

const remainders = Int[]


function problem026(N::Integer)
    maxcycle = 0
    m = 0
    for n in N-1:-1:2
        n < maxcycle && return m
        n % 2 == 0 && continue
        n % 5 == 0 && continue
        l = cyclelength(n)
        if l >= maxcycle
            maxcycle = l
            m = n
        end
    end

    return m
end


function cyclelength(n::Integer)
    resize!(remainders, n - 1)
    fill!(remainders, 0)

    r = 1
    for i in countfrom()
        r %= n
        !iszero(remainders[r]) && return i - remainders[r]
        remainders[r] = i
        r *= 10
    end
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem026(N))
end
