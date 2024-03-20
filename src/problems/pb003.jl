module Problem003

using Primes


"""
    problem003()

Problem 003 of Project Euler.

https://projecteuler.net/problem=003

Using factoriaztion packages is overkill for this problem, but it is what I do below.
There is a naive O(sqrt(N))-time algorithm whose concepts are fundamanental for more advanced algorithms.
"""
function problem003(N::Integer=600851475143)
    return maximum(first(pe) for pe in eachfactor(N); init=one(N))
end


export problem003
end  # module Problem003
using .Problem003
export problem003
