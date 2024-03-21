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


function problem036(N::Integer, K::Integer)
    return sum(n for n = 1:N if ispalindrome(n) && ispalindrome(n; base=K))
end


(N, K) = Tuple(parse(Int, n) for n in split(readline(), " "))
println(problem036(N, K))
