module Problem036

using ..ProjectEuler100


"""
    problem036()

Problem 036 of Project Euler.

https://projecteuler.net/problem=036
"""
function problem036(N::Integer=10^6)
    return sum(n for n in 1:N if ispalindrome(n) && ispalindrome(n; base=2); init=0)
end


export problem036
end  # module Problem036
using .Problem036
export problem036
