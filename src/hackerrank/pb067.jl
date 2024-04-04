function problem067(triangle)
    for i = length(triangle)-1:-1:1, j in i:-1:1
        triangle[i][j] += max(triangle[i+1][j], triangle[i+1][j+1])
    end

    return triangle[1][1]
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    triangle = []
    for _ in 1:N
        push!(triangle, [parse(Int, n) for n in split(readline(), " ")])
    end
    println(problem067(triangle))
end
