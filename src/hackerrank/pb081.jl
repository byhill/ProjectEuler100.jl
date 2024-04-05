function problem081()
    L = parse(Int, readline())
    M = vcat(([parse(Int, n) for n in split(line, " ")]' for line in readlines())...)

    for i in 2:L
        M[i, 1] += M[i-1, 1]
    end
    for j in 2:L
        M[1, j] += M[1, j-1]
        for i in 2:L
            M[i, j] += min(M[i-1, j], M[i, j-1])
        end
    end

    return M[end, end]
end


println(problem081())
