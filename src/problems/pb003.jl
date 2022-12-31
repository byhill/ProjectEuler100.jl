export problem003


"""
    problem003()

Problem 003 of Project Euler.

https://projecteuler.net/problem=003

Since the divisors of N aren't too big, we can simply brute-force this by trial division.
Takes O(sqrt(n)) time.
"""
function problem003(N::Int=600_851_475_143)
    for d in countfrom(2)
        d < isqrt(N) || return N
        while N % d == 0
            N ÷= d
        end
        N == 1 && return d
    end
end
