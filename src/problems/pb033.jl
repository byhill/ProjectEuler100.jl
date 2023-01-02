export problem033


"""
    problem033()

Problem 033 of Project Euler.

https://projecteuler.net/problem=033

Cancel K digits in N digits fractions.

For each fraction p/q (not necessarily reduced) with p and q having K digits,
check to see if for fractions x/y equivalent to p/q, with x and y having N digits.
if x can cancel digits to form p and y can cancel digits to form q.
"""
function problem033(N::Integer=2, K::Integer=1)

    fracs = Tuple{Int,Int}[]

    function g(a::Vector{Int}, b::Vector{Int})
        i = 1
        flag = false
        remdigits = Int[]
        for j in eachindex(b)
            !flag && b[j] == 0 && a[i] != 0 && return (false, remdigits)
            if i <= N - K && b[j] == a[i]
                i += 1
                i > N - K && (flag = true)
            else
                push!(remdigits, b[j])
            end
        end
        return (flag, remdigits)
    end

    function cancel_fraction(p::Integer, q::Integer, x::Integer, y::Integer)
        pdigits = digits(p; pad=N - K)
        xdigits = digits(x)
        0 in xdigits && !(0 in pdigits) && return nothing  # aren't cancelling zeros
        (flag_p, remdigits_p) = g(pdigits, xdigits)
        !flag_p && return

        qdigits = digits(q; pad=N - K)
        ydigits = digits(y)
        0 in ydigits && !(0 in qdigits) && return nothing  # aren't cancelling zeros
        (flag_q, remdigits_q) = g(qdigits, ydigits)
        !flag_q && return nothing

        isequal(sort(remdigits_p), sort(remdigits_q)) && push!(fracs, (x, y))
    end


    L1 = 10^(N - K) - 1
    L2 = 10^(N - 1) - 1
    L3 = 10^N - 1
    for p = 1:L1
        for q = p+1:L1
            x = p ÷ gcd(p, q)
            y = q ÷ gcd(p, q)
            for n = 1+L2÷x:L3÷y
                cancel_fraction(p, q, n * x, n * y)
            end
        end
    end

    return denominator(prod(t[1] // t[2] for t in fracs))
end
