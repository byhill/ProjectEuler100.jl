module Problem008


"""
    problem008()

Problem 008 of Project Euler.

https://projecteuler.net/problem=008

This is naive bruteforce.
Takes O(LN) time, where N is the length of the string of digits,
and L is the length of the adjacent digits you are checking.
You can improve the runtime so it runs in O(N) time instead.
"""
function problem008(L::Integer=13, filename="txt/pb008.txt")
    file = read(filename, String)
    A = [parse(Int, c) for c in filter(isdigit, file)]
    return maximum(prod(A[i-L+1:i]) for i in L:length(A))
end


export problem008
end  # module Problem008
using .Problem008
export problem008
