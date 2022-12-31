export problem009


"""
    problem009()

Problem 009 of Project Euler.

https://projecteuler.net/problem=009

All Pythagorean triples (a, b, c) are generated by positive integers m, n, k by
    a = k(m^2 - n^2)
    b = 2kmn
    c = k(m^2 + n^2),
where m > n, and m and n are coprime and not both odd.

Uniqueness is proven.
"""
function problem009(N::Int=1000)
    pythagorean_products = Int[]

    for m = 2:isqrt(N), n = m-1:-2:1
        gcd(m, n) == 1 || continue

        a = m^2 - n^2
        b = 2m * n
        c = m^2 + n^2
        k = N ÷ (a + b + c)

        k * (a + b + c) == N && push!(pythagorean_products, k^3 * a * b * c)
    end

    return length(pythagorean_products) == 1 ? pythagorean_products[1] : pythagorean_products
end
