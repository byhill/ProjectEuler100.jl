export sumto, ispalindrome

"""
    sumto(n::Integer)

Returns 1 + 2 + ... + (n - 1) + n.

Takes constant time.  Unsafe (overflow can occur).
"""
sumto(n::Integer) = n * (n + 1) ÷ 2


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
