@inline issquare(n::Integer) = isqrt(n)^2 == n


function sumsqrt(n, D)
    m = n * BigInt(10)^(2D)
    return sum(reverse(digits(isqrt(m)))[1:D])
end


function problem080(D::Int=100, N::Int=100)
    return sum(sumsqrt(n, D) for n in 1:N if !issquare(n))
end


N = parse(Int, readline())
P = parse(Int, readline())
println(problem080(P, N))
