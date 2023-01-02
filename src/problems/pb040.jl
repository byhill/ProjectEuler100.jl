export problem040


"""
    problem040()

Problem 040 of Project Euler.

https://projecteuler.net/problem=040
"""
function problem040()

    function champernownes_constant_digit(n::Integer)
        for i in countfrom(1)
            c = i * 9 * 10^(i - 1)
            if n - c > 0
                n -= c
            else
                n -= 1
                c = 10^(i - 1) + n ÷ i
                return reverse(digits(c))[n % i + 1]
            end
        end
    end

    return prod(champernownes_constant_digit(10^i) for i = 0:6)
end
