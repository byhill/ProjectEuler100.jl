export problem036


"""
    problem036()

Problem 036 of Project Euler.

https://projecteuler.net/problem=036
"""
function problem036(N::Integer=10^6)
    return sum(n for n = 1:N if ispalindrome(n) && ispalindrome(n; base=2))
end
