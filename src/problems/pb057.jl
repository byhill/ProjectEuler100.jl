module Problem057


"""
    problem057()

Problem 057 of Project Euler.

https://projecteuler.net/problem=057
"""
function problem057(N::Integer=1000)
    ans = 0
    p2, p1 = big(1), big(3)
    q2, q1 = big(1), big(2)
    for i in 2:N
        p2, p1 = p1, 2p1 + p2
        q2, q1 = q1, 2q1 + q2
        ndigits(p1) > ndigits(q1) && (ans += 1)
    end

    return ans
end


export problem057
end  # module Problem057
using .Problem057
export problem057
