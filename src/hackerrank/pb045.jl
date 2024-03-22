using .Iterators

@inline issquare(n::Integer) = isqrt(n)^2 == n
@inline istriangular(n::Integer) = issquare(1 + 8n)

@inline function ispentagonal(n::Integer)
    m = 1 + 24n
    return issquare(m) && isqrt(m) % 6 == 5
end


function problem045(N::Integer, a::Integer)
    if a == 3
        for n in countfrom()
            pent = div(n * (3n - 1), 2)
            pent >= N && return
            istriangular(pent) && println(pent)
        end
    else
        for n in countfrom()
            hexg = n * (2n - 1)
            hexg >= N && return
            ispentagonal(hexg) && println(hexg)
        end
    end
end


(N, a, _) = Tuple(parse(Int, n) for n in split(readline(), " "))
problem045(N, a)
