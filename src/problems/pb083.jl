module Problem083

using OffsetArrays: Origin


"""
    problem083()

Problem 083 of Project Euler.

https://projecteuler.net/problem=083

Bellman-Ford
"""
function problem083(filename="txt/pb083.txt")
    M::Matrix{Int} = vcat(([parse(Int, n) for n in split(line, ",")]' for line in readlines(filename))...)
    L1 = size(M, 1)
    L2 = size(M, 2)

    D = Origin(0, 0)(fill(Inf, L1 + 2, L2 + 2))
    D[1, 1] = M[1, 1]

    flag = true
    while flag
        flag = false
        for j in 1:L2
            for i in 1:L1
                d = M[i, j] + min(D[i-1, j], D[i, j-1], D[i, j+1], D[i+1, j])
                if d < D[i, j]
                    D[i, j] = d
                    flag = true
                end
            end
        end
    end

    return round(Int, D[L1, L2])
end


export problem083
end  # module Problem083
using .Problem083
export problem083
