module Problem053


"""
    problem053()

Problem 053 of Project Euler.

https://projecteuler.net/problem=053

Use Pascal's triangle.  Take advantage of symmetry.
Only calculate exact value of a binomial coefficient if it is less than `L`.
"""
function problem053(N=100, L=10^6)
    ans = 0
    pascals_triangle = [ones(Int, (n + 2) >> 1) for n in 1:N]
    flag = false  # Set to true once we hit one value for which n choose k exceeds L

    for n in 2:N
        for k in 2:(n+1)>>1
            pascals_triangle[n][k] = min(L, pascals_triangle[n-1][k-1] + pascals_triangle[n-1][k])
            if pascals_triangle[n][k] == L
                ans += 2 * ((n + 1) >> 1 - k + 1)
                flag = true
                break
            end
        end

        # Take care of central-binomial coefficients
        if flag && iseven(n)
            ans += 1
        elseif iseven(n)
            pascals_triangle[n][n>>1+1] = min(L, 2pascals_triangle[n-1][n>>1])
            if pascals_triangle[n][n>>1+1] == L
                flag = true
                ans += 1
            end
        end
    end

    return ans
end


export problem053
end  # module Problem053
using .Problem053
export problem053
