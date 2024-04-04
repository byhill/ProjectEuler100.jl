module Problem029

using ..ProjectEuler100


"""
    problem029()

Problem 029 of Project Euler.

https://projecteuler.net/problem=029

https://projecteuler.net/thread=29&page=3#6162

Counting duplicates directly. https://projecteuler.net/thread=29;page=3#6162
"""
function problem029(N::Integer=100)
    powerdups = zeros(Int, ilog(2, N))
    for p in 2:ilog(2, N)
        powers = falses(N)
        for q in 1:p-1
            s = lcm(p, q) ÷ p
            powers[s:s:N*q÷p] .= true
        end
        powers[1] = false
        powerdups[p] = count(powers)
    end

    dups = 0
    powerof = falses(N)
    for n in 2:isqrt(N)
        powerof[n] && continue
        for p in 2:ilog(n, N)
            powerof[n^p] = true
            dups += powerdups[p]
        end
    end

    return (N - 1)^2 - dups
end


export problem029
end  # module Problem029
using .Problem029
export problem029
