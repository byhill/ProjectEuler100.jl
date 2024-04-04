function problem052(N::Integer, K::Integer)
    for n in 1:N
        all(sort(digits(n)) == sort(digits(k * n)) for k in 2:K) && println(join((k * n for k in 1:K), ' '))
    end
end


(N, K) = Tuple(parse(Int, n) for n in split(readline(), " "))
problem052(N, K)
