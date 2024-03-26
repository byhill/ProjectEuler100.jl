module ContinuedFractions

using ..ProjectEuler100

export quadratic_integer_continued_fraction

struct ContinuedFraction  # (a + b*sqrt(c)) / d
    x::BigInt
    y::BigInt
    sq::BigInt
    z::BigInt
end


"""
    quadratic_integer_continued_fraction(sq, x=0, z=1, y=1)

Iterates over convergents of the continued fraction (x + y*sqrt(sq)) / z.
"""
function quadratic_integer_continued_fraction(sq, x=0, z=1, y=1)
    iszero(z) && return DomainError(z, "The denominator in a quadratic integer can't be 0")
    if issquare(sq)
        x += y * isqrt(sq)
        sq = 0
    end

    g = gcd(x, y, z)
    return ContinuedFraction(x ÷ g, y ÷ g, sq, z ÷ g)
end

function Base.iterate(itr::ContinuedFraction)
    x = itr.x
    y = itr.y
    sq = itr.sq
    z = itr.z

    a = (x + y * isqrt(sq)) ÷ z
    P = a
    Q = 1

    x -= a * z

    xn = z * -x
    yn = z * y
    zn = -x^2 + y^2 * sq
    g = gcd(xn, yn, zn)
    xn ÷= g
    yn ÷= g
    zn ÷= g

    return (a, P, Q), (xn, yn, zn, P, big(1), Q, big(0))
end


function Base.iterate(itr::ContinuedFraction, state)
    sq = itr.sq
    (x, y, z, P1, P0, Q1, Q0) = state

    iszero(x) && iszero(sq) && return nothing

    a = (x + y * isqrt(sq)) ÷ z
    P = a * P1 + P0
    Q = a * Q1 + Q0

    x -= a * z

    xn = z * -x
    yn = z * y
    zn = -x^2 + y^2 * sq
    g = gcd(xn, yn, zn)
    xn ÷= g
    yn ÷= g
    zn ÷= g

    return (a, P, Q), (xn, yn, zn, P, P1, Q, Q1)
end


Base.IteratorSize(::ContinuedFraction) = Base.SizeUnknown()
Base.eltype(::ContinuedFraction) = Base.Tuple{BigInt,BigInt,BigInt}



end
