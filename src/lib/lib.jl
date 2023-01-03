module ProjectEulerLibrary

using Base.Iterators
using Primes


export cartesianproduct

export sumto, sumsquaresto, ilog, concat, undigits
export ispalindrome, ispandigital, issquare, istriangular, ispentagonal
export digit_factorial

export σₓ

export nthprime_upperbound


include("combinatorics.jl")
include("misc.jl")
include("numbertheory.jl")
include("primes.jl")

end
