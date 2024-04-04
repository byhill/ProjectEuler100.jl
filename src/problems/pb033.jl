module Problem033

const fracs = Tuple{Int,Int}[]
const pdigs = Int[]
const qdigs = Int[]
const xdigs = Int[]
const ydigs = Int[]
const rem_p = Int[]
const rem_q = Int[]


"""
    problem033()

Problem 033 of Project Euler.

https://projecteuler.net/problem=033

Cancel K digits in N digits fractions.

For each fraction p/q (not necessarily reduced) with p and q having K digits,
check to see if for fractions x/y equivalent to p/q, with x and y having N digits.
if x can cancel digits to form p and y can cancel the same digits to form q.
"""
function problem033(N::Integer=2, K::Integer=1)
    empty!(fracs)

    resize!(pdigs, N - K)
    resize!(qdigs, N - K)

    L1 = 10^(N - K) - 1
    L2 = 10^(N - 1) - 1
    L3 = 10^N - 1
    for p in 1:L1
        for q in p+1:L1
            x = p ÷ gcd(p, q)
            y = q ÷ gcd(p, q)
            for n in 1+L2÷x:L3÷y
                cancel_fraction(N, K, p, q, n * x, n * y)
            end
        end
    end

    sort!(fracs)
    unique!(fracs)
    return denominator(prod(t[1] // t[2] for t in fracs))
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


export problem033
end  # module Problem033
using .Problem033
export problem033
