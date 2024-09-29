export cartesian_product

using .Iterators


"""
    cartesian_product(iter, n::Integer)

Returns an iterator that goes over all elements in the `n`th Cartesian product of iter.
"""
@inline cartesian_product(iter, n::Integer) = product(ntuple(i -> iter, n)...)
