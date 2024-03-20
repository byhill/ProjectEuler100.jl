module Problem021

using ..ProjectEuler100.ArithmeticFunctions


"""
    problem021()

Problem 021 of Project Euler.

https://projecteuler.net/problem=021
"""
function problem021(N::Integer=10000)
    N -= 1
    L = N > 5048 ? ceil(Int, N * log(log(N)) * exp(0.578)) : 14304  # https://link.springer.com/article/10.1007/s11139-021-00491-y
    d = divisorsum_sieve(1, L)
    for n in eachindex(d)
        d[n] -= n
    end

    return sum(n for n in 2:N if d[n] ≠ n && d[d[n]] == n; init=0)
end


export problem021
end  # module Problem021
using .Problem021
export problem021
