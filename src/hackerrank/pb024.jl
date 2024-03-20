function problem024(N::Integer)
    digits = Char['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm']
    p = ""
    count = 0

    for i = 12:-1:0
        j = div(N - 1 - count, factorial(i))
        p *= digits[j+1]
        deleteat!(digits, j + 1)
        count += j * factorial(i)
    end

    return p
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem024(N))
end
