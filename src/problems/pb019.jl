export problem019


"""
    problem019()

Problem 019 of Project Euler.

https://projecteuler.net/problem=019

Use Zeller's congruence.
"""
function problem019()
    function zellers_congruence(day::Integer, month::Integer, year::Integer)
        (month == 1 || month == 2) && (month += 12; year -= 1)
        (J, K) = divrem(year, 100)
        return mod(day + 13(month + 1) ÷ 5 + K + K ÷ 4 + J ÷ 4 + 5J, 7)
    end

    return count(zellers_congruence(1, month, year) == 1 for year = 1901:2000, month = 1:12)
end
