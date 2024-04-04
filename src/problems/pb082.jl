module Problem082


"""
    problem082()

Problem 082 of Project Euler.

https://projecteuler.net/problem=082

Dynamic programming column-by-column
"""
function problem082(filename="txt/pb082.txt")
    M::Matrix{Int} = vcat(([parse(Int, n) for n in split(line, ",")]' for line in readlines(filename))...)
    @assert size(M, 1) == size(M, 2)
    L = size(M, 1)

    column = zeros(Int, L)
    for k in 2:L
        copy!(column, M[:, k])

        s1 = zeros(Int, L)  # Sum from M[1, k] to M[i-1, k]
        for i in 2:L
            s1[i] = s1[i-1] + column[i-1]
        end
        s2 = zeros(Int, L)  # Sum from M[i+1, k] to M[L, k]
        for i in L-1:-1:1
            s2[i] = s2[i+1] + column[i+1]
        end

        for i in 1:L
            column[i] += min(
                M[i, k-1],
                minimum(s1[i] - s1[j] + M[j, k-1] for j in 1:i-1; init=typemax(Int)),
                minimum(s2[i] - s2[j] + M[j, k-1] for j in i+1:L; init=typemax(Int)),
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
