export problem027


"""
    problem027()

Problem 027 of Project Euler.

https://projecteuler.net/problem=027

Let f(n) = n^2 + an + b.
Since f(0) is prime, we must have b be prime.
Since f(2n + 1) is prime, we must have a be odd.
The rest is brute-force.
"""
function problem027(N::Integer=1000)

    function chain(a::Integer, b::Integer)
        for n in countfrom()
            y = n^2 + a * n + b
            !isprime(y) && return n - 1
        end
    end

    (maxchain, maxa, maxb) = (0, 0, 0)

    for b in reverse(primes(N))
        maxchain >= b && return maxa * maxb
        for a = -N+1:2:N  # only works for even N, since a must be odd.
            seq = chain(a, b)
            seq > maxchain && ((maxchain, maxa, maxb) = (seq, a, b))
        end
    end

    return maxa * maxb
end
