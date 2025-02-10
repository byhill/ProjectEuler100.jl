export padic_val, primepi_function, primesum_function


"""
    padic_val

Returns the p-adic valuation of n, i.e., the largest v such that p^v divides n.
"""
@inline function padic_val(n, p)
    v = 0
    while n % p == 0
        n ÷= p
        v += 1
    end

    return v
end


#################################################
###  Lucy-Hedgehog
#################################################

struct PrimePi{T}
    N::T
    L::T
    smalls::Vector{T}
    larges::Vector{T}
end


"""
    primesum_function(N::Integer)

Returns a function p(n) that can find the number of primes from 1 to n,
as long as n is of the form fld(N, m) for sum positive integer m.
"""
function primepi_function(N::Integer)
    sqrtN = isqrt(N)
    smalls = [n - 1 for n in 1:sqrtN]  # smalls[n] = π(n)
    larges = [N ÷ n - 1 for n in 1:N÷sqrtN]  # larges[n] = π(N/n)

    k = 0
    for p in 2:sqrtN
        smalls[p] == smalls[p-1] && continue  # Then p is not prime

        cnt = smalls[p-1]
        for x in 1:min(N ÷ sqrtN, N ÷ (p * p))
            d = x * p
            if d ≤ N ÷ sqrtN
                larges[x] -= larges[d] - cnt
            else
                larges[x] -= smalls[N÷d] - cnt
            end
        end
        for x in sqrtN:-1:p*p
            smalls[x] -= smalls[x÷p] - cnt
        end

        k += 1
    end

    return PrimePi(N, sqrtN, smalls, larges)
end


"""
    primesum_function(N::Integer, m::Int64)

Returns a function p(n) that can find the number of primes from 1 to n mod m,
as long as n is of the form fld(N, m) for sum positive integer m.
"""
function primepi_function(N::Integer, m::Int64)
    sqrtN = isqrt(N)
    smalls = [mod(n - 1, m) for n in 1:sqrtN]  # smalls[n] = π(n)
    larges = [mod(N ÷ n - 1, m) for n in 1:N÷sqrtN]  # larges[n] = π(N/n)

    k = 0
    for p in 2:sqrtN
        smalls[p] == smalls[p-1] && continue  # Then p is not prime

        cnt = smalls[p-1]
        for x in 1:min(N ÷ sqrtN, N ÷ (p * p))
            d = x * p
            if d ≤ N ÷ sqrtN
                larges[x] = mod(larges[x] - larges[d] + cnt, m)
            else
                larges[x] = mod(larges[x] - smalls[N÷d] + cnt, m)
            end
        end
        for x in sqrtN:-1:p*p
            smalls[x] -= mod(smalls[x] - smalls[x÷p] + cnt, m)
        end

        k += 1
    end

    return PrimePi(N, sqrtN, smalls, larges)
end


"""
    primesum_function(N::Integer)

Returns a function p(n) that can find the sum of primes from 1 to n,
as long as n is of the form fld(N, m) for sum positive integer m.
"""
function primesum_function(N::Integer)
    sqrtN = isqrt(N)
    smalls = [sumto(n) - 1 for n in 1:sqrtN]  # smalls[n] = π(n)
    larges = [sumto(N ÷ n) - 1 for n in 1:N÷sqrtN]  # larges[n] = π(N/n)

    k = 0
    for p in 2:sqrtN
        smalls[p] == smalls[p-1] && continue  # Then p is not prime

        cnt = p * smalls[p-1]
        for x in 1:min(N ÷ sqrtN, N ÷ (p * p))
            d = x * p
            if d ≤ N ÷ sqrtN
                larges[x] -= p * larges[d] - cnt
            else
                larges[x] -= p * smalls[N÷d] - cnt
            end
        end
        for x in sqrtN:-1:p*p
            smalls[x] -= p * smalls[x÷p] - cnt
        end

        k += 1
    end

    return PrimePi(N, sqrtN, smalls, larges)
end


"""
    primesum_function(N::Integer, m::Int64)

Returns a function π(n) that can find the sum of primes from 1 to n mod m,
as long as n is of the form fld(N, m) for sum positive integer m.
"""
function primesum_function(N::Integer, m::Int64)
    sqrtN = isqrt(N)
    smalls = [mod(sumto(n, m) - 1, m) for n in 1:sqrtN]  # smalls[n] = π(n)
    larges = [mod(sumto(N ÷ n, m) - 1, m) for n in 1:N÷sqrtN]  # larges[n] = π(N/n)

    k = 0
    for p in 2:sqrtN
        smalls[p] == smalls[p-1] && continue  # Then p is not prime

        cnt = mod(p * smalls[p-1], m)
        for x in 1:min(N ÷ sqrtN, N ÷ (p * p))
            d = x * p
            if d ≤ N ÷ sqrtN
                larges[x] = mod(larges[x] - p * larges[d] + cnt, m)
            else
                larges[x] = mod(larges[x] - p * smalls[N÷d] + cnt, m)
            end
        end
        for x in sqrtN:-1:p*p
            smalls[x] -= mod(smalls[x] - p * smalls[x÷p] + cnt, m)
        end

        k += 1
    end

    return PrimePi(N, sqrtN, smalls, larges)
end


function _evaluate(primepi::PrimePi{T}, n::T) where {T<:Integer}
    n ≤ primepi.L && return primepi.smalls[n]
    N = primepi.N
    k = N ÷ n
    N ÷ k == n && return primepi.larges[k]
    throw(DomainError(n, "Requires $n to be of the form $N / k for some integer k"))
end

(primepi::PrimePi{T})(n::T) where {T<:Integer} = _evaluate(primepi, n)
