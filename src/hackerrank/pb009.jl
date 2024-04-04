function problem009(N)
    pythagorean_products = []

    for m in 2:isqrt(N), n = m-1:-2:0
        gcd(m, n) != 1 && continue

        a = m^2 - n^2
        b = 2 * m * n
        c = m^2 + n^2
        (q, r) = divrem(N, (a + b + c))

        iszero(r) && push!(pythagorean_products, q^3 * a * b * c)
    end

    return isempty(pythagorean_products) ? -1 : maximum(pythagorean_products)
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem009(N))
end
