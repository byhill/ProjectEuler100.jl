using .Iterators


function problem040(I::NTuple{7,Int})
    return prod(champernownes_constant_digit(i) for i in I)
end


function champernownes_constant_digit(n::Integer)
    for i in countfrom()
        c = i * 9 * 10^(i - 1)
        if n - c > 0
            n -= c
        else
            n -= 1
            c = 10^(i - 1) + div(n, i)
            digs = digits(c)
            reverse!(digs)
            return digs[n%i+1]
        end
    end
end


T = parse(Int, readline())
for _ in 1:T
    I = Tuple(parse(Int, i) for i in split(readline(), " "))
    println(problem040(I))
end
