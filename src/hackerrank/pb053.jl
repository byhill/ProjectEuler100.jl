function problem053(N::Integer=100, K::Integer=10^6)
    pascals_triangle = [ones(Int, (n + 2) >> 1) for n in 1:N]
    flag = false
    c = 0
    for n in 2:N
        for k in 2:div(n + 1, 2)
            pascals_triangle[n][k] = min(pascals_triangle[n-1][k-1] + pascals_triangle[n-1][k], K)
            pascals_triangle[n][k] == K && (flag = true; c += 2 * (div(n + 1, 2) - k + 1); break)
        end
        if flag && iseven(n)
            c += 1
        elseif iseven(n)
            pascals_triangle[n][div(n, 2)+1] = min(2pascals_triangle[n-1][div(n, 2)], K)
            pascals_triangle[n][div(n, 2)+1] == K && (flag = true; c += 1)
        end
    end

    return c
end


(N, K) = Tuple(parse(Int, n) for n in split(readline(), " "))
println(problem053(N, K))
