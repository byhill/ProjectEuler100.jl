export problem015


"""
    problem015(w::Integer=20, h::Integer=20)

Problem 015 of Project Euler.

https://projecteuler.net/problem=015

Since you can only move left or down,
you make precisely 20 + 20 moves, of which 20 must be down.
Hence there are (40 choose 20) ways to move.
"""
function problem015(w::Integer=20, h::Integer=20)
    return binomial(w + h, w)
end
