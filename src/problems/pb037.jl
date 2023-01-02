export problem037


"""
    problem037()

Problem 037 of Project Euler.

https://projecteuler.net/problem=037
"""
function problem037()

    function right_truncatable_primes()
        truncatable = Vector{Int}[[2, 3, 5, 7]]
        digits = [1, 3, 7, 9]
        for i in countfrom(2)
            itr = (10 * p + d for (p, d) in product(truncatable[i-1], digits))
            push!(truncatable, [n for n in itr if isprime(n)])
            isempty(truncatable[i]) && return reduce(vcat, truncatable[2:end])
        end
    end

    function left_truncatable_prime(n::Integer)
        m = 0
        i = 1
        while m != n
            m = n % 10^i
            !isprime(m) && return false
            i += 1
        end
        return true
    end

    return sum(n for n in right_truncatable_primes() if left_truncatable_prime(n))
end
