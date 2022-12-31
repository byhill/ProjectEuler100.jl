export sumto

"""
    sumto(n::Integer)

Returns 1 + 2 + ... + (n - 1) + n.

Takes constant time.  Unsafe (overflow can occur).
"""
sumto(n::Integer) = n * (n + 1) ÷ 2
