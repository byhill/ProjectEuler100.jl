module Problem040

using .Iterators


"""
    problem040()

Problem 040 of Project Euler.

https://projecteuler.net/problem=040
"""
function problem040()
    return prod(champernownes_constant_digit(10^i) for i in 0:6)
end


function champernownes_constant_digit(n::Integer)
    for i in countfrom()
        c = i * 9 * 10^(i - 1)
        if n - c > 0
            n -= c
        else
            n -= 1
            c = 10^(i - 1) + div(n, i)
            digs = digits(c)
            reverse!(digs)
            return digs[n%i+1]
        end
    end
end


export problem040
end  # module Problem040
using .Problem040
export problem040
