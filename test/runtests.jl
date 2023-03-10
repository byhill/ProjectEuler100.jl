using ProjectEuler100
using Test

include("solutions.jl")

@testset "ProjectEuler100.jl" begin
    cd("..")  # A hack so the tests can read the txt directory
    for key in sort(collect(keys(SOLUTIONS)))
        @testset "Problem $key" begin
            f = getfield(Main, Symbol("problem$key"))
            @test f() == SOLUTIONS[key]
        end
    end
end
