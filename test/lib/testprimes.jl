@testset "Prime Library" begin

    # A034387
    @testset "Primesum Function" begin
        pi = primesum_function(10^4)
        @test pi(1) == 0
        @test pi(2) == 2
        @test pi(3) == 5
        @test pi(96) == 963
        @test pi(97) == 1060
        @test pi(98) == 1060
        @test pi(100) == 1060
        @test pi(10^4 ÷ 3) == 720819
        @test pi(10^4) == 5736396
        @test_throws DomainError pi(10^4 ÷ 20 + 1)

        pi = primesum_function(9999)
        @test pi(99) == 1060
        @test pi(101) == 1161
        @test pi(9999) == 5736396
        @test_throws DomainError pi(100)
    end

end
