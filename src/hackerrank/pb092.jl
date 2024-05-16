const MOD = 10^9 + 7
const cache = Dict{Tuple{Int,Int},Int}()


function squaredigitsum(n)
    s = 0
    while n > 0
        s += (n % 10)^2
        n = div(n, 10)
    end
    return s
end


function f(n::Integer, k::Integer)
    return get!(cache, (n, k)) do
        n < 0 && return 0
        k == 0 && n > 0 && return 0
        return mod(sum(f(n - d^2, k - 1) for d in 0:9), MOD)
    end
end


function problem092(D::Integer)
    to89 = zeros(Int, max(81D, 3 * 81))
    to89[1] = 1
    to89[89] = 89

    seq = Int[]
    for n in 1:81D
        iszero(to89[n]) || continue
        empty!(seq)
        while to89[n] == 0
            push!(seq, n)
            n = squaredigitsum(n)
        end
        for k in seq
            to89[k] = to89[n]
        end
    end

    empty!(cache)
    cache[(0, 0)] = 1
    return mod(sum(f(n, D) for n in 1:81D if to89[n] == 89), MOD)
end


K = parse(Int, readline())
println(problem092(K))
