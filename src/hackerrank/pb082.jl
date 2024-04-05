function problem082()
    L = parse(Int, readline())
    M = vcat(([parse(Int, n) for n in split(line, " ")]' for line in readlines())...)

    column = zeros(Int, L)
    s1 = zeros(Int, L)  # Sum from M[1, k] to M[i-1, k]
    s2 = zeros(Int, L)  # Sum from M[i+1, k] to M[L, k]
    for k in 2:L
        copy!(column, M[:, k])

        fill!(s1, 0)
        for i in 2:size(M, 1)
            s1[i] = s1[i-1] + column[i-1]
        end
        fill!(s2, 0)
        for i in size(M, 1)-1:-1:1
            s2[i] = s2[i+1] + column[i+1]
        end

        column[1] += min(
            M[1, k-1],
            minimum(s2[1] - s2[j] + M[j, k-1] for j in 1+1:L),
        )
        for i in 2:L-1
            column[i] += min(
                M[i, k-1],
                minimum(s1[i] - s1[j] + M[j, k-1] for j in 1:i-1),
                minimum(s2[i] - s2[j] + M[j, k-1] for j in i+1:L),)
        end
        column[L] += min(
            M[L, k-1],
            minimum(s1[L] - s1[j] + M[j, k-1] for j in 1:L-1),
        )
        M[:, k] = column
    end

    return minimum(M[:, end])
end


println(problem082())
