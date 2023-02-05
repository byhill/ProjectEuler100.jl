module ProjectEuler100

using Base.Iterators: countfrom, product
using Combinatorics: permutations, powerset, with_replacement_combinations
using Primes: isprime, primes

include("lib/lib.jl")
using .ProjectEulerLibrary

include("problems.jl")

end
