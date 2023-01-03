export problem051


"""
    problem051()

Problem 051 of Project Euler.

https://projecteuler.net/problem=051
"""
function problem051(N::Integer=8)

    function isprimefamily(p::Integer)
        for digit in 0:10-N
            I = findall(isequal(digit), digits(p))
            for J in powerset(I, 1)
                c = 1
                pdigits = digits(p)
                for d = digit+1:9
                    pdigits[J] .= d
                    isprime(undigits(pdigits)) && (c += 1)
                    N - c > 9 - d && break
                    c == N && return true
                end
            end
        end

        return false
    end

    return first(p for s in countfrom(1) for p in primes(10^(s - 1), 10^s) if isprimefamily(p))
end
