module Problem095

using ..ProjectEuler100.ArithmeticFunctions


"""
    problem095()

Problem 095 of Project Euler.

https://projecteuler.net/problem=095
"""
function problem095(N::Int=10^6)
    σ = divisorsum_sieve(1, N)
    for n in 2:N
        σ[n] -= n
    end

    function amicablechain(n)
        chain = Set{Int}(n)
        m = σ[n]
        while m <= N && !(m in chain)
            push!(chain, m)
            m = σ[m]
        end
        return n == m ? length(chain) : 0
    end

    return argmax((amicablechain(n) for n in 2:N)) + 1
end


export problem095
end  # module Problem095
using .Problem095
export problem095
