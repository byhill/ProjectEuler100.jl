module Problem070

using ..ProjectEuler100.Totients

const digitsn = Int[]
const digitsm = Int[]


function digitpermutation(n, m)
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
    return 1 + argmin([(digitpermutation(n, phi[n]) ? n / phi[n] : N) for n in 2:N-1])
end


export problem070
end  # module Problem070
using .Problem070
export problem070
