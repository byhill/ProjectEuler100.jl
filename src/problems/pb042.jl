export problem042


"""
    problem042()

Problem 042 of Project Euler.

https://projecteuler.net/problem=042
"""
function problem042(filename="txt/pb042.txt")
    UPPER_CASE_CORRECTION = -64
    words = split(replace(readline(filename), "\"" => ""), ",")
    triangularword(word) = istriangular(sum(Int(c) + UPPER_CASE_CORRECTION for c in word))
    return count(triangularword, words)
end
