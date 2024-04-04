mutable struct CubicPermutation
    mincube::Integer
    found::Integer
end


undigits(digits::Vector{T}; base::Integer=10) where {T<:Integer} = undigits(T, digits; base=base)
function undigits(T::Type{<:Integer}, digits::Vector{U}; base::Integer=10) where {U<:Integer}
    return foldr((a, b,) -> muladd(base, b, a), digits, init=zero(T))
end


function problem062(N::Integer, K::Integer)
    cubic_permutations = Dict{Int,CubicPermutation}()
    for n in 1:N
        m = n * n * n
        key = undigits(sort(digits(m)))
        cp = get!(cubic_permutations, key, CubicPermutation(m, 0))
        cp.found += 1
    end

    cubes = Int[]
    for cp in values(cubic_permutations)
        cp.found == K && push!(cubes, cp.mincube)
    end

    sort!(cubes)
    for cube in cubes
        println(cube)
    end
end


(N, K) = Tuple(parse(Int, n) for n in split(readline(), " "))
problem062(N, K)
