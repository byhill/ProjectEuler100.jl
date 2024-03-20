const UPPER_CASE_CORRECTION = -64
const names = String[]
const nameindex = Dict{String,Int}()


function problem022(name::String)
    i = nameindex[name]
    namescore(name::String) = sum(Int(c) + UPPER_CASE_CORRECTION for c in name)
    return i * namescore(name)
end


N = parse(Int, readline())
for _ in 1:N
    push!(names, readline())
end
sort!(names)
for i in eachindex(names)
    nameindex[names[i]] = i
end

Q = parse(Int, readline())
for _ in 1:Q
    name = readline()
    println(problem022(name))
end
