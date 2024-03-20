module Problem022

const UPPER_CASE_CORRECTION = -64


"""
    problem022()

Problem 022 of Project Euler.

https://projecteuler.net/problem=022
"""
function problem022(filename="txt/pb022.txt")
    names = split(replace(readline(filename), "\"" => ""), ",")
    sort!(names)

    namescore(name) = sum(Int(c) + UPPER_CASE_CORRECTION for c in name; init=zero(Int64))

    return sum(i * namescore(name) for (i, name) in enumerate(names))
end


export problem022
end  # module Problem022
using .Problem022
export problem022
