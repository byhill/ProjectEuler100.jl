module Problem065


"""
    problem065()

Problem 065 of Project Euler.

https://projecteuler.net/problem=065
"""
function problem065(N::Integer=100)
    p, q = big(1), big(2)
    for n in 2:N
        p, q = q, (iszero(mod(n, 3)) ? 2(n + 1) ÷ 3 : 1) * q + p
    end

    return sum(digits(q))
end


export problem065
end  # module Problem065
using .Problem065
export problem065
