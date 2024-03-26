function problem056(N::Integer)
    return maximum(n -> sum(digits(n)), big(a)^b for a in 1:N-1 for b in 1:N-1)
end


N = parse(Int, readline())
println(problem056(N))
