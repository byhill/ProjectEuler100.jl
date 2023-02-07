export problem049


"""
    problem049()

Problem 049 of Project Euler.

https://projecteuler.net/problem=049

Group primes by digits in hash.
Then for each group, check if three of them form an arithmetic sequence.
"""
function problem049()
    primePermutations = Dict{Any,Vector{Int}}()
    for p in primes(10^4)
        k = sort(digits(p))
        haskey(primePermutations, k) ? push!(primePermutations[k], p) : primePermutations[k] = Int[p]
    end

    arr = Int64[]
    for v in values(primePermutations)
        length(v) < 3 && continue
        sort!(v)
        for (i, p) in enumerate(v), q in v[i+1:end]
            r = 2q - p
            r in v && push!(arr, concat(p, q, r))
        end
    end

    filter!(!isequal(148748178147), arr)
    length(arr) != 1 && error()
    return arr[1]
end
