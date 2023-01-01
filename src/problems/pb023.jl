export problem023


"""
    problem023()

Problem 023 of Project Euler.

https://projecteuler.net/problem=023
"""
function problem023()
    N = 28123
    d = σₓ(1, N)
    for n = 1:N
        d[n] -= n
    end

    abundant = [d[n] > n for n = 1:N]
    abundantv = Int[]
    ans = 0

    for n = 1:N
        iseven(n) && abundant[n ÷ 2] && push!(abundantv, n ÷ 2)
        !any(abundant[n - m] for m in abundantv) && (ans += n)
    end

    return ans
end
