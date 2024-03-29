function problem071(h, k, n)
    _, x, y = .-gcdx(k, h)
    r = div(n + y, k)
    println("$(x + r * h) $(k * r - y)")
end


T = parse(Int, readline())
for _ in 1:T
    (a, b, N) = Tuple(parse(Int, n) for n in split(readline(), " "))
    problem071(a, b, N)
end
