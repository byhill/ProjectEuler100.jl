function zellers_congruence(day::Integer, month::Integer, year::Integer)
    1 <= month <= 2 && (month += 12; year -= 1)
    (J, K) = divrem(year, 100)
    return mod(day + div(13(month + 1), 5) + K + div(K, 4) + div(J, 4) + 5J, 7)
end


function problem019(Y1::Integer, M1::Integer, Y2::Integer, M2::Integer)
    Y1 == Y2 && return count(isone(zellers_congruence(1, month, Y1)) for month in M1:M2)

    firstyear = count(isone(zellers_congruence(1, month, Y1)) for month in M1:12)
    incl = count(isone(zellers_congruence(1, month, year)) for month in 1:12, year in Y1+1:Y2-1)
    lastyear = count(isone(zellers_congruence(1, month, Y2)) for month in 1:M2)
    return firstyear + lastyear + incl
end


T = parse(Int, readline())
for _ in 1:T
    (Y1, M1, D1) = Tuple(parse(Int, n) for n in split(readline(), " "))
    (Y2, M2, _) = Tuple(parse(Int, n) for n in split(readline(), " "))
    D1 > 1 && (M1 += 1)
    println(problem019(Y1, M1, Y2, M2))
end
