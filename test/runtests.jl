using ProjectEuler100
using Test


@testset "ProjectEuler100.jl" begin
    cd("..")  # A hack so the tests can read the txt directory
    include("solutions.jl")
    for key in sort(collect(keys(SOLUTIONS)))
        @testset "Problem $key" begin
            f = getfield(Main, Symbol("problem$key"))
            @test f() == SOLUTIONS[key] skip = false
        end
    end
end


include("lib/testlib.jl")
