module Problem019


"""
    problem019()

Problem 019 of Project Euler.

https://projecteuler.net/problem=019

See https://en.wikipedia.org/wiki/Zeller%27s_congruence
"""
function problem019()
    return count(isone(zellers_congruence(1, month, year)) for year in 1901:2000, month in 1:12)
end


function zellers_congruence(day::Integer, month::Integer, year::Integer)
    1 ≤ month ≤ 2 && (month += 12; year -= 1)
    (J, K) = divrem(year, 100)
    return mod(day + (13(month + 1) ÷ 5) + K + (K ÷ 4) + (J ÷ 4) + 5J, 7)
end


export problem019
end  # module Problem019
using .Problem019
export problem019
