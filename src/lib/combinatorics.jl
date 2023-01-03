# combinatorics.jl

"""
    cartesianproduct(iter, n::Integer)

Returns an iterator that goes over all elements in the `n`th Cartesian product of iter.
"""
@inline cartesianproduct(iter, n::Integer) = product(ntuple(i -> iter, n)...)
