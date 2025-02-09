@testset "Divisor Library" begin

    # A000005
    @testset "divisorcounts" begin
        d = divisorcounts(1)
        @test d[1] == 1

        d = divisorcounts(2)
        @test d[1] == 1
        @test d[2] == 2

        d = divisorcounts(10^5)
        @test d[1] == 1
        @test d[2] == 2
        @test d[1001] == 8
        @test d[17539] == 2
        @test d[34380] == 36
        @test d[64800] == 90
        @test d[83160] == 128
        @test d[98280] == 128
        @test d[100000] == 36
    end

    # A000203
    @testset "divisorsums" begin
        σ = divisorsums(1)
        @test σ[1] == 1

        σ = divisorsums(2)
        @test σ[1] == 1
        @test σ[2] == 3

        σ = divisorsums(10^5)
        @test σ[1] == 1
        @test σ[2] == 3
        @test σ[1001] == 1344
        @test σ[17539] == 17540
        @test σ[34380] == 104832
        @test σ[64800] == 236313
        @test σ[83160] == 345600
        @test σ[98280] == 403200
        @test σ[100000] == 246078
    end

    @testset "divisor_sums_of_powers" begin
        σ = divisor_sums_of_powers(2, 3)
        @test σ[1] == 1
        @test σ[2] == 5
        @test σ[3] == 10

        σ = divisor_sums_of_powers(5, Int128(10)^4)
        @test σ isa Vector{Int128}
        @test σ[1] == 1
        @test σ[10000] == 103258846206030069901

        σ = divisor_sums_of_powers(5, 10^4, 10^9 + 7)
        @test σ isa Vector{Int64}
        @test σ[1] == 1
        @test σ[10000] == 218151520
    end

end
