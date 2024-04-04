module Problem083


"""
    problem083()

Problem 083 of Project Euler.

https://projecteuler.net/problem=083

Bellman-Ford
"""
function problem083(filename="txt/pb083.txt")
    M::Matrix{Int} = vcat(([parse(Int, n) for n in split(line, ",")]' for line in readlines(filename))...)
    @assert size(M, 1) == size(M, 2)
    L = size(M, 1)
    D = fill(Inf, L + 2, L + 2)
    D[2, 2] = M[1, 1]
    modified = true

    while modified
        modified = false
        for j in 2:L+1
            for i in 2:L+1
                d = M[i-1, j-1] + min(D[i-1, j], D[i, j-1], D[i, j+1], D[i+1, j])
                if d < D[i, j]
                    D[i, j] = d
                    modified = true
                end
            end
        end
    end

    return round(Int, D[L+1, L+1])
end


export problem083
end  # module Problem083
using .Problem083
export problem083
