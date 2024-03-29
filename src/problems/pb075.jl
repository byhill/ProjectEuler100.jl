module Problem075


"""
    problem075()

Problem 075 of Project Euler.

https://projecteuler.net/problem=075

Use Pythagorean triples and save intermediate results.
"""
function problem075(N::Integer=15 * 10^5)
    perimeters = zeros(Int, N)
    for m in 2:isqrt(N)
        for n in m-1:-2:1
            isone(gcd(m, n)) || continue
            a = m^2 - n^2
            b = 2m * n
            c = m^2 + n^2
            for k in 1:N÷(a+b+c)
                perimeters[k*(a+b+c)] += 1
            end
        end
    end

    return count(isequal(1), perimeters)
end


export problem075
end  # module Problem075
using .Problem075
export problem075
