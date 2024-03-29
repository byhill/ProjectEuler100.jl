module Problem100


"""
    problem100()

Problem 100 of Project Euler.

https://projecteuler.net/problem=100

If b represents the number of blue balls and red represents the number of red balls,
then

    b(b-1)/((b + r)(b + r - 1)) = 1/2.

Solving for b yields

    b = (1 + 2r + sqrt(8r^2 + 1))/2.

Therefore, we require 8r^2 + 1 be an odd perfect square.
We use Pell's equation to solve x^2 - 8r^2 = 1.
"""
function problem100(L::Integer=10^12)
    x, r = 3, 1
    while true
        (x, r) = (3x + 8r, 3r + x)
        total = 2r + (1 + x) ÷ 2
        if isodd(x) && total > L
            return total - r
        end
    end
end


export problem100
end  # module Problem100
using .Problem100
export problem100
