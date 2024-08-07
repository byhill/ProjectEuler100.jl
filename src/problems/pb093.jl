module Problem093

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

            n2 ≠ 0 && find_reachable(push!(newS, n1 // n2))
            n2 ≠ 0 && pop!(newS)

            n1 ≠ 0 && find_reachable(push!(newS, n2 // n1))
            n1 ≠ 0 && pop!(newS)
        end
    end
end


"""
    problem093()

Problem 093 of Project Euler.

https://projecteuler.net/problem=093

You can get rid of the need to use brackets
by defining two additional operators,
one for each of the non-commutative operators division and subtraction.
"""
function problem093()
    ans = 0
    maxlength = 0

    for a in 1:6, b in a+1:7, c in b+1:8, d in c+1:9
        I = last_reachable([a, b, c, d])
        I > maxlength || continue
        maxlength = I
        ans = 1000a + 100b + 10c + d
    end

    return ans
end


export problem093
end  # module Problem093
using .Problem093
export problem093
