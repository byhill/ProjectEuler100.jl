export problem059


"""
    problem059()

Problem 059 of Project Euler.

https://projecteuler.net/problem=059
"""
function problem059(filename="txt/pb059.txt")
    code = [parse(Int, n) for n in split(readline(filename), ",")]

    function score(key)
        decrypt = (xor(c, key[mod1(i, 3)]) for (i, c) in enumerate(code))
        s = 0
        for c in decrypt
            c >= Int('a') && c <= Int('z') && (s += 2)
            c >= Int('A') && c <= Int('Z') && (s += 1)
            c == Int(' ') && (s += 10)
        end
        return s
    end

    maxkey = (0, 0, 0)
    maxscore = 0
    for key in cartesianproduct(Int('a'):Int('z'), 3)
        s = score(key)
        s > maxscore && (maxscore = s; maxkey = key)
    end
    return sum(xor(c, maxkey[mod1(i, 3)]) for (i, c) in enumerate(code))
end
