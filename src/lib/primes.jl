# primes.jl


"""
    nthprime_upperbound(n::Integer)

Returns an integer x such the p_n ≤ x, where p_n is the nth prime number.
"""
@inline function nthprime_upperbound(n::T) where {T<:Integer}
    return n >= 6 ? floor(T, n * (log(n) + log(log(n)))) : 13
end
