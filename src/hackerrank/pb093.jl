using .Iterators

const reachable = Int[]


function last_reachable(A)
    find_reachable([n // 1 for n in A])

    sort!(reachable)
    unique!(reachable)
    I = first(i for i in countfrom() if i > lastindex(reachable) || i != reachable[i]) - 1
    empty!(reachable)
    return I
end


function find_reachable(S)
    if isone(length(S))
        n = S[1]
        isone(denominator(n)) && n > 0 && push!(reachable, numerator(n))

    else
        newS = Rational{Int}[]

        for (i, n1) in enumerate(S), (j, n2) in collect(enumerate(S))[i+1:end]
            copy!(newS, S)
            deleteat!(newS, (i, j))

            find_reachable(push!(newS, n1 + n2))
            pop!(newS)

            find_reachable(push!(newS, n1 - n2))
            pop!(newS)

            find_reachable(push!(newS, n2 - n1))
            pop!(newS)

            find_reachable(push!(newS, n1 * n2))
            pop!(newS)

            n2 != 0 && find_reachable(push!(newS, n1 // n2))
            n2 != 0 && pop!(newS)

            n1 != 0 && find_reachable(push!(newS, n2 // n1))
            n1 != 0 && pop!(newS)
        end
    end
end


function problem093(S)
    return last_reachable(S)
end


m = parse(Int, readline())
S = [parse(Int, n) for n in split(readline(), " ")]
println(problem093(S))
