export problem026


"""
    problem026(limit::Integer=1000)

Problem 026 of Project Euler.

https://projecteuler.net/problem=026

Essentially just long division.
"""
function problem026(N::Integer=1000)
    N -= 1

    function cyclelength(n::Integer)
        remainders = Dict{Int64,Int64}()
        r = 1
        for i in countfrom(1)
            r %= n
            haskey(remainders, r) && return i - remainders[r]
            remainders[r] = i
            r *= 10
        end
        return 0
    end

    (maxcycle, m) = (0, 0)
    for n in N:-1:2
        n <= maxcycle && return m  # a cycle can't have length >= n.
        (iseven(n) || n % 5 == 0) && continue  # length of cycle of 2^i⋅5^j⋅n is the same as n
        l = cyclelength(n)
        l >= maxcycle && ((maxcycle, m) = (l, n))
    end

    return m
end
