function problem079()
    readline()
    passcodes = map(line -> [Int(d) for d in line], readlines())
    G = falses(126, 126)
    characters = falses(126)

    for p in passcodes
        for c in p
            characters[c] = true
        end
        G[p[1], p[2]] = true
        G[p[2], p[3]] = true
    end

    L = Int[]
    S = Int[]
    for i in 33:126
        any(G[:, i]) || push!(S, i)
    end

    while !isempty(S)
        sort!(S; rev=true)
        n = pop!(S)
        push!(L, n)
        for i in 33:126
            G[n, i] || continue
            G[n, i] = false
            any(G[:, i]) || push!(S, i)
        end
    end

    any(G) && return "SMTH WRONG"
    intersect!(L, filter(i -> characters[i], 33:126))
    return join(map(Char, L))
end


println(problem079())
