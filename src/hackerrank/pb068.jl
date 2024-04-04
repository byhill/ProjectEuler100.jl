const solns = String[]


function problem068(N::Int, S::Int)
    empty!(solns)
    ring = zeros(Int, 2N)

    for i in 1:2N
        ring[1] = i
        fillring(ring, 2, 1 << i, N, S)
    end

    sort!(solns)
    for n in solns
        println(n)
    end
end


function fillring(ring, pos, used, N, S)
    if pos > N
        o = S - ring[1] - ring[N]
        ((used & (1 << o) != 0) || o < 1 || o > 2N) && return  # n has already been used in the ring
        ring[2N] = o
        ring[N+1] != minimum(ring[N+1:2N]) && return  # ring[N + 1] must be smallest number in outer ring

        ringstring = ""
        for i in 1:N
            ringstring *= string(ring[N+i]) * string(ring[i]) * string(ring[mod1(i + 1, N)])
        end
        push!(solns, ringstring)
        return
    end

    for i in 1:2N
        (used & (1 << i) != 0) && continue
        ring[pos] = i
        o = S - ring[pos] - ring[pos-1]
        ring[N+pos-1] = o
        ((used & (1 << o) != 0) || o == i || o < 1 || o > 2N) && continue
        fillring(ring, pos + 1, used | (1 << i) | (1 << o), N, S)
    end
end


(N, S) = Tuple(parse(Int, n) for n in split(readline(), " "))
problem068(N, S)
