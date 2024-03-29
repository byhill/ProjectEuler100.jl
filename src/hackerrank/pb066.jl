##############################################################################
### From PellsEquation.jl (A package by me)
##############################################################################

@inline issquare(n::Integer) = isqrt(n)^2 == n

# --------------------------------------------------------------------
# PQa algorithm

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

# --------------------------------------------------------------------
# Pell's Equation:  x^2 - Dy^2 = 1


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
    if isodd(l)  # Then the fundamental solution we found is for x^2 - Dy^2 = -1
        (x0, y0) = (x0 * x0 + D * y0 * y0, 2x0 * y0)
    end

    queue = Tuple{T,T}[(1, 0)]
    return PellsEqn{T}(D, x0, y0, queue)
end

# --------------------------------------------------------------------
# Negative Pell's Equation:  x^2 - Dy^2 = -1


function pellseqn_neg1(D::T) where {T<:Integer}
    (l, x0, y0) = fundamental_soln(D)

    # Has no solutions, return empty iterator
    iseven(l) && return PellsEqn{T}(D, 0, 0, Tuple{T,T}[])

    queue = Tuple{T,T}[(x0, y0)]
    (u, v) = (x0 * x0 + D * y0 * y0, 2x0 * y0)
    return PellsEqn{T}(D, u, v, queue)
end


# --------------------------------------------------------------------
# Iterator implementation

@enum SolutionType begin  # x^2 - Dy^2 = N, where...
    pellsolution  # D nonsquare, N nonzero
    zerocoeff  # D or N are zero and the other is square
    finite  # D > 0 square, or N is zero and D is nonsquare
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

# --------------------------------------------------------------------
# Public Interface

pellseqn(D::Integer, N::Integer=1) = pellseqn(big(D), big(N))

function pellseqn(D::BigInt, N::BigInt=big(1))
    D < 0 && throw(DomainError(D, "D must be a nonnegative integer"))

    if isone(N)
        return pellseqn1(D)
    elseif isone(-N)
        return pellseqn_neg1(D)
    else
        return nothing
    end
end
##############################################################################

using .Iterators

function problem066(N::Integer)
    return argmax([issquare(n) ? 0 : first(first(drop(pellseqn(n), 1))) for n in 1:N])
end


N = parse(Int, readline())
println(problem066(N))
