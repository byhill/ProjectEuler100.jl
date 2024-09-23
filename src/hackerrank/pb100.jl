function divisors(n::T) where {T<:Integer}
    divs = [one(T)]
    for (p, e) in eachfactor(n)
        x = [p^i for i in one(T):e]
        L = length(divs)
        for d in divs[1:L], n in x
            push!(divs, d * n)
        end
    end
    sort!(divs)

    return divs
end


##############################################################################
### From Primes.jl
##############################################################################
function is_probably_prime(x::Integer; reps=25)
    return ccall((:__gmpz_probab_prime_p, :libgmp), Cint, (Ref{BigInt}, Cint), x, reps) != 0
end


using Base.Iterators: repeated

import Base: iterate, eltype, IteratorSize, IteratorEltype
using Base: BitSigned


struct Factorization{T<:Integer} <: AbstractDict{T,Int}
    pe::Vector{Pair{T,Int}} # Prime-Exponent

    function Factorization{T}() where {T<:Integer}
        # preallocates enough space that numbers smaller than 2310 won't need to resize
        v = Vector{Pair{T,Int}}(undef, 4)
        empty!(v)
        new{T}(v)
    end
end

function Factorization{T}(d::AbstractDict) where {T<:Integer}
    f = Factorization{T}()
    append!(f.pe, sort!(collect(d)))
    f
end

Factorization(d::AbstractDict{T}) where {T<:Integer} = Factorization{T}(d)
Base.convert(::Type{Factorization}, d::AbstractDict) = Factorization(d)

Base.iterate(f::Factorization, state...) = iterate(f.pe, state...)

function Base.get(f::Factorization, p, default)
    found = searchsortedfirst(f.pe, p, by=first)
    (found > length(f.pe) || first(f.pe[found])) != p ? default : last(f.pe[found])
end

Base.getindex(f::Factorization, p::Integer) = get(f, p, 0)

function Base.setindex!(f::Factorization{T}, e::Int, p::Integer) where {T}
    found = searchsortedfirst(f.pe, p, by=first)
    if found > length(f.pe)
        push!(f.pe, T(p) => e)
    elseif first(f.pe[found]) != p
        insert!(f.pe, found, T(p) => e)
    else
        f.pe[found] = T(p) => e
    end
    f
end

"""
    impliments f[p] += e faster
"""
function increment!(f::Factorization{T}, e::Int, p::Integer) where {T}
    found = searchsortedfirst(f.pe, p, by=first)
    if found > length(f.pe)
        push!(f.pe, T(p) => e)
    elseif first(f.pe[found]) != p
        insert!(f.pe, found, T(p) => e)
    else
        f.pe[found] = T(p) => (last(f.pe[found]) + e)
    end
    f
end
function increment!(f::AbstractDict, e::Int, p::Integer)
    f[p] = get(f, p, 0) + e
    return f
end

Base.length(f::Factorization) = length(f.pe)


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

"""
    isprime(n::Integer) -> Bool

Returns `true` if `n` is prime, and `false` otherwise.

```julia
julia> isprime(3)
true
```
"""
function isprime(n::Integer)
    # Small precomputed primes + Miller-Rabin for primality testing:
    #     https://en.wikipedia.org/wiki/Miller-Rabin_primality_test
    #     https://github.com/JuliaLang/julia/issues/11594
    n < 2 && return false
    trailing_zeros(n) > 0 && return n == 2
    if n < N_SMALL_FACTORS
        return _min_factor(n) == n
    end
    for m in (3, 5, 7, 11, 13, 17, 19, 23)
        n % m == 0 && return false
    end
    s = trailing_zeros(n - 1)
    d = (n - 1) >>> s
    for a in witnesses(n)::Tuple{Vararg{Int}}
        x = powermod(a, d, n)
        x == 1 && continue
        t = s
        while x != n - 1
            (t -= 1) <= 0 && return false
            x = oftype(n, widemul(x, x) % n)
            x == 1 && return false
        end
    end
    return true
end

"""
    isprime(x::BigInt, [reps = 25]) -> Bool
Probabilistic primality test. Returns `true` if `x` is prime with high probability (pseudoprime);
and `false` if `x` is composite (not prime). The false positive rate is about `0.25^reps`.
`reps = 25` is considered safe for cryptographic applications (Knuth, Seminumerical Algorithms).
```julia
julia> isprime(big(3))
true
```
"""
isprime(x::BigInt, reps=25) = is_probably_prime(x; reps=reps)


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
    @inbounds return (Int(bases[i]),)
end
witnesses(n::Integer) =
    n < 4294967296 ? _witnesses(UInt64(n)) :
    n < 2152302898747 ? (2, 3, 5, 7, 11) :
    n < 3474749660383 ? (2, 3, 5, 7, 11, 13) :
    (2, 325, 9375, 28178, 450775, 9780504, 1795265022)

isprime(n::UInt128) =
    n <= typemax(UInt64) ? isprime(UInt64(n)) : isprime(BigInt(n))
isprime(n::Int128) = n < 2 ? false :
                     n <= typemax(UInt64) ? isprime(UInt64(n)) : isprime(BigInt(n))

struct FactorIterator{T<:Integer}
    n::T
    FactorIterator(n::T) where {T} = new{T}(n)
end

IteratorSize(::Type{<:FactorIterator}) = Base.SizeUnknown()
IteratorEltype(::Type{<:FactorIterator}) = Base.HasEltype()
eltype(::Type{FactorIterator{T}}) where {T} = Tuple{T,Int}
Base.isempty(f::FactorIterator) = f.n == 1

# Iterates over the factors of n in an arbitrary order
# Uses a variety of algorithms depending on the size of n to find a factor.
#     https://en.algorithmica.org/hpc/algorithms/factorization
# Cache of small factors for small numbers (n < 2^16)
# Trial division of small (< 2^16) precomputed primes
# Pollard rho's algorithm with Richard P. Brent optimizations
#     https://en.wikipedia.org/wiki/Trial_division
#     https://en.wikipedia.org/wiki/Pollard%27s_rho_algorithm
#     http://maths-people.anu.edu.au/~brent/pub/pub051.html
#

"""
   eachfactor(n::Integer)->FactorIterator
Returns a lazy iterator of factors of `n` in `(factor, multiplicity)` pairs.
This can be very useful for computing multiplicitive functions since for small numbers (eg numbers with no factor `>2^16`),
allocating the storage required for `factor(n)` can introduce significant overhead.
"""
eachfactor(n::Integer) = FactorIterator(n)

# state[1] is the current number to factor (this decreases when factors are found)
# state[2] is the prime to start trial division with.
function iterate(f::FactorIterator{T}, state=(f.n, T(3))) where {T}
    n, p::T = state
    if n <= p
        n == 1 && return nothing
        if n < 0
            # if n is typemin, we can't negate it properly
            # instead we set p=n which we can detect here.
            if isa(n, BitSigned) && n == typemin(T)
                if n != p
                    return (T(-1), 1), (n, n)
                end
                return (T(2), 8 * sizeof(T) - 1), T.((1, 1))
            end
            return (T(-1), 1), (-n, p)
        end
        n == 0 && return (T(n), 1), (T(1), p)
    end
    tz = trailing_zeros(n)
    tz > 0 && return (T(2), tz), (n >> tz, p)
    if n <= N_SMALL_FACTORS
        p = _min_factor(n)
        num_p = 1
        while true
            n = div(n, p)
            n == 1 && break
            _min_factor(n) == p || break
            num_p += 1
        end
        return (p, num_p), (n, p)
    elseif p == 3 && isprime(n)
        return (n, 1), (T(1), n)
    end
    for p in p:2:N_SMALL_FACTORS
        _min_factor(p) == p || continue
        num_p = 0
        while true
            q, r = divrem(n, T(p)) # T(p) so julia <1.9 uses fast divrem for `BigInt`
            r == 0 || break
            num_p += 1
            n = q
        end
        if num_p > 0
            return (p, num_p), (n, p + 2)
        end
        p * p > n && break
    end
    # if n < 2^32, then if it wasn't prime, we would have found the factors by trial division
    if n <= 2^32 || isprime(n)
        return (n, 1), (T(1), n)
    end
    should_widen = T <: BigInt || widemul(n - 1, n - 1) <= typemax(n)
    p = should_widen ? pollardfactor(n) : pollardfactor(widen(n))
    num_p = 0
    while true
        q, r = divrem(n, p)
        r != 0 && return (p, num_p), (n, p)
        num_p += 1
        n = q
    end
end

function factor!(n::T, h::AbstractDict{K,Int}) where {T<:Integer,K<:Integer}
    for (p, num_p) in eachfactor(n)
        increment!(h, num_p, p)
    end
    return h
end

factor(n::T) where {T<:Integer} = factor!(n, Factorization{T}())


function pollardfactor(n::T) where {T<:Integer}
    while true
        c::T = rand(1:(n-1))
        G::T = 1
        r::T = 1
        y::T = rand(0:(n-1))
        m::T = 100
        ys::T = 0
        q::T = 1
        x::T = 0
        while c == n - 2
            c = rand(1:(n-1))
        end
        while G == 1
            x = y
            for i in 1:r
                y = y^2 % n
                y = (y + c) % n
            end
            k::T = 0
            G = 1
            while k < r && G == 1
                ys = y
                for i in 1:(m > (r - k) ? (r - k) : m)
                    y = y^2 % n
                    y = (y + c) % n
                    q = (q * (x > y ? x - y : y - x)) % n
                end
                G = gcd(q, n)
                k += m
            end
            r *= 2
        end
        G == n && (G = 1)
        while G == 1
            ys = ys^2 % n
            ys = (ys + c) % n
            G = gcd(x > ys ? x - ys : ys - x, n)
        end
        if G != n
            G2 = div(n, G)
            f = min(G, G2)
            _gcd = gcd(G, G2)
            if _gcd != 1
                f = _gcd
            end
            return isprime(f) ? f : pollardfactor(f)
        end
    end
end


##############################################################################
### From ModularSquareRoots.jl (written by me)
##############################################################################
sqrtmod(n::Integer, m::Integer) = sqrtmod(promote(n, m)...)
sqrtmodprimepower(n::Integer, p::Integer, k::Integer) = sqrtmodprimepower(promote(n, p)..., k)
sqrtmodprime(n::Integer, p::Integer) = sqrtmodprime(promote(n, p)...)


function sqrtmod(n::T, m::T) where {T<:Integer}
    m <= 0 && throw(DomainError(m, "The modulus `m` must be a positive integer"))
    m == 1 && return T[0]

    roots = T[0]
    newroots = T[]
    mm = one(T)
    for (p, e) in eachfactor(m)
        for a1 in sqrtmodprimepower(n, T(p), e)
            for a2 in roots
                push!(newroots, crt([a1, a2], [p^e, mm], p^e * mm))
            end
        end

        mm *= p^e
        roots, newroots = newroots, roots
        empty!(newroots)
    end

    return roots
end


function sqrtmodprimepower(n::T, p::T, k::Integer) where {T<:Integer}
    k == 1 && return sqrtmodprime(n, p)

    q = p^k
    n = mod(n, q)
    powermod(n, (p - 1) >> 1, p) == -1 && return T[]

    roots = T[]
    for r in sqrtmodprimepower(n, p, k - 1)
        if mod(2r, p) != 0
            s = mod(r - (r^2 - n) * invmod(2r, p), q)
            push!(roots, s)
        elseif mod(r^2 - n, q) == 0
            for t = 0:p-1
                push!(roots, r + t * p^(k - 1))
            end
        end
    end

    return roots
end


function sqrtmodprime(n::T, p::T) where {T<:Integer}
    n = mod(n, p)
    iszero(n) && return [zero(T)]
    p == 2 && return [one(T)]
    powermod(n, (p - 1) >> 1, p) == p - 1 && return T[]
    if mod(p, 4) == 3
        r = powermod(n, p >> 2 + 1, p)
        return T[r, p-r]
    end

    (Q, S) = (p - 1, 0)
    while iseven(Q)
        Q >>= 1
        S += 1
    end
    z = first(z for z in 2:p-1 if powermod(z, (p - 1) >> 1, p) == p - 1)

    M = S
    c = powermod(z, Q, p)
    t = powermod(n, Q, p)
    R = powermod(n, (Q + 1) >> 1, p)

    while true
        isone(t) && return [R, p - R]
        i = first(i for i in 1:M-1 if powermod(t, 2^i, p) == 1)

        b = powermod(c, 2^(M - i - 1), p)
        M = i
        c = powermod(b, 2, p)

        (tc, flag) = Base.mul_with_overflow(t, c)
        t = flag ? T(mod(widemul(t, c), p)) : mod(tc, p)

        (Rb, flag) = Base.mul_with_overflow(R, b)
        R = flag ? T(mod(widemul(R, b), p)) : mod(Rb, p)
    end
end


function crt(a, n, m::T) where {T<:Integer}
    ans = zero(T)
    for (ai, ni) in zip(a, n)
        u = div(m, ni)
        x = invmod(u, ni) * u

        (y, flag) = Base.mul_with_overflow(ai, x)
        x = flag ? T(mod(widemul(ai, x), m)) : mod(y, m)

        ans = ans < m - x ? ans + x : -m + ans + x
    end

    return ans
end


##############################################################################
### From PellsEquation.jl (written by me)
##############################################################################
@inline issquare(n::Integer) = isqrt(n)^2 == n


function squarefactors(n::T) where {T<:Integer}
    factors = [one(T)]
    for (p, e) in eachfactor(n)
        x = [p^i for i in 1:e>>1]
        L = length(factors)
        for d in factors[1:L], n in x
            push!(factors, d * n)
        end
    end
    sort!(factors)

    return factors
end


struct PQA{T}
    D::T
    P::T
    Q::T
end

PQa(D::T, P::Integer, Q::Integer) where {T<:Integer} = PQa(D, convert(T, P), convert(T, Q))
function PQa(D::T, P::T, Q::T) where {T<:Integer}
    return PQA{T}(D, P, Q)
end

function Base.iterate(it::PQA{T}) where {T<:Integer}
    (A2, A1) = (zero(T), one(T))
    (B2, B1) = (one(T), zero(T))
    (G2, G1) = (-it.P, it.Q)

    a0 = it.Q < 0 && it.D > 0 ? fld(it.P + isqrt(it.D - 1) + 1, it.Q) : fld(it.P + isqrt(it.D), it.Q)
    A0 = a0 * A1 + A2
    B0 = a0 * B1 + B2
    G0 = a0 * G1 + G2

    ret = (i=0, P=it.P, Q=it.Q, a=a0, A=A0, B=B0, G=G0)
    state = (0, it.P, it.Q, a0, (A0, A1), (B0, B1), (G0, G1))
    return (ret, state)
end


function Base.iterate(it::PQA{T}, state) where {T<:Integer}
    (i, P1, Q1, a1, (A1, A2), (B1, B2), (G1, G2)) = state
    D = it.D

    i += 1
    Pi = a1 * Q1 - P1
    Qi = div(D - Pi^2, Q1)
    iszero(Qi) && return nothing
    ai = fld(Pi + isqrt(D), Qi)
    Ai = ai * A1 + A2
    Bi = ai * B1 + B2
    Gi = ai * G1 + G2

    ret = (i=i, P=Pi, Q=Qi, a=ai, A=Ai, B=Bi, G=Gi)
    state = (i, Pi, Qi, ai, (Ai, A1), (Bi, B1), (Gi, G1))
    return (ret, state)
end

Base.IteratorSize(::Type{PQA{T}}) where {T} = Base.IsInfinite()
eltype(::Type{PQA{T}}) where {T} = NamedTuple{(:i, :P, :Q, :a, :A, :B, :G),Tuple{Int64,Vararg{BigInt,6}}}


function fundamental_soln(D::T) where {T<:Integer}
    a0 = isqrt(D)
    (G, B) = (zero(T), zero(T))
    for pqa in PQa(D, 0, 1)
        if pqa.a == 2a0
            (x0, y0) = (G, B)
            return (pqa.i, x0, y0)
        end
        (G, B) = (pqa.G, pqa.B)
    end
end


function pellseqn1(D::T) where {T<:Integer}
    (l, x0, y0) = fundamental_soln(D)
    if isodd(l)
        (x0, y0) = (x0 * x0 + D * y0 * y0, 2x0 * y0)
    end

    queue = Tuple{T,T}[(1, 0)]
    return PellsEqn{T}(D, x0, y0, queue)
end


function pellseqn_neg1(D::T) where {T<:Integer}
    (l, x0, y0) = fundamental_soln(D)

    iseven(l) && return PellsEqn{T}(D, 0, 0, Tuple{T,T}[])

    queue = Tuple{T,T}[(x0, y0)]
    (u, v) = (x0 * x0 + D * y0 * y0, 2x0 * y0)
    return PellsEqn{T}(D, u, v, queue)
end


function fundamental_soln(D::T, P::T, Q::T) where {T<:Integer}
    (P_reduced, Q_reduced) = (zero(T), zero(T))
    (G, B) = (abs(Q), zero(T))

    for pqa in PQa(D, P, Q)
        abs(pqa.Q) == 1 && return (G, B)
        (pqa.P, pqa.Q) == (P_reduced, Q_reduced) && return nothing

        (G, B) = (pqa.G, pqa.B)
        if (P_reduced, Q_reduced) == (0, 0)
            zeta = div(pqa.P + isqrt(D), pqa.Q)
            zetabar = div(pqa.P - isqrt(D), pqa.Q)
            if zeta >= 1 && pqa.P <= isqrt(D - 1) && zetabar == 0
                (P_reduced, Q_reduced) = (pqa.P, pqa.Q)
            end
        end
    end
end


function fundamental_solns(D::T, N::T) where {T<:Integer}
    (t, u) = isempty(pellseqn_neg1(D)) ? (zero(T), zero(T)) : first(pellseqn_neg1(D))
    solns = Tuple{T,T}[]

    for f in squarefactors(N)
        m = div(N, f^2)
        for z in sqrtmod(D, abs(m))
            soln = fundamental_soln(D, z, abs(m))
            isnothing(soln) && continue
            (r, s) = soln
            if r^2 - D * s^2 == m
                push!(solns, (f * r, f * s))
            elseif (t, u) != (0, 0)
                push!(solns, (f * (r * t + D * s * u), f * (r * u + s * t)))
            end
        end
    end
    unique!(solns)

    return solns
end


function _pellseqn(D::T, N::T) where {T<:Integer}
    i, t, u = fundamental_soln(D)
    if isodd(i)
        t, u = t * t + D * u * u, 2t * u
    end

    queue = Tuple{T,T}[]
    for (x, y) in fundamental_solns(D, N)
        isless(x, 0) && ((x, y) = (-x, -y))
        isless(y, 0) && ((x, y) = (x * t + D * y * u, x * u + y * t))
        isless(x, 0) && ((x, y) = (-x, -y))
        push!(queue, (x, y))
    end
    sort!(queue)

    return PellsEqn{T}(D, t, u, queue)
end


@enum SolutionType begin
    pellsolution
    zerocoeff
    finite
end

struct PellsEqn{T}
    D::T
    u::T
    v::T
    queue::Vector{Tuple{T,T}}
    solntype::SolutionType
end

PellsEqn{T}(D, u, v, queue) where {T} = PellsEqn{T}(D, u, v, queue, pellsolution)


function Base.iterate(it::PellsEqn)
    state = it.queue
    isempty(state) && return nothing

    (x, y) = popfirst!(state)
    (D, u, v) = (it.D, it.u, it.v)
    if it.solntype == pellsolution
        (xn, yn) = (x * u + D * y * v, x * v + y * u)
        push!(state, (xn, yn))
    elseif it.solntype == zerocoeff
        (xn, yn) = (x + u, y + v)
        push!(state, (xn, yn))
    end

    return ((x, y), state)
end

function Base.iterate(it::PellsEqn, state)
    isempty(state) && return nothing

    (x, y) = popfirst!(state)
    (D, u, v) = (it.D, it.u, it.v)
    if it.solntype == pellsolution
        (xn, yn) = (x * u + D * y * v, x * v + y * u)
        push!(state, (xn, yn))
    elseif it.solntype == zerocoeff
        (xn, yn) = (x + u, y + v)
        push!(state, (xn, yn))
    end

    return ((x, y), state)
end

Base.IteratorSize(::Type{PellsEqn{T}}) where {T} = Base.SizeUnknown()
Base.eltype(::Type{PellsEqn{T}}) where {T} = Tuple{T,T}


pellseqn(D::Integer, N::Integer=1) = pellseqn(big(D), big(N))
function pellseqn(D::BigInt, N::BigInt=big(1))
    D < 0 && throw(DomainError(D, "D must be a nonnegative integer"))

    T = BigInt
    TT = Tuple{T,T}
    if iszero(D)
        if issquare(N)
            return PellsEqn(D, zero(T), one(T), [(isqrt(N), zero(T))], zerocoeff)
        else
            return PellsEqn(D, zero(T), one(T), TT[], finite)
        end

    elseif iszero(N)
        if issquare(D)
            return PellsEqn(D, isqrt(D), one(D), [(zero(T), zero(T))], zerocoeff)
        else
            return PellsEqn(D, isqrt(D), one(D), [(zero(T), zero(T))], finite)
        end

    elseif issquare(D)
        D = isqrt(D)
        solns = TT[]
        for d1 in divisors(N)
            N < 0 && (d1 = -d1)
            d2 = div(N, d1)

            x = d1 + d2
            iseven(x) || continue
            x >= 0 || continue
            x >>= 1

            y = (d2 - d1)
            y >= 0 || continue
            iszero(mod(y, 2D)) || continue
            y = div(y, 2D)

            push!(solns, (x, y))
        end

        return PellsEqn(D, zero(T), zero(T), sort(solns), finite)

    elseif isone(N)
        return pellseqn1(D)
    elseif isone(-N)
        return pellseqn_neg1(D)
    else
        return _pellseqn(D, N)
    end
end


##############################################################################


function problem100(P, Q, M)
    r = maximum(squarefactors(Q))
    q = div(Q, r^2)
    D = q * P
    N = q * (Q - P)

    for (x, y) in pellseqn(D, N)
        iszero(mod(x + q * r, 2q * r)) || continue
        iseven(y + 1) || continue
        b = div(x + q * r, 2q * r)
        n = div(y + 1, 2)

        n > M || continue
        println("$b $n")
        return nothing
    end

    println("No solution")
    return nothing
end


Q = parse(Int, readline())
for _ in 1:Q
    (p, q, D) = Tuple(parse(Int, n) for n in split(readline(), " "))
    g = gcd(p, q)
    p = div(p, g)
    q = div(q, g)
    problem100(p, q, D)
end
