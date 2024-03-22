##############################################################################
### From Combinatorics.jl
##############################################################################
struct Permutations{T}
    a::T
    t::Int
end

Base.eltype(::Type{Permutations{T}}) where {T} = Vector{eltype(T)}

Base.length(p::Permutations) = (0 <= p.t <= length(p.a)) ? factorial(length(p.a), length(p.a) - p.t) : 0

permutations(a) = Permutations(a, length(a))

function permutations(a, t::Integer)
    if t < 0
        t = length(a) + 1
    end
    Permutations(a, t)
end

function Base.iterate(p::Permutations, s=collect(1:length(p.a)))
    (!isempty(s) && max(s[1], p.t) > length(p.a) || (isempty(s) && p.t > 0)) && return
    nextpermutation(p.a, p.t, s)
end

function nextpermutation(m, t, state)
    perm = [m[state[i]] for i in 1:t]
    n = length(state)
    if t <= 0
        return (perm, [n + 1])
    end
    s = copy(state)
    if t < n
        j = t + 1
        while j <= n && s[t] >= s[j]
            j += 1
        end
    end
    if t < n && j <= n
        s[t], s[j] = s[j], s[t]
    else
        if t < n
            reverse!(s, t + 1)
        end
        i = t - 1
        while i >= 1 && s[i] >= s[i+1]
            i -= 1
        end
        if i > 0
            j = n
            while j > i && s[i] >= s[j]
                j -= 1
            end
            s[i], s[j] = s[j], s[i]
            reverse!(s, i + 1)
        else
            s[1] = n + 1
        end
    end
    return (perm, s)
end
##############################################################################

const PRIMES = (2, 3, 5, 7, 11, 13, 17)

undigits(digits::Vector{T}; base::Integer=10) where {T<:Integer} = undigits(T, digits; base=base)

function undigits(T::Type{<:Integer}, digits::Vector{U}; base::Integer=10) where {U<:Integer}
    return foldr((a, b,) -> muladd(base, b, a), digits, init=zero(T))
end


function problem043(N::Integer)
    ans = 0
    divisors = reverse(PRIMES[1:N-2])
    for p in permutations(0:N)
        all(undigits(p[i:i+2]) % divisors[i] == 0 for i = 1:N-2) && (ans += undigits(p))
    end
    return ans
end


N = parse(Int, readline())
println(problem043(N))
