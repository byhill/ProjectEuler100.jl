module ProjectEuler100

using Base.Iterators
using Primes

include("lib/lib.jl")
using .ProjectEulerLibrary

include.(filter(contains(r".jl$"), readdir(dirname(@__FILE__) * "/problems"; join=true)))

end
