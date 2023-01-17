export problem008


"""
    problem008()

Problem 008 of Project Euler.

https://projecteuler.net/problem=008
"""
function problem008(L::Integer=13, filename="txt/pb008.txt")
    string = replace(read(filename, String), "\n" => "")
    digits = [parse(Int, c) for c in string]
    return maximum(prod(digits[i-L+1:i]) for i = L:length(digits))
end
