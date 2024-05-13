const minimial_productsums = Int[]


function problem088(K::Integer)
    resize!(minimial_productsums, K)
    fill!(minimial_productsums, typemax(Int))
    minimial_productsums[1] = 0

    productsum(1, 0, 0, 2, K)

    return sum(unique(minimial_productsums))
end


function productsum(p, s, l, a, K)
    l += 1
    for n in a:div(2K, p)
        product = p * n
        sum = s + n
        k = product - sum + l
        k <= K || break
        minimial_productsums[k] = min(minimial_productsums[k], product)
        productsum(product, sum, l, n, K)
    end
end


N = parse(Int, readline())
println(problem088(N))
