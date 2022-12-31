export problem004


"""
    problem004()

Problem 004 of Project Euler.

https://projecteuler.net/problem=004

Palindromes are divisible by 11.
Therefore, if p = xy is a palindrome, since 11 is prime, one of x or y is divisible by 11.
So, assume x is divisible by 11.
"""
function problem004()
    ans = 0
    for x in 990:-11:100
        999x < ans && return ans
        for y in 999:-1:100
            x * y < ans && break
            ispalindrome(x * y) && (ans = x * y)
        end
    end
    
    return ans
end
