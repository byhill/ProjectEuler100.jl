##############################################################################
### From Primes.jl
##############################################################################
const wheel = [4, 2, 4, 2, 4, 6, 2, 6]
const wheel_primes = [7, 11, 13, 17, 19, 23, 29, 31]
const wheel_indices = [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 7, 7]

@inline function wheel_index(n)
    d, r = divrem(n - 1, 30)
    return 8d + wheel_indices[r+2]
end
@inline function wheel_prime(n)
    d, r = (n - 1) >>> 3, (n - 1) & 7
    return 30d + wheel_primes[r+1]
end

function _primesmask(limit::Int)
    limit < 7 && throw(ArgumentError("The condition limit >= 7 must be met."))
    n = wheel_index(limit)
    m = wheel_prime(n)
    sieve = ones(Bool, n)
    @inbounds for i = 1:wheel_index(isqrt(limit))
        if sieve[i]
            p = wheel_prime(i)
            q = p^2
            j = (i - 1) & 7 + 1
            while q <= m
                sieve[wheel_index(q)] = false
                q += wheel[j] * p
                j = j & 7 + 1
            end
        end
    end
    return sieve
end

function _primesmask(lo::Int, hi::Int)
    7 <= lo <= hi || throw(ArgumentError("The condition 7 <= lo <= hi must be met."))
    lo == 7 && return _primesmask(hi)
    wlo, whi = wheel_index(lo - 1), wheel_index(hi)
    m = wheel_prime(whi)
    sieve = ones(Bool, whi - wlo)
    hi < 49 && return sieve
    small_sieve = _primesmask(isqrt(hi))
    @inbounds for i = 1:length(small_sieve)  # don't use eachindex here
        if small_sieve[i]
            p = wheel_prime(i)
            j = wheel_index(2 * div(lo - p - 1, 2p) + 1)
            r = widemul(p, wheel_prime(j + 1))
            r > m && continue # use widemul to avoid r <= m caused by overflow
            j = j & 7 + 1
            q = Int(r)
            # q < 0 indicates overflow when incrementing q inside loop
            while 0 <= q <= m
                sieve[wheel_index(q)-wlo] = false
                q += wheel[j] * p
                j = j & 7 + 1
            end
        end
    end
    return sieve
end

"""
    primesmask([lo,] hi)

Returns a prime sieve, as a `BitArray`, of the positive integers (from `lo`, if specified)
up to `hi`. Useful when working with either primes or composite numbers.
"""
function primesmask(lo::Int, hi::Int)
    0 < lo <= hi || throw(ArgumentError("The condition 0 < lo <= hi must be met."))
    sieve = falses(hi - lo + 1)
    lo <= 2 <= hi && (sieve[3-lo] = true)
    lo <= 3 <= hi && (sieve[4-lo] = true)
    lo <= 5 <= hi && (sieve[6-lo] = true)
    hi < 7 && return sieve
    wheel_sieve = _primesmask(max(7, lo), hi)
    lsi = lo - 1
    lwi = wheel_index(lsi)
    @inbounds for i = 1:length(wheel_sieve)   # don't use eachindex here
        sieve[wheel_prime(i + lwi)-lsi] = wheel_sieve[i]
    end
    return sieve
end
primesmask(lo::Integer, hi::Integer) = lo <= hi <= typemax(Int) ? primesmask(Int(lo), Int(hi)) :
                                       throw(ArgumentError("Both endpoints of the interval to sieve must be <= $(typemax(Int)), got $lo and $hi."))

primesmask(limit::Int) = primesmask(1, limit)
primesmask(n::Integer) = n <= typemax(Int) ? primesmask(Int(n)) :
                         throw(ArgumentError("Requested number of primes must be <= $(typemax(Int)), got $n."))

"""
    primes([lo,] hi)

Returns a collection of the prime numbers (from `lo`, if specified) up to `hi`.
"""
function primes(lo::Int, hi::Int)
    lo <= hi || throw(ArgumentError("The condition lo <= hi must be met."))
    list = Int[]
    lo <= 2 <= hi && push!(list, 2)
    lo <= 3 <= hi && push!(list, 3)
    lo <= 5 <= hi && push!(list, 5)
    hi < 7 && return list
    lo = max(2, lo)
    sizehint!(list, 5 + floor(Int, hi / (log(hi) - 1.12) - lo / (log(lo) - 1.12 * (lo > 7)))) # http://projecteuclid.org/euclid.rmjm/1181070157
    sieve = _primesmask(max(7, lo), hi)
    lwi = wheel_index(lo - 1)
    @inbounds for i = 1:length(sieve)   # don't use eachindex here
        sieve[i] && push!(list, wheel_prime(i + lwi))
    end
    return list
end
primes(n::Int) = primes(1, n)

##############################################################################


function divisorsum_sieve(N::Int)
    sieve = zeros(Int, N)
    sieve[1] = 1

    for p in primes(N)
        q = 1
        coeff = 1
        while p * q <= N
            q *= p
            coeff += q
            sieve[q] = coeff
            for n in 2:div(N, q)
                iszero(sieve[n]) && continue
                iszero(n % p) && continue
                sieve[n*q] = sieve[n] * sieve[q]
            end
        end
    end

    return sieve
end


function problem095(N::Integer)
    sigma = divisorsum_sieve(N)
    for n in 1:N
        sigma[n] -= n
    end

    ans = 0
    max = 0
    chain = Int[]
    cache = falses(N)

    for n in 2:N
        cache[n] && continue

        push!(chain, n)
        m = sigma[n]
        while 1 < m <= N && !cache[m]
            cache[m] = true
            push!(chain, m)
            m = sigma[m]
        end

        if m in chain
            x = pop!(chain)
            n = x
            l = 1
            while x != m
                x = pop!(chain)
                l += 1
                n = min(x, n)
            end

            if l > max
                ans = n
                max = l
            end
        end

        empty!(chain)
    end

    return ans
end


N = parse(Int, readline())
println(problem095(N))
