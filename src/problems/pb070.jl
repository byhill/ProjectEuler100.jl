module Problem070

using ..ProjectEulerLibrary

const digitsn = Int[]
const digitsm = Int[]


function isdigitpermutation(n, m)
    ln = ndigits(n)
    lm = ndigits(m)
    ln == lm || return false

    resize!(digitsn, ln)
    resize!(digitsm, lm)
    digits!(digitsn, n)
    digits!(digitsm, m)
    sort!(digitsn)
    sort!(digitsm)
    return digitsn == digitsm
end


"""
    problem070()

Problem 070 of Project Euler.

https://projecteuler.net/problem=070
"""
function problem070(N::Integer=10^7)
    phi = totients(N)

    min_n = 1
    min_phi = 0
    for n in 2:N-1
        n * min_phi < min_n * phi[n] || continue
        isdigitpermutation(n, phi[n]) || continue
        min_n = n
        min_phi = phi[n]
    end

    return min_n
end


export problem070
end  # module Problem070
using .Problem070
export problem070
