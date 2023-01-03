export problem057


"""
    problem057()

Problem 057 of Project Euler.

https://projecteuler.net/problem=057
"""
function problem057(N::Integer=1000)
    c = 0
    (p2, p1) = (BigInt(1), BigInt(3))
    (q2, q1) = (BigInt(1), BigInt(2))
    for _ in 2:N
        (p2, p1) = (p1, 2p1 + p2)
        (q2, q1) = (q1, 2q1 + q2)
        ndigits(p1) > ndigits(q1) && (c += 1)
    end
    return c
end
