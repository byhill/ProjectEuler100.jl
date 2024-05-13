module Problem085


"""
    problem085()

Problem 085 of Project Euler.

https://projecteuler.net/problem=085

The number or rectangles in an a×b grid is a⋅(a + 1)⋅b⋅(b + 1)/4
"""
function problem085(N::Integer=2000000)
    area = 0
    diff = N
    for a in 1:ceil(Int, (-1 + sqrt(1 + 8N)) / 2)
        bfloat = (-1 + sqrt(1 + 16N / (a * (a + 1)))) / 2
        for b in (floor(Int, bfloat), ceil(Int, bfloat))
            r = a * (a + 1) * b * (b + 1) ÷ 4
            if abs(r - N) < diff
                diff, area = abs(r - N), a * b
            end
        end
    end

    return area
end


export problem085
end  # module Problem085
using .Problem085
export problem085
