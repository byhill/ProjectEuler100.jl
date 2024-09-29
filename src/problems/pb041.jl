module Problem041

using Primes
using ..ProjectEulerLibrary


"""
    problem041()

Problem 041 of Project Euler.

https://projecteuler.net/problem=041

1 + 2 + ... + 9 = 45, hence a 1-9 pandigital is divisible by 3
1 + 2 + ... + 8 = 36, hence a 1-8 pandigital is divisible by 3.
Therefore, we only need to check 1-7 pandigitals or less.
"""
function problem041()
    return first(p for p in reverse(primes(10^7)) if ispandigital(p; zeroless=true, N=ndigits(p)))
end


export problem041
end  # module Problem041
using .Problem041
export problem041
