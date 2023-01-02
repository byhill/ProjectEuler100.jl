export problem045


"""
    problem045()

Problem 045 of Project Euler.

https://projecteuler.net/problem=045
"""
function problem045(c::Integer=3)
    for n in countfrom(1)
        hexg = n * (2n - 1)
        ispentagonal(hexg) && (c -= 1)
        c == 0 && return hexg
    end
end
