function problem011()
    N = 4
    strings = readlines()
    d = length(strings)
    M = zeros(Int, d, d)
    for (i, string) in enumerate(strings)
        for (j, n) in enumerate(split(string, " "))
            M[j, i] = parse(Int, n)
        end
    end

    grid_products = Int[]

    for x in 1:d, y in 1:d
        # check horixonal row rightwards
        x + N - 1 <= d && push!(grid_products, prod(M[y, i] for i in x:x+N-1))

        # check vertical row downwards
        y + N - 1 <= d && push!(grid_products, prod(M[i, x] for i in y:y+N-1))

        # check down-right diagonal
        x + N - 1 <= d && y + N - 1 <= d && push!(grid_products, prod(M[y+i, x+i] for i in 0:N-1))

        # check down-left diagonal
        y + N - 1 <= d && x - N + 1 >= 1 && push!(grid_products, prod(M[y+i, x-i] for i in 0:N-1))
    end

    return maximum(grid_products)
end


println(problem011())
