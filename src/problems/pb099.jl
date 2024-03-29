module Problem099


"""
    problem099()

Problem 099 of Project Euler.

https://projecteuler.net/problem=099
"""
function problem099(filename="txt/pb099.txt")
    base_exp = (Tuple(parse(Int, n) for n in split(l, ",")) for l in readlines(filename))
    return argmax((e * log(b) for (b, e) in base_exp))
end


export problem099
end  # module Problem099
using .Problem099
export problem099
