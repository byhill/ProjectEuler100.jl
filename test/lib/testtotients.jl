@testset "Totient Library" begin

    # A000010
    @testset "Totient sieve" begin
        φ = totients(1)
        @test φ[1] == 1

        φ = totients(2)
        @test φ[1] == 1
        @test φ[2] == 1

        φ = totients(10^5)
        @test φ[10542] == 3000
        @test φ[29340] == 7776
        @test φ[29621] == 28044
        @test φ[52905] == 28208
        @test φ[99991] == 99990
        @test φ[100000] == 40000
    end
end
