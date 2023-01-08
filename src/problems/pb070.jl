export problem070


"""
    problem070()

Problem 070 of Project Euler.

https://projecteuler.net/problem=070
"""
function problem070(N=10^7)
    phi = totients(N)
    digitpermutation(n, m) = sort(digits(n)) == sort(digits(m))
    return argmin([(digitpermutation(n, phi[n]) ? n / phi[n] : 2.0n) for n = 2:N-1]) + 1
end
