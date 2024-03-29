##############################################################################
### From PellsEquation.jl (A package by me)
##############################################################################

struct PQA{T}
    D::T
    P::T
    Q::T
end


PQa(D::T, P::Integer, Q::Integer) where {T<:Integer} = PQa(D, convert(T, P), convert(T, Q))
function PQa(D::T, P::T, Q::T) where {T<:Integer}
    iszero(Q) && throw(DomainError(Q))
    isless(D, 0) && throw(DomainError(D))
    mod(powermod(P, 2, Q) - D, Q) == 0 || throw(DomainError(P))

    return PQA{T}(D, P, Q)
end


function Base.iterate(it::PQA{T}) where {T<:Integer}
    (A2, A1) = (zero(T), one(T))
    (B2, B1) = (one(T), zero(T))
    (G2, G1) = (-it.P, it.Q)

    a0 = div(it.P + isqrt(it.D), it.Q)
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
    ai = div(Pi + isqrt(D), Qi)
    Ai = ai * A1 + A2
    Bi = ai * B1 + B2
    Gi = ai * G1 + G2

    ret = (i=i, P=Pi, Q=Qi, a=ai, A=Ai, B=Bi, G=Gi)
    state = (i, Pi, Qi, ai, (Ai, A1), (Bi, B1), (Gi, G1))
    return (ret, state)
end

Base.IteratorSize(::Type{PQA{T}}) where {T} = Base.SizeUnknown()
Base.eltype(::Type{PQA{T}}) where {T} = NamedTuple{(:i, :P, :Q, :a, :A, :B, :G),Tuple{Int64,Vararg{T,6}}}


struct ContinuedFraction
    PQa::PQA{BigInt}
end


continued_fraction(D::Integer, P::Integer=0, Q::Integer=1) = continued_fraction(big(D), big(P), big(Q))
function continued_fraction(D::BigInt, P::BigInt, Q::BigInt)
    D *= Q^2
    P *= abs(Q)
    Q *= abs(Q)
    pqa = PQa(D, P, Q)
    return ContinuedFraction(pqa)
end


function Base.iterate(itr::ContinuedFraction)
    pqa = itr.PQa
    ret, state = iterate(pqa)
    return ((ret.a, ret.A, ret.B), state)
end

function Base.iterate(itr::ContinuedFraction, state)
    pqa = itr.PQa
    x = iterate(pqa, state)
    isnothing(x) && return nothing
    ret, state = x
    return ((ret.a, ret.A, ret.B), state)
end

Base.IteratorSize(::Type{ContinuedFraction}) = Base.SizeUnknown()
Base.eltype(::Type{ContinuedFraction}) = Tuple{Int,BigInt,BigInt}

##############################################################################

using .Iterators

@inline issquare(n::Integer) = isqrt(n)^2 == n


function cfperiod(N)
    a0 = isqrt(N)
    for (i, (a, _, _)) in zip(countfrom(0), continued_fraction(N))
        a == 2a0 && return i
    end

    return 0
end


function problem064(N::Integer=10000)
    return count(isodd, (cfperiod(n) for n in 2:N if !issquare(n)))
end


N = parse(Int, readline())
println(problem064(N))
