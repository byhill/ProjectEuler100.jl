module Problem082


"""
    problem082()

Problem 082 of Project Euler.

https://projecteuler.net/problem=082

Dynamic programming column-by-column
"""
function problem082(filename="txt/pb082.txt")
    M = vcat(([parse(Int, n) for n in split(line, ",")]' for line in readlines(filename))...)
    L1 = size(M, 1)
    L2 = size(M, 2)

    column = zeros(Int, L1)
    s1 = zeros(Int, L1)  # Sum from M[1, k] to M[i-1, k]
    s2 = zeros(Int, L1)  # Sum from M[i+1, k] to M[L, k]
    for k in 2:L2
        copy!(column, M[:, k])

        fill!(s1, 0)
        for i in 2:L1
            s1[i] = s1[i-1] + column[i-1]
        end
        fill!(s2, 0)
        for i in L1-1:-1:1
            s2[i] = s2[i+1] + column[i+1]
        end

        for i in 1:L1
            column[i] += min(
                M[i, k-1],
                minimum(s1[i] - s1[j] + M[j, k-1] for j in 1:i-1; init=typemax(Int)),
                minimum(s2[i] - s2[j] + M[j, k-1] for j in i+1:L1; init=typemax(Int)),
            )
        end
        M[:, k] = column
    end

    return minimum(M[:, end])
end


export problem082
end  # module Problem082
using .Problem082
export problem082
