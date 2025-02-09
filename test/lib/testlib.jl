using ProjectEuler100.ProjectEulerLibrary

@testset "ProjectEulerLibrary" begin
    include("testdivisors.jl")
    include("testmisc.jl")
    include("testprimes.jl")
    include("testtotients.jl")
end
