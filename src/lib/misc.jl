export sumto, ilog, concat, undigits
export ispandigital, ispalindrome, issquare, istriangular, ispentagonal, digit_factorial



"""
    sumto(N::Integer)

Returns the sum of the first N positive integers.
"""
@inline sumto(n::Integer) = iseven(n) ? (n >> 1) * (n + 1) : (n + 1) >> 1 * n
@inline sumto(n::Integer, m::Integer) = iseven(n) ? mod(mod(n >> 1, m) * mod(n + 1, m), m) : mod(mod((n + 1) >> 1, m) * mod(n, m), m)


"""
    ilog(base::Integer, n::Integer)

Returns the largest p such that base^p ≤ n.
"""
@inline function ilog(base, n)
    p = 0
    m = one(n)
    L = n ÷ base
    while m ≤ L
        m *= base
        p += 1
    end

    return p
end


"""
    concat(xs...; base::T=10) where {T<:Integer}

Returns the equivalent of T(reduce(*, (string(x) for x in xs))).
"""
@inline function concat(xs::T...; base=10) where {T<:Integer}
    return foldl((n, x) -> n * T(base)^ndigits(x; base=base) + x, xs; init=zero(T))
end


"""
    undigits(d::Vector{T}; base=10) where T<:Integer

The inverse of digits(n), i.e.,

    n = undigits(digits(n; base=b); base=b).
"""
undigits(digits::Vector{T}; base::Integer=10) where {T<:Integer} = undigits(T, digits; base=base)

function undigits(T::Type{<:Integer}, digits::Vector{U}; base::Integer=10) where {U<:Integer}
    return foldr((a, b,) -> b * base + a, digits, init=zero(T))
end


"""
    ispalindrome(n::Integer)

Returns true if and only if n is an integer.
"""
function ispalindrome(n::Integer; base::Integer=typeof(n)(10))
    n < 0 && return false
    base > 1 || throw(DomainError(base, "base must be > 1"))
    base > n && return true
    b = typeof(n)(base)

    m = n
    p = zero(n)
    while m > 0
        m, r = divrem(m, b)
        p = p * b + r
    end

    return n == p
end


"""
    ispandigital(n::Integer; base::Integer=10; zeroless::Bool=false; N::Integer=base-1)

Returns true if and only if n is a 0-N pandigital number in base `base`.

If `zeroless = true`,
returns true if and only if n is a 1-N pandigital number in base `base`.
"""
function ispandigital(n::Integer; base::Integer=10, zeroless::Bool=false, N::Integer=base - 1)
    N ≥ base && return false

    digits = falses(base)
    zeroless && (digits[0+1] = true)
    while n > 0
        (n, r) = divrem(n, base)
        digits[r+1] = true
    end

    return all(digits[1:N+1])
end


"""
    issquare(n::Integer)

Returns `true` if and only if `n` is a perfect square
"""
@inline issquare(n::Integer) = isqrt(n)^2 == n


"""
    istriangular(n::Integer)

Returns `true` if and only if `n` is a Triangular number m * (m + 1) ÷ 2.  Unsafe
"""
@inline istriangular(n::Integer) = issquare(1 + 8n)


"""
    is_pentagonal(n::Integer)

Returns true if an only if `n` is a pentagonal number.  Unsafe.
"""
@inline function ispentagonal(n::Integer)
    m = 1 + 24n
    return issquare(m) && isqrt(m) % 6 == 5
end


const DIGIT_FACTORIAL = (1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 1)


"""
    digits_factorial(n::Integer)

Returns the sum of the factorial of each digit in `n` (in base 10).
"""
function digit_factorial(n::T) where {T<:Integer}
    n < 0 && throw(DomainError(n, "n must be a nonnegative integer"))
    n == 0 && return one(T)

    s = zero(T)
    while n > 0
        s += T(DIGIT_FACTORIAL[mod1(n, 10)])
        n ÷= T(10)
    end

    return s
end
