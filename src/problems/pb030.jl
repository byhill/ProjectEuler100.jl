module Problem030

using .Iterators

const DIGIT_POWER_SUMS = Int[]


"""
    problem030()

Problem 030 of Project Euler.

https://projecteuler.net/problem=030
"""
function problem030(p::Integer=5)
    empty!(DIGIT_POWER_SUMS)

    L = first(n for n in countfrom() if ndigits(n * 9^p) ≤ n)
    dpowers = [d^p for d in 0:9]
    combinations_with_replacement_sums(dpowers, L)
    unique!(DIGIT_POWER_SUMS)

    ans = 0
    for dps in DIGIT_POWER_SUMS
        n = dps
        s = 0
        while !iszero(dps)
            dps, d = divrem(dps, 10)
            s += dpowers[d+1]
        end
        s == n && (ans += n)
    end

    return ans - 1
end


combinations_with_replacement_sums(A, L) = _cwrs(A, 0, firstindex(A), L)
function _cwrs(A, s, I, depth)
    if iszero(depth)
        push!(DIGIT_POWER_SUMS, s)
    else
        for i in I:lastindex(A)
            _cwrs(A, s + A[i], i, depth - 1)
        end
    end
end


export problem030
end  # module Problem030
using .Problem030
export problem030
