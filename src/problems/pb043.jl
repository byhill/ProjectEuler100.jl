export problem043


"""
    problem043()

Problem 043 of Project Euler.

https://projecteuler.net/problem=043
"""
function problem043()
    ans = 0
    DIVISORS = (17, 13, 11, 7, 5, 3, 2)
    for p in permutations(0:9)
        all(undigits(p[i:i+2]) % DIVISORS[i] == 0 for i = 1:7) && (ans += undigits(p))
    end

    return ans
end
