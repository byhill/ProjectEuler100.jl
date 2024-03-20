function ispalindrome(n)
    m = n
    p = 0
    while m > 0
        (m, r) = divrem(m, 10)
        p = muladd(p, 10, r)
    end

    return n == p
end


function problem004(N::Integer)
    ans = 0
    for x in 990:-11:100
        999x < ans && return ans
        for y in 999:-1:100
            x * y < ans && break
            x * y < N && ispalindrome(x * y) && (ans = x * y)
        end
    end

    return ans
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem004(N))
end
