module Problem096

using .Iterators: flatten, product


"""
    problem096()

Problem 096 of Project Euler.

https://projecteuler.net/problem=096
"""
function problem096(filename="txt/pb096.txt")
    filestring = readlines(filename)

    ans = 0
    for i in 1:length(filestring)÷10
        M::Matrix{Int} = vcat(([parse(Int, n) for n in line]' for line in filestring[10*(i-1)+2:10i])...)
        solve_soduku!(M)
        ans += 100M[1, 1] + 10M[1, 2] + M[1, 3]
    end
    return ans
end


function solve_soduku!(M)
    return solve_soduku!(M, 1)
end


function solve_soduku!(M, i)
    i > 81 && return true
    if M[i] != 0
        return solve_soduku!(M, i + 1)
    end

    digits = collect(1:9)
    setdiff!(digits, M[:, column(i)])
    setdiff!(digits, M[row(i), :])
    setdiff!(digits, M[box(i)])

    for d in digits
        M[i] = d
        solve_soduku!(M, i + 1) && return true
    end
    M[i] = 0
    return false
end


@inline function column(i::Integer)
    return (i - 1) ÷ 9 + 1
end


@inline function row(i::Integer)
    return mod1(i, 9)
end


@inline function box(i::Integer)
    row = mod(i - 1, 9) ÷ 3
    column = (i - 1) ÷ 27
    return collect(flatten(27column + 3row + 1 + i + 9j for (i, j) in product(0:2, 0:2)))
end


export problem096
end  # module Problem096
using .Problem096
export problem096
