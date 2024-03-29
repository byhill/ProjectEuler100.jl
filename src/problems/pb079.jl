module Problem079


"""
    problem079()

Problem 079 of Project Euler.

https://projecteuler.net/problem=079

Topological Sort
"""
function problem079(filename="txt/pb079.txt")
    passcodes = readlines(filename)
    characters = Dict{Char,Set{Char}}()

    for p in passcodes
        for c in p
            !(c in keys(characters)) && (characters[c] = Set{Char}())
        end
        push!(characters[p[2]], p[1])
        push!(characters[p[3]], p[2])
    end

    passcode = ""
    for _ in 1:length(characters)
        c = sort(collect(keys(characters)); by=k -> (length(characters[k]), k))[1]
        length(characters[c]) > 0 && throw(error("No password exists"))
        passcode *= c
        delete!(characters, c)
        for k in keys(characters)
            delete!(characters[k], c)
        end
    end

    return parse(Int, passcode)
end


export problem079
end  # module Problem079
using .Problem079
export problem079
