##############################################################################
### From Primes.jl and IntegerMathUtils.jl
##############################################################################
function is_probably_prime(x::Integer; reps=25)
    if !(x isa BigInt)
        x = BigInt(x)
    end
    return ccall((:__gmpz_probab_prime_p, :libgmp), Cint, (Ref{BigInt}, Cint), x, reps) != 0
end

function kronecker(a::BigInt, b::Clong)
    return ccall((:__gmpz_kronecker_si, :libgmp), Cint, (Ref{BigInt}, Clong), a, b)
end
function kronecker(a::Clong, b::BigInt)
    return ccall((:__gmpz_si_kronecker, :libgmp), Cint, (Clong, Ref{BigInt}), a, b)
end
function kronecker(a, n)
    @assert n != -n || n == 0
    @assert a != -a || a == 0
    t = 1
    if iszero(n)
        return Int(abs(a) == 1)
    end
    if n < 0
        n = abs(n)
        if a < 0
            t = -t
        end
    end
    trail = trailing_zeros(n)
    if trail > 0
        n >>= trail
        if iseven(a)
            return 0
        elseif isodd(trail) && a & 7 in (3, 5)
            t = -t
        end
    end
    a = mod(a, n)
    while a != 0
        while iseven(a)
            a = a >> 1
            if n & 7 in (3, 5)
                t = -t
            end
        end
        a, n = n, a
        if a & 3 == n & 3 == 3
            t = -t
        end
        a = mod(a, n)
    end
    return n == 1 ? t : 0
end

function _generate_min_factors(limit)
    function min_factor(n)
        n < 4 && return n
        for i in 3:2:isqrt(n)
            n % i == 0 && return i
        end
        return n
    end
    res = Int[]
    for i in 3:2:limit
        m = min_factor(i)
        push!(res, m == i ? 1 : m)
    end
    return res
end

const N_SMALL_FACTORS = 2^16
const _MIN_FACTOR = UInt8.(_generate_min_factors(N_SMALL_FACTORS))
# _min_factor(n) = the minimum factor of n for odd n, if 1<n<N_SMALL_FACTORS
function _min_factor(n::T) where {T<:Integer}
    m = _MIN_FACTOR[n>>1]
    return m == 1 ? n : T(m)
end

function isprime(n::Integer)
    n <= typemax(Int64) && return isprime(Int64(n))
    return isprime(BigInt(n))
end

function isprime(n::Int64)
    iseven(n) && return n == 2
    if n < N_SMALL_FACTORS
        n < 2 && return false
        return _min_factor(n) == n
    end
    for m in (3, 5, 7, 11, 13, 17, 19, 23)
        n % m == 0 && return false
    end
    if n < 2^32
        return miller_rabbin_test(_witnesses(UInt64(n)), n)
    end
    miller_rabbin_test(2, n) || return false
    return lucas_test(widen(n))
end

const bases = UInt16[
    15591, 2018, 166, 7429, 8064, 16045, 10503, 4399, 1949, 1295, 2776, 3620,
    560, 3128, 5212, 2657, 2300, 2021, 4652, 1471, 9336, 4018, 2398, 20462,
    10277, 8028, 2213, 6219, 620, 3763, 4852, 5012, 3185, 1333, 6227, 5298,
    1074, 2391, 5113, 7061, 803, 1269, 3875, 422, 751, 580, 4729, 10239,
    746, 2951, 556, 2206, 3778, 481, 1522, 3476, 481, 2487, 3266, 5633,
    488, 3373, 6441, 3344, 17, 15105, 1490, 4154, 2036, 1882, 1813, 467,
    3307, 14042, 6371, 658, 1005, 903, 737, 1887, 7447, 1888, 2848, 1784,
    7559, 3400, 951, 13969, 4304, 177, 41, 19875, 3110, 13221, 8726, 571,
    7043, 6943, 1199, 352, 6435, 165, 1169, 3315, 978, 233, 3003, 2562,
    2994, 10587, 10030, 2377, 1902, 5354, 4447, 1555, 263, 27027, 2283, 305,
    669, 1912, 601, 6186, 429, 1930, 14873, 1784, 1661, 524, 3577, 236,
    2360, 6146, 2850, 55637, 1753, 4178, 8466, 222, 2579, 2743, 2031, 2226,
    2276, 374, 2132, 813, 23788, 1610, 4422, 5159, 1725, 3597, 3366, 14336,
    579, 165, 1375, 10018, 12616, 9816, 1371, 536, 1867, 10864, 857, 2206,
    5788, 434, 8085, 17618, 727, 3639, 1595, 4944, 2129, 2029, 8195, 8344,
    6232, 9183, 8126, 1870, 3296, 7455, 8947, 25017, 541, 19115, 368, 566,
    5674, 411, 522, 1027, 8215, 2050, 6544, 10049, 614, 774, 2333, 3007,
    35201, 4706, 1152, 1785, 1028, 1540, 3743, 493, 4474, 2521, 26845, 8354,
    864, 18915, 5465, 2447, 42, 4511, 1660, 166, 1249, 6259, 2553, 304,
    272, 7286, 73, 6554, 899, 2816, 5197, 13330, 7054, 2818, 3199, 811,
    922, 350, 7514, 4452, 3449, 2663, 4708, 418, 1621, 1171, 3471, 88,
    11345, 412, 1559, 194
]

function _witnesses(n::UInt64)
    i = xor((n >> 16), n) * 0x45d9f3b
    i = xor((i >> 16), i) * 0x45d9f3b
    i = xor((i >> 16), i) & 255 + 1
    @inbounds return Int(bases[i])
end

function miller_rabbin_test(a, n::T) where {T<:Signed}
    s = trailing_zeros(n - 1)
    d = (n - 1) >>> s
    x::T = powermod(a, d, n)
    if x != 1
        t = s
        while x != n - 1
            (t -= 1) <= 0 && return false
            x = widemul(x, x) % n
            x == 1 && return false
        end
    end
    return true
end

function lucas_test(n::T) where {T<:Signed}
    s = isqrt(n)
    @assert s <= typemax(T) #to prevent overflow
    s^2 == n && return false
    # find Lucas test params
    D::T = 5
    for (s, d) in zip(Iterators.cycle((1, -1)), 5:2:n)
        D = s * d
        k = kronecker(D, n)
        k != 1 && break
    end
    k == 0 && return false
    # Lucas test with P=1
    Q::T = (1 - D) >> 2
    U::T, V::T, Qk::T = 1, 1, Q
    k::T = (n + 1)
    trail = trailing_zeros(k)
    k >>= trail
    # get digits 1 at a time since digits allocates
    for b in ndigits(k, base=2)-2:-1:0
        U = mod(U * V, n)
        V = mod(V * V - Qk - Qk, n)
        Qk = mod(Qk * Qk, n)
        if isodd(k >> b) == 1
            Qk = mod(Qk * Q, n)
            U, V = U + V, V + U * D
            # adding n makes them even
            # so we can divide by 2 without causing problems
            isodd(U) && (U += n)
            isodd(V) && (V += n)
            U = mod(U >> 1, n)
            V = mod(V >> 1, n)
        end
    end
    if U in 0
        return true
    end
    for _ in 1:trail
        V == 0 && return true
        V = mod(V * V - Qk - Qk, n)
        Qk = mod(Qk * Qk, n)
    end
    return false
end
isprime(x::BigInt, reps=25) = x > 1 && is_probably_prime(x; reps=reps)

##############################################################################


using .Iterators


"""
    problem037()

Problem 037 of Project Euler.

https://projecteuler.net/problem=037
"""
function problem037(N::Integer)
    return sum(n for n in right_truncatable_primes() if left_truncatable_prime(n) && n < N)
end


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


N = parse(Int, readline())
println(problem037(N))
