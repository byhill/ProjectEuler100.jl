module Problem006


sumtosq(n) = n * n * (n + 1) * (n + 1) ÷ 4
sumsquaresto(n) = n * (n + 1) * (2n + 1) ÷ 6


"""
    problem006()

Problem 006 of Project Euler.

https://projecteuler.net/problem=006

Faulhaber's formula gives sum of squares
"""
function problem006(N::Integer=100)
    return sumtosq(N) - sumsquaresto(N)
end


export problem006
end  # module Problem006
using .Problem006
export problem006
