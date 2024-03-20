sumto(n) = (n * (n + 1)) >> 1


struct PrimeSum{T}
    N::T
    L::T
    smalls::Vector{T}
    larges::Vector{T}
end


"""
    primesum_function(N::Integer)

Returns a function p(n) that can find the sum of primes from 1 to n,
as long as n is of the form fld(N, m) for sum positive integer m.
"""
function primesum_function(N::Integer)
    sqrtN = isqrt(N)
    smallPhi = [sumto(n) - 1 for n in 1:sqrtN]  # smallPhi[n] = Phi(n, _)
    largePhi = [sumto(div(N, n)) - 1 for n in 1:div(N, sqrtN)]  # largePhi[n] = Phi(N/n, _)

    k = 0
    for p in 2:sqrtN
        if isequal(smallPhi[p], smallPhi[p-1])  # Then p is not prime
            continue  # Try next p
        end

        cnt = p * smallPhi[p-1]
        for x in 1:min(div(N, sqrtN), div(N, p^2))
            d = x * p
            if d <= div(N, sqrtN)
                largePhi[x] -= p * largePhi[d] - cnt
            else
                largePhi[x] -= p * smallPhi[div(N, d)] - cnt
            end
        end
        for x in sqrtN:-1:p^2
            smallPhi[x] -= p * smallPhi[div(x, p)] - cnt
        end

        k += 1
    end

    return PrimeSum(N, sqrtN, smallPhi, largePhi)
end


function _evaluate(primepi::PrimeSum{T}, n::T) where {T<:Integer}
    n <= primepi.L && return primepi.smalls[n]
    N = primepi.N
    k = div(N, n)
    div(N, k) == n && return primepi.larges[k]
    throw(DomainError(n, "Requires $n to be of the form $N / k for some integer k"))
end

(primepi::PrimeSum{T})(n::T) where {T<:Integer} = _evaluate(primepi, n)


function problem010(N::Integer)
    return primesum_function(N)(N)
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem010(N))
end
