@inline function concat(xs...; base::T=10) where {T<:Integer}
    return foldl((n, x) -> n * base^ndigits(x) + x, xs; init=zero(T))
end


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


function problem032(N)
    pandigital_products = Int[]
    for n in 1:99, m in 1:10000
        x = concat(n, m, n * m)
        ndigits(x) != N && continue
        ispandigital(x; zeroless=true, N=N) && push!(pandigital_products, n * m)
    end

    unique!(pandigital_products)
    return sum(pandigital_products)
end


N = parse(Int, readline())
println(problem032(N))
