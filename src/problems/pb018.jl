module Problem018


"""
    problem018()

Problem 018 of Project Euler.

https://projecteuler.net/problem=018

Bottom-up dynamic programming
"""
function problem018(filename="txt/pb018.txt")
    triangle = Vector{Int}[]
    for line in eachline(filename)
        push!(triangle, [parse(Int, n) for n in split(line, " ")])
    end

    for i in length(triangle)-1:-1:1, j in i:-1:1
        triangle[i][j] += max(triangle[i+1][j], triangle[i+1][j+1])
    end

    return triangle[1][1]
end


export problem018
end  # module Problem018
using .Problem018
export problem018
