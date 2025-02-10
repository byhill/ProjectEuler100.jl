module Problem059


function score(code, key)
    ans = 0
    i = 0
    for c in code
        i = i == 3 ? 1 : i + 1
        c = xor(c, key[i])
        Int('a') ≤ c ≤ Int('z') && (ans += 2)
        Int('A') ≤ c ≤ Int('Z') && (ans += 1)
        c == Int(' ') && (ans += 10)
    end

    return ans
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
