module Problem059


function score(code, key)
    decrypt = (xor(c, key[mod1(i, 3)]) for (i, c) in enumerate(code))
    s = 0
    for c in decrypt
        c ≥ Int('a') && c ≤ Int('z') && (s += 2)
        c ≥ Int('A') && c ≤ Int('Z') && (s += 1)
        c == Int(' ') && (s += 10)
    end

    return s
end


"""
    problem059()

Problem 059 of Project Euler.

https://projecteuler.net/problem=059
"""
function problem059(filename="txt/pb059.txt")
    code = [parse(Int, n) for n in split(readline(filename), ",")]

    maxkey = (0, 0, 0)
    maxscore = 0
    iter = Int('a'):Int('z')
    for a in iter, b in iter, c in iter
        key = (a, b, c)
        s = score(code, key)
        s > maxscore && (maxscore = s; maxkey = key)
    end

    return sum(xor(c, maxkey[mod1(i, 3)]) for (i, c) in enumerate(code))
end


export problem059
end  # module Problem059
using .Problem059
export problem059
