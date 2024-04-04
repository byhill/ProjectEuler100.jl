module Problem081


"""
    problem081()

Problem 081 of Project Euler.

https://projecteuler.net/problem=081

Dynamic programming.
"""
function problem081(filename="txt/pb081.txt")
    M::Matrix{Int} = vcat(([parse(Int, n) for n in split(line, ",")]' for line in readlines(filename))...)
    @assert size(M, 1) == size(M, 2)
    L = size(M, 1)

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


export problem081
end  # module Problem081
using .Problem081
export problem081
