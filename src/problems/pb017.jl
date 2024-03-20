module Problem017

const ONES = ("One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen")
const TENS = ("", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety")


"""
    problem017()

Problem 017 of Project Euler.

https://projecteuler.net/problem=017
"""
function problem017()
    return sum(length(word(n)) for n in 1:1000)
end


function word(n::Integer)
    if n in 100:999
        n % 100 == 0 && return ONES[n÷100] * "Hundred"
        (n ÷ 10) % 10 in (0, 1) && return ONES[n÷100] * "Hundred" * "And" * ONES[n%100]
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


export problem017
end  # module Problem017
using .Problem017
export problem017
