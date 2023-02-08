export problem092


module Problem092
export problem092

const cache = Dict{Tuple{Int,Int},Int}()

function squaredigitsum(n)
    s = 0
    while n > 0
        (n, r) = divrem(n, 10)
        s += r^2
    end

    return s
end


function f(n::Integer, k::Integer)
    return get!(cache, (n, k)) do
        n < 0 && return 0
        k == 0 && n > 0 && return 0
        return sum(f(n - d^2, k - 1) for d = 0:9)
    end
end


"""
    problem092()

Problem 092 of Project Euler.

https://projecteuler.net/problem=092

See https://projecteuler.net/thread=92;page=5#325097

D is the maximum number of digits.
"""
function problem092(D::Int=7)
    to89 = zeros(Int, max(81D, 3 * 81))
    to89[1] = 1
    to89[89] = 89

    for n = 1:81D
        to89[n] != 0 && continue
        seq = Int[]
        while to89[n] == 0
            push!(seq, n)
            n = squaredigitsum(n)
        end
        for k in seq
            to89[k] = to89[n]
        end
    end

    empty!(cache)
    cache[(0, 0)] = 1
    return sum(f(n, D) for n = 1:81D if to89[n] == 89)
end

end
using .Problem092
