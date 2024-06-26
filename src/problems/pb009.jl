module Problem009


"""
    problem009()

Problem 009 of Project Euler.

https://projecteuler.net/problem=009

All Pythagorean triples (a, b, c) are generated by positive integers m, n, k by
    a = k(m^2 - n^2)
    b = 2kmn
    c = k(m^2 + n^2),
where m > n, and m and n are coprime and not both odd.

Uniqueness is verified.
"""
function problem009(N::Integer=1000)
    pythagorean_products = Int[]

    for m in 2:isqrt(N), n in m-1:-2:1
        isone(gcd(m, n)) || continue

        a = m^2 - n^2
        b = 2m * n
        c = m^2 + n^2
        k = N ÷ (a + b + c)

        k * (a + b + c) == N && push!(pythagorean_products, k^3 * a * b * c)
    end

    isempty(pythagorean_products) && error("There are no right-angled triangles which haver perimeter $N")
    length(pythagorean_products) > 1 && error("There are multiple right-triangles which have perimeter $N")
    return first(pythagorean_products)
end


export problem009
end  # module Problem009
using .Problem009
export problem009
