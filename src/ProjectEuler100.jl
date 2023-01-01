module ProjectEuler100

using Base.Iterators
using Combinatorics: with_replacement_combinations
using Primes

include("lib/lib.jl")
using .ProjectEulerLibrary

# Includes all files in the /problems directory.
# You probably shouldn't do this for an actual project,
# but it is fine for just a collection of code snippets.
include.(filter(contains(r".jl$"), readdir(dirname(@__FILE__) * "/problems"; join=true)))

end
