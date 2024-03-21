module Problem039


"""
    problem039()

Problem 039 of Project Euler.

https://projecteuler.net/problem=039
"""
function problem039(N::Integer=1000)
    perimeters = zeros(Int, N)
    for m = 2:isqrt(N), n = m-1:-2:1
        gcd(m, n) != 1 && continue
        a = m^2 - n^2
        b = 2m * n
        c = m^2 + n^2
        perimeters[(a+b+c):(a+b+c):N] .+= 1
    end

    return argmax(perimeters)
end


export problem039
end  # module Problem039
using .Problem039
export problem039
