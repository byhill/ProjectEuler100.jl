function problem099(N::Integer)
    base_exp = Tuple{Int,Int}[]
    for _ in 1:N
        push!(base_exp, Tuple(parse(Int, n) for n in split(readline(), " ")))
    end

    K = parse(Int, readline())
    sort!(base_exp; by=x -> x[2] * log(x[1]))
    return join(base_exp[K], " ")
end


N = parse(Int, readline())
println(problem099(N))
