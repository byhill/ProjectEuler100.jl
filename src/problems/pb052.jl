module Problem052

using .Iterators


"""
    problem052()

Problem 052 of Project Euler.

https://projecteuler.net/problem=052
"""
function problem052(K::Integer=6)
    return first(n for n in countfrom() if all(sort(digits(n)) == sort(digits(k * n)) for k = 2:K))
end


export problem052
end  # module Problem052
using .Problem052
export problem052
