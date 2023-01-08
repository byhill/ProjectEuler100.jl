module ProjectEuler100

using Base.Iterators: countfrom, product
using Combinatorics: permutations, powerset, with_replacement_combinations
using Primes: isprime, primes

include("lib/lib.jl")
using .ProjectEulerLibrary

# Includes all files in the /problems directory.
# You probably shouldn't do this for an actual project
# (for one, the lsp does not work correctly if you do this),
# but it is fine for just a collection of code snippets.
include.(filter(contains(r".jl$"), readdir(dirname(@__FILE__) * "/problems"; join=true)))

end
