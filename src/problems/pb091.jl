module Problem091


"""
    problem091()

Problem 091 of Project Euler.

https://projecteuler.net/problem=091

If the right angle is on the origin, there are N^2 ways to make a right triangle.
If the right angle is on either axis, there are N^2 ways for each axis.

If the right angle is in the interior of the grid,
then for each point P = (x, y) such the P is "above" Q,
their are either y * gcd(x, y) / x triangles (if the bottom of the grid is the limiting factor),
or (N - x) * gcd(x, y) / y triangles (if the far vertical axis is the limiting factor).
By symmetry (since the y coordinate of P and Q can't be the same),
the number of triangles which P is the right angle is the same as which Q is the right angle.

This leads to the O(N^2 log(N)) formula

    3N^2 + 2⋅∑∑ min(y * gcd(x, y) / x, (N - x) * gcd(x, y) / y)
"""
function problem091(N::Integer=50)
    return 3N^2 + 2sum(min(y * gcd(x, y) ÷ x, (N - x) * gcd(x, y) ÷ y) for y in 1:N, x in 1:N)
end


export problem091
end  # module Problem091
using .Problem091
export problem091
