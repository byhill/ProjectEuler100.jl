export problem055


"""
    problem055()

Problem 055 of Project Euler.

https://projecteuler.net/problem=055
"""
function problem055(N::Integer=10^4)

    function islychrel(n::Integer)
        p = undigits(reverse(digits(n)))
        for _ = 1:50
            n += p
            p = undigits(reverse(digits(n)))
            n == p && return false
        end
        return true
    end

    return count(islychrel, BigInt(1):N)
end
