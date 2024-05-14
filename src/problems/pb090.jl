module Problem090

using Combinatorics: combinations, permutations, with_replacement_combinations


"""
    problem090()

Problem 090 of Project Euler.

https://projecteuler.net/problem=090
"""
function problem090(N::Integer=9, D::Integer=2)
    squares = [replace(digits(n^2; pad=D), 9 => 6) for n in 1:N]

    function isvalid(dice)
        all(any(all(d in die for (d, die) in zip(n, dice)) for n in permutations(sq)) for sq in squares)
    end

    dice = collect(combinations([collect(0:8); [6]], 6))

    return count(isvalid(dicecomb) for dicecomb in with_replacement_combinations(dice, D))
end



export problem090
end  # module Problem090
using .Problem090
export problem090
