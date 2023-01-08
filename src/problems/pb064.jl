export problem064


"""
    problem064()

Problem 064 of Project Euler.

https://projecteuler.net/problem=064
"""
function problem064(N::Integer=10_000)

    function cf_period(n::Integer)
        remainders = Tuple{Int,Int}[]
        x = isqrt(n)
        y = 1
        while (x, y) ∉ remainders
            push!(remainders, (x, y))
            y = (n - x * x) ÷ y
            a = (isqrt(n) + x) ÷ y
            x = y * a - x
        end
        return length(remainders) - findfirst(isequal((x, y)), remainders) + 1
    end

    return count(isodd, (cf_period(n) for n = 2:N if !issquare(n)))
end
