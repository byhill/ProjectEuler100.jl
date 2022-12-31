module ProjectEuler100

using Base.Iterators
using Primes

include("lib/lib.jl")
using .ProjectEulerLibrary

include.(filter(contains(r".jl$"), readdir(dirname(@__FILE__) * "/problems"; join=true)))

# include("problems/pb001.jl")
# include("problems/pb002.jl")
# include("problems/pb003.jl")
# include("problems/pb004.jl")
# include("problems/pb005.jl")

end
