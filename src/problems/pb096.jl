module Problem096

const INDICES = NTuple{21,Int}[]


"""
    problem096()

Problem 096 of Project Euler.

https://projecteuler.net/problem=096
"""
function problem096(filename="txt/pb096.txt")
    resize!(INDICES, 81)
    for i in 1:81
        indices = Int[]

        row = mod1(i, 9)
        for j in 1:9
            push!(indices, row + 9 * (j - 1))
        end

        column = (i - 1) ÷ 9 + 1
        for j in 1:9
            push!(indices, 9 * (column - 1) + j)
        end

        row = mod(i - 1, 9) ÷ 3
        column = (i - 1) ÷ 27
        for j in 0:2, k in 0:2
            push!(indices, 27column + 3row + 1 + j + 9k)
        end

        sort!(indices)
        unique!(indices)
        INDICES[i] = Tuple(indices)
    end

    filestring = readlines(filename)

    ans = 0
    for i in 1:length(filestring)÷10
        M::Matrix{Int} = vcat(([parse(Int, n) for n in line]' for line in filestring[10*(i-1)+2:10i])...)
        solve_soduku!(M)
        ans += 100M[1, 1] + 10M[1, 2] + M[1, 3]
    end

    empty!(INDICES)
    return ans
end


function solve_soduku!(M)
    return solve_soduku!(M, 1)
end


function solve_soduku!(M, i)
    i > 81 && return true
    if !iszero(M[i])
        return solve_soduku!(M, i + 1)
    end

    digits = trues(9)
    for j in INDICES[i]
        d = M[j]
        d > 0 && (digits[d] = false)
    end
    for d in 1:9
        digits[d] || continue
        M[i] = d
        solve_soduku!(M, i + 1) && return true
    end

    M[i] = 0
    return false
end


export problem096
end  # module Problem096
using .Problem096
export problem096
