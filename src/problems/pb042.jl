module Problem042

using ..ProjectEuler100

const UPPER_CASE_CORRECTION = -64
triangular_word(word) = istriangular(sum(Int(c) + UPPER_CASE_CORRECTION for c in word))


"""
    problem042()

Problem 042 of Project Euler.

https://projecteuler.net/problem=042
"""
function problem042(filename="txt/pb042.txt")
    words = split(replace(readline(filename), "\"" => ""), ",")
    return count(triangular_word, words)
end


export problem042
end  # module Problem042
using .Problem042
export problem042
