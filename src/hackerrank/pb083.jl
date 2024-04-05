function problem083()
    L = parse(Int, readline())
    M = vcat(([parse(Int, n) for n in split(line, " ")]' for line in readlines())...)

    D = fill(Inf, L + 2, L + 2)
    D[2, 2] = M[1, 1]

    flag = true
    while flag
        flag = false
        for j in 2:L+1
            for i in 2:L+1
                d = M[i-1, j-1] + min(D[i-1, j], D[i, j-1], D[i, j+1], D[i+1, j])
                if d < D[i, j]
                    D[i, j] = d
                    flag = true
                end
            end
        end
    end

    return round(Int, D[L+1, L+1])
end


println(problem083())
