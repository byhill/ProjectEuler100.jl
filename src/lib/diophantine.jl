"""
    bezouts([T,], a::Integer, b::Integer, d::Integer)

Gives a solution (x, y) to ax + by = d, if one exits.
If a type `T` is provided, calculates the answer using type `T`.
Throws a `DomainError` if `d` does not divide gcd(`a`, `b`).
"""
bezouts(a::Integer, b::Integer, d::Integer) = bezouts(typeof(d), a, b, d)

function bezouts(T::Type{<:Integer}, a::Integer, b::Integer, d::Integer)
    if mod(d, gcd(a, b)) != 0
        throw(DomainError((a, b, d), "$d does not divide gcd($a, $b)"))
    end

    (r₋₁, r) = (T(a), T(b))
    (s₋₁, s) = (one(T), zero(T))
    (t₋₁, t) = (zero(T), one(T))
    while r ≠ 0
        q = r₋₁ ÷ r
        (r₋₁, r) = (r, r₋₁ - q * r)
        (s₋₁, s) = (s, s₋₁ - q * s)
        (t₋₁, t) = (t, t₋₁ - q * t)
    end
    m = d ÷ r₋₁
    x = m * s₋₁
    y = m * t₋₁
    return (x, y)
end

"""
    pells_equation_fundamental_solution(D::Integer)

Finds the fundamental solution to the Diophantine equation
```math
x^2 - Dy^2 = 1.
```
"""
function pells_equation_fundamental_solution(D::Integer)
    s = isqrt(D)
    t = 1
    p = BigInt[1, s]
    q = BigInt[0, 1]
    x = s
    y = 1
    while x^2 - D * y^2 != 1
        t = (D - s^2) ÷ t
        a = (isqrt(D) + s) ÷ t
        s = t * a - s
        push!(p, a * p[end] + p[end-1])
        push!(q, a * q[end] + q[end-1])
        x = p[end]
        y = q[end]
    end
    return (x, y)
end
