module Problem088

const minimial_productsums = Int[]


"""
    problem088()

Problem 088 of Project Euler.

https://projecteuler.net/problem=088

If n = n1 ⋅ n2 ⋯ n_l, then n = n1 + n2 + ⋯ + n_l + (n - n1 - n2 - ⋯ - n_l)⋅1.
"""
function problem088(K::Integer=12000)
    resize!(minimial_productsums, K)
    fill!(minimial_productsums, typemax(Int))
    minimial_productsums[1] = 0

    productsum(1, 0, 0, 2, K)

    return sum(unique(minimial_productsums))
end


function productsum(p, s, l, a, K)
    l += 1
    for n in a:2K÷p
        product = p * n
        sum = s + n
        k = product - sum + l
        k ≤ K || break
        minimial_productsums[k] = min(minimial_productsums[k], product)
        productsum(product, sum, l, n, K)
    end
end


export problem088
end  # module Problem088
using .Problem088
export problem088
