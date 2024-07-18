const INDICES = NTuple{21,Int}[]

resize!(INDICES, 81)
for i in 1:81
    indices = Int[]

    row = mod1(i, 9)
    for j in 1:9
        push!(indices, row + 9 * (j - 1))
    end

    column = div(i - 1, 9) + 1
    for j in 1:9
        push!(indices, 9 * (column - 1) + j)
    end

    row = div(mod(i - 1, 9), 3)
    column = div(i - 1, 27)
    for j in 0:2, k in 0:2
        push!(indices, 27column + 3row + 1 + j + 9k)
    end

    sort!(indices)
    unique!(indices)
    INDICES[i] = Tuple(indices)
end


function solve_soduku!(M)
    return solve_soduku!(M, 1)
end


function solve_soduku!(M, i)
    i > 81 && return true

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


function problem096(M)
    solve_soduku!(M)
end


filestring = readlines()
M = vcat(([parse(Int, n) for n in line]' for line in filestring)...)
problem096(M)
for i in 1:9
    println(join(M[i, :]))
end
