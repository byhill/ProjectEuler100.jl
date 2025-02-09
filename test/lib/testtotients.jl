@testset "Totient Library" begin

    @testset "Totient sieve" begin
        phi = totients(1)
        @test phi[1] == 1

        phi = totients(2)
        @test phi[1] == 1
        @test phi[2] == 1

        phi = totients(10^5)
        @test phi[10542] == 3000
        @test phi[29340] == 7776
        @test phi[29621] == 28044
        @test phi[52905] == 28208
        @test phi[99991] == 99990
        @test phi[100000] == 40000
    end
end
