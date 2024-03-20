function problem025(num_digits::Integer)
    phi = (1 + sqrt(5)) / 2
    return ceil(Int, (num_digits - 1 + 0.5log10(5)) / log10(phi))
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem025(N))
end
