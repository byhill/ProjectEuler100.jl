module Problem013

using ..ProjectEulerLibrary


"""
    problem013()

Problem 013 of Project Euler.

https://projecteuler.net/problem=013
"""
function problem013(N::Integer=10, filename="txt/pb013.txt")
    x = sum(parse(BigInt, n) for n in readlines(filename); init=zero(BigInt))
    return undigits(digits(x)[end-N+1:end])
end


export problem013
end  # module Problem013
using .Problem013
export problem013
