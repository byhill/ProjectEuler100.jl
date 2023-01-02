export problem032


"""
    problem032()

Problem 032 of Project Euler.

https://projecteuler.net/problem=032
"""
function problem032()
    pandigital_products = Int[]
    for n = 1:99, m = 1:10000
        x = concat(n, m, n * m)
        ndigits(x) != 9 && continue
        ispandigital(x; zeroless=true) && push!(pandigital_products, n * m)
    end

    return sum(unique(pandigital_products); init=0)
end
