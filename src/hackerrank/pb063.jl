function problem063(N::Integer)
    for m in 1:9
        ndigits(m^N) == N && println(m^N)
    end
end


N = parse(Int, readline())
problem063(N)
