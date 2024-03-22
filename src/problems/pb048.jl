module Problem048

const MOD = 10^10


"""
    problem048()

Problem 048 of Project Euler.

https://projecteuler.net/problem=048
"""
function problem048(N::Integer=1000)
    return mod(sum(powermod(n, n, MOD) for n in 1:N), MOD)
end


export problem048
end  # module Problem048
using .Problem048
export problem048
