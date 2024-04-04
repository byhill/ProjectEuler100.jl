using .Iterators


function ispandigital(n::Integer; base::Integer=10, zeroless::Bool=false, N::Integer=base - 1)
    N >= base && return false

    digits = falses(base)
    zeroless && (digits[0+1] = true)
    while n > 0
        (n, r) = divrem(n, base)
        digits[r+1] = true
    end

    return all(digits[1:N+1])
end


@inline function concat(xs...; base::T=10) where {T<:Integer}
    return foldl((n, x) -> n * base^ndigits(x) + x, xs; init=zero(T))
end


function problem038(N::Integer, K::Integer)
    for n in 2:N
        x = n
        for i in countfrom(2)
            x = concat(x, i * n)
            if ndigits(x) >= K
                ndigits(x) == K && ispandigital(x; zeroless=true, N=K) && println(n)
                break
            end
        end
    end
end


(N, K) = Tuple(parse(Int, n) for n in split(readline(), " "))
problem038(N, K)
