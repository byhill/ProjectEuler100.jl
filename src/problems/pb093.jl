module Problem093

using Combinatorics: combinations
using .Iterators


function findreachable(S)
    reachable = Set{Int}()
    if length(S) == 1
        n = S[1]
        push!(reachable, denominator(n) == 1 ? numerator(n) : 0)
    else
        for (i, n1) in enumerate(S), n2 in S[i+1:end]
            newS = setdiff(S, n1, n2)
            union!(reachable, findreachable([newS; [n1 + n2]]))
            union!(reachable, findreachable([newS; [n1 - n2]]))
            union!(reachable, findreachable([newS; [n2 - n1]]))
            union!(reachable, findreachable([newS; [n1 * n2]]))
            n2 ≠ 0 && union!(reachable, findreachable([newS; [n1 / n2]]))
            n1 ≠ 0 && union!(reachable, findreachable([newS; [n2 / n1]]))
        end
    end
    return reachable
end


function seqlength(S)
    reachable = findreachable([n // 1 for n in S])
    for n in countfrom()
        n ∉ reachable && return n - 1
    end
    return 0

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
    return maximum((seqlength(S), parse(Int, join(S))) for S in combinations(1:9, 4))[2]
end


export problem093
end  # module Problem093
using .Problem093
export problem093
