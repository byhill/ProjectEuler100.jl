module Problem063


"""
    problem063()

Problem 063 of Project Euler.

https://projecteuler.net/problem=063

10^{n - 1} ≤ m^n < 10^n implies that m < 10 and n ≤ 1 / (1 - log10(m))
"""
function problem063()
    return sum(floor(Int, 1 / (1 - log10(m))) for m in 1:9)
end


export problem063
end  # module Problem063
using .Problem063
export problem063
