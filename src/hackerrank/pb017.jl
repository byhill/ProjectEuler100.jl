const ONES = ("One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen")
const TENS = ("", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety")


function problem017(n::Integer)
    n == 0 && return "Zero"
    n == 10^12 && return "One Trillion"

    w = ""

    r = n % 1000
    r > 0 && (w = hundreds(r))
    n = div(n, 1000)

    r = n % 1000
    r > 0 && (w = hundreds(r) * " Thousand" * (isempty(w) ? "" : " " * w))
    n = div(n, 1000)

    r = n % 1000
    r > 0 && (w = hundreds(r) * " Million" * (isempty(w) ? "" : " " * w))
    n = div(n, 1000)

    r = n % 1000
    r > 0 && (w = hundreds(r) * " Billion" * (isempty(w) ? "" : " " * w))
    n = div(n, 1000)

    return w
end


function hundreds(n::Integer)
    if n in 100:999
        if n % 100 == 0
            return ONES[div(n, 100)] * " Hundred"
        end
        if (div(n, 10)) % 10 in 0:1
            return ONES[div(n, 100)] * " Hundred" * (n % 20 == 0 ? "" : (" " * ONES[n%100]))
        end
        return ONES[div(n, 100)] * " Hundred " * TENS[div(n, 10)%10] * (n % 10 == 0 ? "" : (" " * ONES[n%10]))
    end
    if n in 20:99
        return TENS[div(n, 10)] * (n % 10 == 0 ? "" : (" " * ONES[n%10]))
    end
    if n in 1:19
        return ONES[n]
    end
    throw(DomainError(n, "Requires 1 <= n <= 1000"))
end


T = parse(Int, readline())
for _ in 1:T
    N = parse(Int, readline())
    println(problem017(N))
end
