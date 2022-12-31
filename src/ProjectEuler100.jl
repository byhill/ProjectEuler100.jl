module ProjectEuler100

include("lib/lib.jl")
using .ProjectEulerLibrary

include.(filter(contains(r".jl$"), readdir(dirname(@__FILE__) * "/problems"; join=true)))

end
