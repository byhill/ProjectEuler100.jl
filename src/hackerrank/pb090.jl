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


struct Combinations
    n::Int
    t::Int
end

function Base.iterate(c::Combinations, s=[min(c.t - 1, i) for i in 1:c.t])
    if c.t == 0 # special case to generate 1 result for t==0
        isempty(s) && return (s, [1])
        return
    end
    for i in c.t:-1:1
        s[i] += 1
        if s[i] > (c.n - (c.t - i))
            continue
        end
        for j in i+1:c.t
            s[j] = s[j-1] + 1
        end
        break
    end
    s[1] > c.n - c.t + 1 && return
    (s, s)
end

Base.length(c::Combinations) = binomial(c.n, c.t)

Base.eltype(::Type{Combinations}) = Vector{Int}

"""
    combinations(a, n)

Generate all combinations of `n` elements from an indexable object `a`. Because the number
of combinations can be very large, this function returns an iterator object.
Use `collect(combinations(a, n))` to get an array of all combinations.
"""
function combinations(a, t::Integer)
    if t < 0
        # generate 0 combinations for negative argument
        t = length(a) + 1
    end
    reorder(c) = [a[ci] for ci in c]
    (reorder(c) for c in Combinations(length(a), t))
end


"""
    combinations(a)

Generate combinations of the elements of `a` of all orders. Chaining of order iterators
is eager, but the sequence at each order is lazy.
"""
combinations(a) = Iterators.flatten([combinations(a, k) for k = 1:length(a)])


struct WithReplacementCombinations{T}
    a::T
    t::Int
end

Base.eltype(::Type{WithReplacementCombinations{T}}) where {T} = Vector{eltype(T)}

Base.length(c::WithReplacementCombinations) = binomial(length(c.a) + c.t - 1, c.t)

"""
    with_replacement_combinations(a, t)

Generate all combinations with replacement of size `t` from an array `a`.
"""
with_replacement_combinations(a, t::Integer) = WithReplacementCombinations(a, t)

function Base.iterate(c::WithReplacementCombinations, s=[1 for i in 1:c.t])
    (!isempty(s) && s[1] > length(c.a) || c.t < 0) && return

    n = length(c.a)
    t = c.t
    comb = [c.a[si] for si in s]
    if t > 0
        s = copy(s)
        changed = false
        for i in t:-1:1
            if s[i] < n
                s[i] += 1
                for j in (i+1):t
                    s[j] = s[i]
                end
                changed = true
                break
            end
        end
        !changed && (s[1] = n + 1)
    else
        s = [n + 1]
    end
    (comb, s)
end

##############################################################################


function problem090(N::Integer=9, D::Integer=2)
    squares = [replace(digits(n^2; pad=D), 9 => 6) for n in 1:N]

    function isvalid(dice)
        all(any(all(d in die for (d, die) in zip(n, dice)) for n in permutations(sq)) for sq in squares)
    end

    dice = collect(combinations([collect(0:8); [6]], 6))

    return count(isvalid(dicecomb) for dicecomb in with_replacement_combinations(dice, D))
end


(N, D) = Tuple(parse(Int, n) for n in split(readline(), " "))
println(problem090(N, D))
