export problem062

module Problem062
export problem062

using Base.Iterators
using ..ProjectEulerLibrary


mutable struct CubicPermutation{T<:Integer}
    mincube::T
    found::T
end

"""
    problem062()

Problem 062 of Project Euler.

https://projecteuler.net/problem=062
"""
function problem062(N::Integer=5)
    cubicperms = Dict{Int,CubicPermutation{Int64}}()
    for n in countfrom()
        m = n * n * n
        key = undigits(sort(digits(m)))
        cp = get!(cubicperms, key, CubicPermutation(m, 0))
        (cp.found += 1) == N && return cp.mincube
    end
end

end  # module Problem062
using .Problem062
