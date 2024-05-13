module Problem084

using LinearAlgebra

const MONOPOLY_SQUARES = (
    "GO", "A1", "CC1", "A2", "T1", "R1", "B1", "CH1", "B2", "B3",
    "JAIL", "C1", "U1", "C2", "C3", "R2", "D1", "CC2", "D2", "D3",
    "FP", "E1", "CH2", "E2", "E3", "R3", "F1", "F2", "U2", "F3",
    "G2J", "G1", "G2", "CC3", "G3", "R4", "CH3", "H1", "T2", "H2",
)

f(s) = findfirst(isequal(s), MONOPOLY_SQUARES)

const GO = f("GO")
const JAIL = f("JAIL")
const G2J = f("G2J")
const C1 = f("C1")
const E3 = f("E3")
const H2 = f("H2")
const R1 = f("R1")
const R2 = f("R2")
const R3 = f("R3")
const R4 = f("R4")
const U1 = f("U1")
const U2 = f("U2")

# Chance
const CH1 = f("CH1")
const CH2 = f("CH2")
const CH3 = f("CH3")
const CHANCE = (CH1, CH2, CH3)

# Community Chest
const CC1 = f("CC1")
const CC2 = f("CC2")
const CC3 = f("CC3")
const COMMUNITYCHEST = (CC1, CC2, CC3)


"""
    problem084()

Problem 084 of Project Euler.

https://projecteuler.net/problem=084

Use Markov Chains and it's stationary distribution.
Since the three-doubles rule doesn't change the answer
in the original PE problem,
and since the hackerrank version doesn't use this,
I don't bother accounting for this since it would
increase the complexity of the code.
(Though it would still be possible account for this
using Markov chains, despite some claims online saying otherwise.)
"""
function problem084(D::Integer=4, K::Integer=3)
    diceProbabilities = zeros(2D)
    for r1 in 1:D, r2 in 1:D
        diceProbabilities[r1+r2] += 1 / D^2
    end

    M = zeros(40, 40)

    # Fill markov-chain with dice roll probabilites.
    for i in 1:40
        for r in 2:2D
            M[i, mod1(i + r, 40)] += diceProbabilities[r]
        end
    end

    # Chance
    for ch in CHANCE
        for i in 1:40
            chP = M[i, ch]
            rail = ch == CH1 ? R2 : (ch == CH2 ? R3 : R1)
            utility = ch == CH2 ? U2 : U1
            for j in (GO, JAIL, C1, E3, H2, R1, rail, rail, utility, ch - 3)
                M[i, j] += chP / 16
            end
            M[i, ch] -= 10chP / 16
        end
    end

    # Community Chest
    # Must be filled after Chance since you can land on CH3 and be moved to CC3.
    for i in 1:40
        for cc in COMMUNITYCHEST
            ccP = M[i, cc]
            for j in [GO, JAIL]
                M[i, j] += ccP / 16
            end
            M[i, cc] -= 2ccP / 16
        end
    end

    # Go-to-jail
    # Must be filled after Chance and Community Chest.
    for i in 1:40
        M[i, JAIL] += M[i, G2J]
        M[i, G2J] = 0.0
    end

    # Find the stationary distribution of M
    p = nullspace(M' - I)
    p ./= sum(p)
    indices = sort(1:40; by=i -> p[i], rev=true)

    return parse(Int, join((string(indices[i] - 1) for i in 1:K)))
end


export problem084
end  # module Problem084
using .Problem084
export problem084
