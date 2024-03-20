function problem013(numdigits::Integer, A)
    x = sum(parse(BigInt, string) for string in A)
    return parse(Int, string(x)[1:numdigits])
end


N = parse(Int, readline())
A = String[]
for _ in 1:N
    push!(A, readline())
end
println(problem013(10, A))
