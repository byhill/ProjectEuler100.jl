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

