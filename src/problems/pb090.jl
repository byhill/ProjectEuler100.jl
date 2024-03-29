module Problem090

using Combinatorics: combinations, permutations, with_replacement_combinations


"""
    problem090()

Problem 090 of Project Euler.

https://projecteuler.net/problem=090
"""
function problem090(N::Int=9, D::Int=2)
    squares = [replace(digits(n^2; pad=D), 9 => 6) for n = 1:N]
    for sq in squares
        replace!(sq, 9 => 6)
    end

    function isvalid(dice)
        all(any(all(d in die for (d, die) in zip(n, dice)) for n in permutations(sq)) for sq in squares)
    end

    dice = collect(combinations([collect(0:8); [6]], 6))
    sum(1 for dicecomb in with_replacement_combinations(dice, D) if isvalid(dicecomb))
end



export problem090
end  # module Problem090
using .Problem090
export problem090
