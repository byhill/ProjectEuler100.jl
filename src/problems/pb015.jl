module Problem015


"""
    problem015()

Problem 015 of Project Euler.

https://projecteuler.net/problem=015

Any trip from the top left corner to the bottom left corner
requires 20 moves to the left and 20 moves down, for a total of 40 moves in total.
In other words, of the 40 moves, 20 of them must be moving leftwards.
There are 40 choose 20 possible ways to do this.
"""
function problem015(w::Integer=20, h::Integer=20)
    return binomial(w + h, w)
end


export problem015
end  # module Problem015
using .Problem015
export problem015
