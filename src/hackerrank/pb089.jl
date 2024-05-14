const romanvalues = (
    ("M", 1000),
    ("CM", 900),
    ("D", 500),
    ("CD", 400),
    ("C", 100),
    ("XC", 90),
    ("L", 50),
    ("XL", 40),
    ("X", 10),
    ("IX", 9),
    ("V", 5),
    ("IV", 4),
    ("I", 1),
)


function problem089(rm)
    return decimal_to_roman(roman_to_decimal(rm))
end


function roman_to_decimal(r)
    r = replace(r, "IV" => "IIII")
    r = replace(r, "IX" => "VIIII")
    r = replace(r, "XL" => "XXXX")
    r = replace(r, "XC" => "LXXXX")
    r = replace(r, "CD" => "CCCC")
    r = replace(r, "CM" => "DCCCC")

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
        rm *= repeat(r, div(n, x))
        n -= x * div(n, x)
    end

    return rm
end


T = parse(Int, readline())
for _ in 1:T
    rm = readline()
    println(problem089(rm))
end
