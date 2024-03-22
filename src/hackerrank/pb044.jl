@inline function ispentagonal(n::Integer)
    m = 1 + 24n
    return issquare(m) && mod(isqrt(m), 6) == 5
end

@inline issquare(n::Integer) = isqrt(n)^2 == n


function problem044(N::Integer, K::Integer)
    for n = K+1:N
        m = n - K
        Pn = div(n * (3n - 1), 2)
        Pm = div(m * (3m - 1), 2)
        (ispentagonal(Pn - Pm) || ispentagonal(Pn + Pm)) && println(Pn)
    end
end


(N, K) = Tuple(parse(Int, n) for n in split(readline(), " "))
problem044(N, K)
