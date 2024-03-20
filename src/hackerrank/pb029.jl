using .Iterators

@inline ilog(base::Integer, n::Integer) = ndigits(n; base=base) - 1


function problem029(N::Integer)
    powerdups = zeros(Int, ilog(2, N))
    for p in 2:ilog(2, N)
        powers = falses(N)
        for q in 1:p-1
            s = div(lcm(p, q), p)
            powers[s:s:div(N * q, p)] .= true
        end
        powers[1] = false
        powerdups[p] = count(powers)
    end

    dups = 0
    powerof = falses(N)
    for n = 2:isqrt(N)
        powerof[n] && continue
        for p = 2:ilog(n, N)
            powerof[n^p] = true
            dups += powerdups[p]
        end
    end
    return (N - 1)^2 - dups
end


N = parse(Int, readline())
println(problem029(N))
