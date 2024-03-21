const DIGIT_FACTORIAL = (1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 1)

function digit_factorial(n::T) where {T<:Integer}
    s = zero(T)
    while n > 0
        s += T(DIGIT_FACTORIAL[mod1(n, 10)])
        n = div(n, T(10))
    end

    return s
end


function problem034(N)
    N < 19 && return 0
    return sum(n for n = 10:N if iszero(mod(digit_factorial(n), n)))
end


N = parse(Int, readline())
println(problem034(N))
