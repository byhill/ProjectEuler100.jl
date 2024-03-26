function undigits(d::Vector{T}; base=10) where {T<:Integer}
    return foldr((a, b) -> muladd(base, b, a), d, init=0)
end

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


function islychrel(n::Integer)
    p = undigits(reverse(digits(n)))
    for _ in 1:60
        n == p && return n
        n += p
        p = undigits(reverse(digits(n)))
    end

    return 0
end


function problem055(N::Integer)
    palindromes = [k for k in (islychrel(n) for n in Int128(1):N) if k != 0]
    sort!(palindromes)
    maxp = 0
    maxc = 0
    for p in unique(palindromes)
        x = searchsorted(palindromes, p)
        maxc < length(x) && (maxc = length(x); maxp = p)
    end
    println("$maxp $maxc")
end


N = parse(Int, readline())
problem055(N)
