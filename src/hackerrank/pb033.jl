const fracs = Tuple{Int,Int}[]
const pdigs = Int[]
const qdigs = Int[]
const xdigs = Int[]
const ydigs = Int[]
const rem_p = Int[]
const rem_q = Int[]


function problem033(N::Integer, K::Integer)
    empty!(fracs)

    resize!(pdigs, N - K)
    resize!(qdigs, N - K)

    L1 = 10^(N - K) - 1
    L2 = 10^(N - 1) - 1
    L3 = 10^N - 1
    for p in 1:L1
        for q = p+1:L1
            x = div(p, gcd(p, q))
            y = div(q, gcd(p, q))
            for n = 1+div(L2, x):div(L3, y)
                cancel_fraction(N, K, p, q, n * x, n * y)
            end
        end
    end

    sort!(fracs)
    unique!(fracs)
    return sum(x[1] for x in fracs), sum(x[2] for x in fracs)
end


function cancel_fraction(N, K, p::Integer, q::Integer, x::Integer, y::Integer)
    digits!(pdigs, p)
    resize!(xdigs, ndigits(x))
    digits!(xdigs, x)
    g(N, K, pdigs, xdigs, rem_p) || return nothing

    digits!(qdigs, q)
    resize!(ydigs, ndigits(y))
    digits!(ydigs, y)
    g(N, K, qdigs, ydigs, rem_q) || return nothing

    sort!(rem_p)
    sort!(rem_q)
    isequal(rem_p, rem_q) && push!(fracs, (x, y))
end


function g(N, K, a, b, rem)
    empty!(rem)

    i = 1
    flag = false
    for j in eachindex(b)
        if !flag && b[j] == a[i]
            i += 1
            i > N - K && (flag = true)
        else
            b[j] == 0 && return false
            push!(rem, b[j])
        end
    end

    return flag
end


(N, K) = Tuple(parse(Int, n) for n in split(readline(), " "))
(u, v) = problem033(N, K)
println("$u $v")
