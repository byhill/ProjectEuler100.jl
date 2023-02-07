export problem022


"""
    problem022()

Problem 022 of Project Euler.

https://projecteuler.net/problem=022
"""
function problem022(filename="txt/pb022.txt")
    UPPER_CASE_CORRECTION = -64

    names = split(replace(readline(filename), "\"" => ""), ",")
    sort!(names)

    namescore(name) = sum(Int64(c) + UPPER_CASE_CORRECTION for c in name; init=zero(Int64))

    return sum(i * namescore(name) for (i, name) in enumerate(names))
end
