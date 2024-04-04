module Problem088

const minimal_productsum = Dict{Int,Int}()


"""
    problem088()

Problem 088 of Project Euler.

https://projecteuler.net/problem=088

For every k, 2k = k + 2 + (k - 2)⋅1 is product-sum number of size k.

If n = n1 ⋅ n2 ⋯ n_l, then n = n1 + n2 + ⋯ + n_l + (n - n1 + n2 + ⋯ + n_l)⋅1.
"""
function problem088(K::Int=12000)
    empty!(minimal_productsum)
    for k in 2:K
        minimal_productsum[k] = 2k
    end

    for a in 2:isqrt(2K)
        productsum(a, a, 2, a, K)
    end
    return sum(unique(values(minimal_productsum)))
end


function productsum(p, s, l, a, K)
    for n in a:2K÷p
        product = p * n
        sum = s + n
        k = product - sum + l
        k ≤ K && product < minimal_productsum[k] && (minimal_productsum[k] = product)
        productsum(product, sum, l + 1, n, K)
    end
end


export problem088
end  # module Problem088
using .Problem088
export problem088
