export problem089


module Problem089
export problem089


const romanvalues = (
    ("M", 1000), ("CM", 900), ("D", 500), ("CD", 400), ("C", 100), ("XC", 90),
    ("L", 50), ("XL", 40), ("X", 10), ("IX", 9), ("V", 5), ("IV", 4), ("I", 1),
)


"""
    problem089()

Problem 089 of Project Euler.

https://projecteuler.net/problem=089
"""
function problem089(filename="txt/pb089.txt")
    sum(length(rm) - length(decimal_to_roman(roman_to_decimal(rm))) for rm in readlines(filename))
end


function roman_to_decimal(r)
    r = replace(r,
        "IV" => "IIII",
        "IX" => "VIIII",
        "XL" => "XXXX",
        "XC" => "LXXXX",
        "CD" => "CCCC",
        "CM" => "DCCCC"
    )
    n = 1000count(isequal('M'), r)
    n += 500count(isequal('D'), r)
    n += 100count(isequal('C'), r)
    n += 50count(isequal('L'), r)
    n += 10count(isequal('X'), r)
    n += 5count(isequal('V'), r)
    n += count(isequal('I'), r)

    return n
end


function decimal_to_roman(n)
    rm = ""
    for (r, x) in romanvalues
        while n >= x
            rm *= r
            n -= x
        end
    end

    return rm
end

end
using .Problem089
