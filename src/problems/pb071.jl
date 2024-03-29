module Problem071


"""
    problem071()

Problem 071 of Project Euler.

https://projecteuler.net/problem=071

Solution can be found in Hardy-Wright's "Theory of Numbers",
in the second proof of Theorems 29 and 30.
Essentially, you are looking of the term previous to 3/7
in the Farey sequence F_{1,000,000}.
"""
function problem071(h::Integer=3, k::Integer=7, n::Integer=10^6)
    _, x, y = .-gcdx(k, h)
    r = (n + y) ÷ k
    return x + r * h
end


export problem071
end  # module Problem071
using .Problem071
export problem071
