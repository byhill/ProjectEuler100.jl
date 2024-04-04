module Problem086


function cuboids(a::Integer, bc::Integer)
    2a < bc && return 0
    return a ≥ bc ? bc ÷ 2 : a - div(bc - 1, 2)
end


function cuboids(M::Integer)
    total = zeros(Int, M)
    for u in 1:2isqrt(M)
        for v in u-1:-2:1
            gcd(u, v) ≠ 1 && continue
            x = u^2 - v^2
            y = 2u * v
            for k in 1:div(M, x)
                total[k*x] += cuboids(k * x, k * y)
            end
            for k in 1:div(M, y)
                total[k*y] += cuboids(k * y, k * x)
            end
        end
    end

    for t in 2:M
        total[t] += total[t-1]
    end

    return total
end


"""
    problem086()

Problem 086 of Project Euler.

https://projecteuler.net/problem=086
"""
function problem086(M::Int=10^6)
    L = 512
    while true
        n = searchsortedfirst(cuboids(L), M)
        n ≤ L && return n
        L <<= 1
    end
end


export problem086
end  # module Problem086
using .Problem086
export problem086
