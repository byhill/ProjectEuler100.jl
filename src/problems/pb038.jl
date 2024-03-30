module Problem038

using .Iterators
using ..ProjectEuler100


"""
    problem038()

Problem 038 of Project Euler.

https://projecteuler.net/problem=038
"""
function problem038()
    pandigitals = Int[]
    for n in 1:9876
        x = n
        for i in countfrom(2)
            x = concat(x, i * n)
            if ndigits(x) ≥ 9
                ndigits(x) == 9 && ispandigital(x; zeroless=true) && push!(pandigitals, x)
                break
            end
        end
    end

    return maximum(pandigitals)
end


export problem038
end  # module Problem038
using .Problem038
export problem038
