const MOD = 10^12
mod(n) = Base.mod(n, MOD)
powermod(n, e) = Base.powermod(n, e, MOD)


function problem097()
    T = parse(Int, readline())

    ans = Int128(0)
    for _ in 1:T
        (A, B, C, D) = Tuple(parse(Int128, n) for n in split(readline(), " "))
        ans += mod(A * powermod(B, C) + D)
    end

    return join(reverse(digits(mod(ans); pad=12)))
end


println(problem097())
