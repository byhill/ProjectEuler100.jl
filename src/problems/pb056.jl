module Problem056


"""
    problem056()

Problem 056 of Project Euler.

https://projecteuler.net/problem=056
"""
function problem056(N=100)
    return maximum(n -> sum(digits(n)), a^b for a in big(1):N-1 for b in 1:N-1)
end


export problem056
end  # module Problem056
using .Problem056
export problem056
