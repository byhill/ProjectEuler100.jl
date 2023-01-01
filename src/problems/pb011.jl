export problem011


"""
    problem011()

Problem 011 of Project Euler.

https://projecteuler.net/problem=011

Since Julia uses column-major order, for simplicity, the grid is transposed.
Assumes the grid is 20x20.
"""
function problem011(N::Int=4, filename::AbstractString="txt/pb011.txt")
    strings = readlines(filename)
    d = length(strings)
    M = zeros(Int, d, d)
    for (i, string) in enumerate(strings)
        for (j, n) in enumerate(split(string, " "))
            M[j, i] = parse(Int, n)
        end
    end

    grid_products = Int[]

    for x = 1:d, y = 1:d
        # check horixonal row rightwards
        x + N - 1 <= d && push!(grid_products, prod(M[y, i] for i = x:x+N-1))

        # check vertical row downwards
        y + N - 1 <= d && push!(grid_products, prod(M[i, x] for i = y:y+N-1))

        # check down-right diagonal
        x + N - 1 <= d && y + N - 1 <= d && push!(grid_products, prod(M[y+i, x+i] for i = 0:N-1))

        # check down-left diagonal
        y + N - 1 <= d && x - N + 1 >= 1 && push!(grid_products, prod(M[y+i, x-i] for i = 0:N-1))
    end

    return maximum(grid_products)
end
