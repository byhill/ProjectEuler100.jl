export problem044


"""
    problem044()

Problem 044 of Project Euler.

https://projecteuler.net/problem=044

Suppose Pn - Pm = Pd = D/2.
Then d(3d - 1) = n(3n - 1) - m(3m - 1) = (n - m)(3n + 3m - 1) = xy,
where x = n - m and y = 3n + 3m - 1.
One can then show that n = (3x + y + 1) / 6, and m = n - x.
Thus suffices to check Pn + Pm is pentagonal.
"""
function problem044()
    for d in countfrom()
        D = d * (3d - 1)
        for x in filter(x -> D % x == 0, 1:isqrt(D))
            y = D ÷ x
            (n, r) = divrem(3x + y + 1, 6)
            r != 0 && continue
            m = n - x
            Pn = n * (3n - 1) ÷ 2
            Pm = m * (3m - 1) ÷ 2
            m > 0 && ispentagonal(Pn + Pm) && return D ÷ 2
        end
    end
end
