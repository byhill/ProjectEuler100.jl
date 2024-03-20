module Problem004

using ..ProjectEuler100


"""
    problem004()

Problem 004 of Project Euler.

https://projecteuler.net/problem=004

The problem is mostly brute-force.
"""
function problem004()
    ans = 0
    for x in 999:-1:100
        999x < ans && return ans
        for y in x:-1:100
            x * y < ans && break
            ispalindrome(x * y) && (ans = x * y)
        end
    end

    return ans
end


export problem004
end  # module Problem004
using .Problem004
export problem004
