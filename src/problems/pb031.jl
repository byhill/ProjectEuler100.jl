export problem031


"""
    problem031()

Problem 031 of Project Euler.

https://projecteuler.net/problem=031

Dynamic programming.
"""
function problem031(total::Integer=200)
    coins = (1, 2, 5, 10, 20, 50, 100, 200)
    c = zeros(Int, total + 1)  # Offset by 1 due to 1-based indexing.
    c[1] = 1

    for coin in coins
        for n in coin:total
            c[n+1] += c[n-coin+1]
        end
    end

    return c[end]
end
