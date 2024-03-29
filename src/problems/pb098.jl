module Problem098

using ..ProjectEuler100


"""
    problem098()

Problem 098 of Project Euler.

https://projecteuler.net/problem=098
"""
function problem098(filename="txt/pb098.txt")
    anagrams = Dict{String,Vector{String}}()

    for word in sort(split(replace(readline(filename), "\"" => ""), ","); by=length)
        key = join(sort(collect(word)))
        if key in keys(anagrams)
            push!(anagrams[key], word)
        else
            anagrams[key] = [word]
        end
    end

    ans = 0
    for words in values(anagrams)
        length(words) == 1 && continue
        for (i, w1) in enumerate(words), w2 in words[i+1:end]
            ans = max(ans, square_anagram(w1, w2))
        end
    end

    return ans
end


function square_anagram(w1::AbstractString, w2::AbstractString)
    l = length(w1)
    ans = -1

    for n = isqrt(10^(l - 1) - 1)+1:isqrt(10^l - 1)
        x = string(n^2)
        for (d, c) in zip(string(n^2), w1)
            x = replace(x, d => c)
        end
        x != w1 && continue

        y = w2
        for (d, c) in zip(string(n^2), w1)
            y = replace(y, c => d)
        end
        y[1] == '0' && continue

        m = parse(Int, y)
        issquare(m) && (ans = max(ans, m, n^2))
    end

    return ans
end



export problem098
end  # module Problem098
using .Problem098
export problem098
