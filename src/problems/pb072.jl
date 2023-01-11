export problem072


"""
    problem072()

Problem 072 of Project Euler.

https://projecteuler.net/problem=072

You are looking for the number of coprime pairs (a, b), 1 ≤ a < b ≤ N.
This is equivalent to the sum the totients from 2 to N.

I use a sieve to calculate the totients, and then sum them up.
However, there are much faster (but more complicated methods)
of computing the totient summatory function.
"""
function problem072(N::Integer=10^6)
    return sum(totients(N)) - 1
end
