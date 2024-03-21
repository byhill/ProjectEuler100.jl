module Problem031

using OffsetArrays: Origin
O(A) = Origin(0)(A)


"""
    problem031()

Problem 031 of Project Euler.

https://projecteuler.net/problem=031
"""
function problem031(total::Integer=200)
    coins = (1, 2, 5, 10, 20, 50, 100, 200)
    c = O(zeros(Int, total + 1))  # Offset by 1 due to 1-based indexing.
    c[0] = 1

    for coin in coins
        for n in coin:total
            c[n] += c[n-coin]
        end
    end

    return c[end]
end


export problem031
end  # module Problem031
using .Problem031
export problem031
