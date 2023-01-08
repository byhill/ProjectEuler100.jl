export problem065


"""
    problem065()

Problem 065 of Project Euler.

https://projecteuler.net/problem=065

My solution is a little wasteful with memory.
I use O(N), optimal is probably around O(logN).
"""
function problem065(N::Integer=100)
    a = [[2, 1]; [n % 3 == 0 ? 2(n + 1) ÷ 3 : 1 for n = 3:N]]
    p = BigInt[a[1], a[2]*a[1]+1]
    for n = 3:N
        push!(p, a[n] * p[end] + p[end-1])
    end
    return sum(digits(p[end]))
end
