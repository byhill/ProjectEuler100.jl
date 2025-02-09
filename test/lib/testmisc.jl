@testset "Testing misc library" begin

    @testset "sumto" begin
        @test sumto(0) == 0
        @test sumto(1) == 1
        @test sumto(2) == 3
        @test sumto(100) == 5050
        @test sumto(382938471) == 73320936477378156
    end


    @testset "ilog" begin
        @test ilog(2, 1) == 0
        @test ilog(2, 7) == 2
        @test ilog(2, 8) == 3
        @test ilog(2, 9) == 3
        @test ilog(2, typemax(Int)) == 62

        @test ilog(2394, 2393) == 0
        @test ilog(10, 100) == 2
        @test ilog(241, 241^6) == 6
        @test ilog(241, 241^6 - 1) == 5
        @test ilog(241, typemax(Int)) == 7
    end


    @testset "concat" begin
        @test concat(20, 57, 1504952934) == 20571504952934
        @test concat(20) == 20
        @test concat(20, 0, 20) == 20020
        @test concat(
            parse(Int, "21112"; base=3),
            parse(Int, "12000"; base=3),
            parse(Int, "10000021110"; base=3);
            base=3
        ) == parse(Int, "211121200010000021110"; base=3)
    end

end
