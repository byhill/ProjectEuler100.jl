module Problem053


"""
    problem053()

Problem 053 of Project Euler.

https://projecteuler.net/problem=053

Use Pascal's triangle.  Take advantage of symmetry.
Only calculate exact value of a binomial coefficient if it is less than `L`.
"""
function problem053(N::Integer=100, L::Integer=10^6)
    pascals_triangle = [ones(Int, (n + 2) >> 1) for n in 1:N]
    flag = false  # Set to true once we hit one value for which n choose k exceeds L
    c = 0
    for n in 2:N
        for k in 2:(n+1)÷2
            pascals_triangle[n][k] = min(pascals_triangle[n-1][k-1] + pascals_triangle[n-1][k], L)
            pascals_triangle[n][k] == L && (flag = true; c += 2 * ((n + 1) ÷ 2 - k + 1); break)
        end
        if flag && iseven(n)
            c += 1
        elseif iseven(n)
            pascals_triangle[n][n÷2+1] = min(2pascals_triangle[n-1][n÷2], L)
            pascals_triangle[n][n÷2+1] == L && (flag = true; c += 1)
        end
    end

    return c
end


export problem053
end  # module Problem053
using .Problem053
export problem053
