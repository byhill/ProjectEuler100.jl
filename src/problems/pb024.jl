module Problem024


"""
    problem024()

Problem 024 of Project Euler.

https://projecteuler.net/problem=024
"""
function problem024(N::Integer=10^6)
    digits = collect(0:9)
    p = 0
    count = 0

    for i in 9:-1:0
        j = (N - 1 - count) ÷ factorial(i)
        p = 10p + digits[j+1]
        deleteat!(digits, j + 1)
        count += j * factorial(i)
    end

    return p
end


export problem024
end  # module Problem024
using .Problem024
export problem024
