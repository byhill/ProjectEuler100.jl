export problem017


"""
    problem017()

Problem 017 of Project Euler.

https://projecteuler.net/problem=017
"""
function problem017()

    ONES = (
        "One",
        "Two",
        "Three",
        "Four",
        "Five",
        "Six",
        "Seven",
        "Eight",
        "Nine",
        "Ten",
        "Eleven",
        "Twelve",
        "Thirteen",
        "Fourteen",
        "Fifteen",
        "Sixteen",
        "Seventeen",
        "Eighteen",
        "Nineteen",
    )

    TENS = (
        "",
        "Twenty",
        "Thirty",
        "Forty",
        "Fifty",
        "Sixty",
        "Seventy",
        "Eighty",
        "Ninety",
    )

    function word(n::Integer)
        if n in 100:999
            n % 100 == 0 && return ONES[n÷100] * "Hundred"
            (n ÷ 10) % 10 in 0:1 && return ONES[n÷100] * "Hundred" * "And" * ONES[n%100]
            n % 10 == 0 && return ONES[n÷100] * "Hundred" * "And" * TENS[(n÷10)%10]
            return ONES[n÷100] * "Hundred" * "And" * TENS[(n÷10)%10] * ONES[n%10]
        end

        if n in 20:99
            return n % 10 == 0 ? TENS[n÷10] : TENS[n÷10] * ONES[n%10]
        end

        if n in 1:19
            return ONES[n]
        end

        if n == 1000
            return "One" * "Thousand"
        end

        throw(DomainError(n, "Requires 1 ≤ n ≤ 1000"))
    end

    return sum(length(word(n)) for n in 1:1000)
end
