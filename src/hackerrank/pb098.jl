function undigits(d::Vector{T}; base=10) where {T<:Integer}
    return foldr((a, b) -> muladd(base, b, a), d, init=0)
end


function problem098(N::Integer)
    anagrams = Dict{Int,Vector{Int}}()

    for n = isqrt(10^(N - 1) - 1)+1:isqrt(10^N - 1)
        key = undigits(sort(digits(n^2); rev=true))
        if key in keys(anagrams)
            push!(anagrams[key], n^2)
        else
            anagrams[key] = [n^2]
        end
    end

    m = maximum(length(v) for v in values(anagrams))
    ans = 0
    for v in values(anagrams)
        if length(v) == m
            ans = max(ans, maximum(v))
        end
    end

    return ans
end


N = parse(Int, readline())
println(problem098(N))
