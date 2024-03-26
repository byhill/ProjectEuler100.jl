function score(code, key)
    decrypt = (xor(c, key[mod1(i, 3)]) for (i, c) in enumerate(code))
    s = 0
    for c in decrypt
        c >= Int('a') && c <= Int('z') && (s += 2)
        c >= Int('A') && c <= Int('Z') && (s += 1)
        c == Int(' ') && (s += 10)
    end

    return s
end


function problem059(code)
    maxkey = (0, 0, 0)
    maxscore = 0
    iter = Int('a'):Int('z')
    for a in iter, b in iter, c in iter
        key = (a, b, c)
        s = score(code, key)
        s > maxscore && (maxscore = s; maxkey = key)
    end

    return join(Char(n) for n in maxkey)
end


_ = parse(Int, readline())
code = [parse(Int, n) for n in split(readline(), " ")]
println(problem059(code))
