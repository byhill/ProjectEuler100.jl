export sumto, sumsquaresto, undigits, ispalindrome

"""
    sumto(n::Integer)

Returns 1 + 2 + ... + (n - 1) + n.

Takes constant time.  Unsafe (overflow can occur).
"""
@inline sumto(n::Integer) = n * (n + 1) ÷ 2


"""
    sumsquaresto(n::Integer)

Returns 1^2 + 2^2 + ... + (n - 1)^2 + n^2.

Takes constant time.  Unsafe (overflow can occur).
"""
@inline sumsquaresto(n::Integer) = n * (n + 1) * (2n + 1) ÷ 6


"""
    undigits(d::Vector{T}; base=10) where T<:Integer

The inverse of digits(n), i.e.,

    n = undigits(digits(n; base=b); base=b).
"""
function undigits(digits::Vector{T}; base::Integer=10) where {T<:Integer}
    return foldr((a, b) -> muladd(base, b, a), digits, init=0)
end

function undigits(T::Type{<:Integer}, digits::Vector{U}; base::Integer=10) where {U<:Integer}
    return foldr((a, b,) -> muladd(base, b, a), digits, init=T(0))
end


"""
    is_palindrome(n::Integer)

Returns true if the Integer n is a palindrome, false otherwise.
"""
function ispalindrome(n::Integer; base::Integer=10)
    m = n
    p = 0
    while m > 0
        p = p * base + m % base
        m ÷= base
    end
    return n == p
end
