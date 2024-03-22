function problem047(N::Integer, K::Integer)
    div = zeros(Int, N)
    consec = 0
    for n in 2:N
        if div[n] == 0
            div[n:n:N] .+= 1
            consec = 0
        elseif div[n] == K
            consec += 1
            consec >= K && println(n - K + 1)
        else
            consec = 0
        end
    end
end


(N, K) = Tuple(parse(Int, n) for n in split(readline(), " "))
problem047(N + K - 1, K)
