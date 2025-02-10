module Problem057


"""
    problem057()

Problem 057 of Project Euler.

https://projecteuler.net/problem=057
"""
function problem057(N=1000)
    ans = 0
    p₂, p₁ = big(1), big(3)
    q₂, q₁ = big(1), big(2)
    for _ in 2:N
        p₂, p₁ = p₁, 2p₁ + p₂
        q₂, q₁ = q₁, 2q₁ + q₂
        ndigits(p₁) > ndigits(q₁) && (ans += 1)
    end

    return ans
end


export problem057
end  # module Problem057
using .Problem057
export problem057
