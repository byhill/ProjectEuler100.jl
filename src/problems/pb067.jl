export problem067


"""
    problem067()

Problem 067 of Project Euler.

https://projecteuler.net/problem=067

Bottom-up dynamic programming.
"""
function problem067(filename="txt/pb067.txt")
    triangle = Vector{Int}[]
    for line in eachline(filename)
        push!(triangle, [parse(Int, n) for n in split(line, " ")])
    end

    for i = length(triangle)-1:-1:1, j = i:-1:1
        triangle[i][j] += max(triangle[i+1][j], triangle[i+1][j+1])
    end

    return triangle[1][1]
end
