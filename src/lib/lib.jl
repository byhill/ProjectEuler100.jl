module ProjectEulerLibrary

using Base.Iterators
using Primes


export cartesianproduct

export pells_equation_fundamental_solution

export sumto, sumsquaresto, ilog, concat, undigits
export ispalindrome, ispandigital, issquare, istriangular, ispentagonal
export digit_factorial

export σₓ, totients

export nthprime_upperbound


include("combinatorics.jl")
include("diophantine.jl")
include("misc.jl")
include("numbertheory.jl")
include("primes.jl")

end
