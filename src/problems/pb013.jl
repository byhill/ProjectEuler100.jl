export problem013


"""
    problem013()

Problem 013 of Project Euler.

https://projecteuler.net/problem=013
"""
function problem013(N::Int=10, filename::AbstractString="txt/pb013.txt")
    x = sum(parse(BigInt, n) for n in readlines(filename))
    return undigits(digits(x)[end-N+1:end])
end
