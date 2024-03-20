module Problem026

using .Iterators

const remainders = Int[]


"""
    problem026()

Problem 026 of Project Euler.

https://projecteuler.net/problem=026
"""
function problem026(N::Integer=1000)
    maxcycle = 0
    m = 0
    for n in N-1:-1:2
        n < maxcycle && return m
        n % 2 == 0 && continue
        n % 5 == 0 && continue
        l = cyclelength(n)
        if l ≥ maxcycle
            maxcycle = l
            m = n
        end
    end

    return m
end


function cyclelength(n::Integer)
    resize!(remainders, n - 1)
    fill!(remainders, 0)

    r = 1
    for i in countfrom()
        r %= n
        !iszero(remainders[r]) && return i - remainders[r]
        remainders[r] = i
        r *= 10
    end
    return 0
end


export problem026
end  # module Problem026
using .Problem026
export problem026
