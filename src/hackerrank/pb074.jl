const DIGIT_FACTORIAL = (1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 1)
function digit_factorial(n::T) where {T<:Integer}
    isless(n, 0) && throw(DomainError(n, "n must be a nonnegative integer"))
    iszero(n) && return one(T)

    s = zero(T)
    while n > 0
        s += T(DIGIT_FACTORIAL[mod1(n, 10)])
        n = div(n, T(10))
    end
    return s
end


function problem074(N, L)
    cache = zeros(Int, 1 + max(N, 7factorial(9)))
    chain = Int[]

    for n in 0:N
        iszero(cache[1+n]) || continue

        empty!(chain)
        m = n
        while !(m in chain) && cache[1+m] == 0
            push!(chain, m)
            m = digit_factorial(m)
        end
        reverse!(chain)
        if m in chain
            i = findfirst(isequal(m), chain)
            for _ in 1:i
                cache[1+popfirst!(chain)] = i
            end
        end

        offset = cache[1+m]
        for (i, m) in enumerate(chain)
            cache[1+m] = i + offset
        end
    end

    resize!(cache, 1 + N)
    ans = join(filter(n -> cache[1+n] == L, 0:N), " ")
    return isempty(ans) ? "-1" : ans
end


T = parse(Int, readline())
for _ in 1:T
    (N, L) = Tuple(parse(Int, n) for n in split(readline(), " "))
    println(problem074(N, L))
end
