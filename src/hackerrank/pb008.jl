function problem008(S::String, L::Integer)
    A = [parse(Int, c) for c in S]
    return maximum(prod(A[i-L+1:i]) for i in L:length(A))
end


T = parse(Int, readline())
for _ in 1:T
    (_, K) = Tuple(parse(Int, n) for n in split(readline(), " "))
    A = readline()
    println(problem008(A, K))
end
