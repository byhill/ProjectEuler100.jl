export problem054


module Poker

export PokerHand, winner

const royalvals = Dict('T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14)

struct PokerHand
    ranks::Vector{Int64}
    flush::Bool

    function PokerHand(hand::Vector{T}) where {T<:AbstractString}
        ranks = zeros(Int, 5)
        for (i, v) in enumerate(s[1] for s in hand)
            ranks[i] = v in keys(royalvals) ? royalvals[v] : parse(Int, v)
        end
        sort!(ranks)
        flush = all(suite -> suite == hand[1][2], s[2] for s in hand)
        new(ranks, flush)
    end
end

function straightflush(hand::PokerHand)
    return hand.flush && straight(hand) != 0 ? hand.ranks[end] : 0
end

function four_of_a_kind(hand::PokerHand)
    return count(r -> r == hand.ranks[3], hand.ranks) == 4 ? hand.ranks[3] : 0
end

function full_house(hand::PokerHand)
    return three_of_a_kind(hand) != 0 && pair(hand) != 0 ? hand.ranks[3] : 0
end

function flush(hand::PokerHand)
    return hand.flush ? reverse(hand.ranks) : [0, 0, 0, 0, 0]
end

function straight(hand::PokerHand)
    return all(hand.ranks[i] == hand.ranks[1] + i - 1 for i = 1:5) ? hand.ranks[end] : 0
end

function three_of_a_kind(hand::PokerHand)
    return count(r -> r == hand.ranks[3], hand.ranks) == 3 ? hand.ranks[2] : 0
end

function two_pairs(hand::PokerHand)
    if hand.ranks[1] == hand.ranks[2]
        if hand.ranks[3] == hand.ranks[4]
            return (hand.ranks[4], hand.ranks[2], hand.ranks[5])
        elseif hand.ranks[4] == hand.ranks[5]
            return (hand.ranks[4], hand.ranks[2], hand.ranks[3])
        else
            return (0, 0, 0)
        end
    elseif hand.ranks[2] == hand.ranks[3] && hand.ranks[4] == hand.ranks[5]
        return (hand.ranks[5], hand.ranks[3], hand.ranks[1])
    else
        return (0, 0, 0)
    end
end

function pair(hand::PokerHand)
    for i = 2:4
        count(==(hand.ranks[i]), hand.ranks) == 2 && return hand.ranks[i]
    end
    return 0
end

function highcard(hand::PokerHand)
    return reverse(hand.ranks)
end

const poker_hand_eval = (
    straightflush,
    four_of_a_kind,
    full_house,
    flush,
    straight,
    three_of_a_kind,
    two_pairs,
    pair,
    highcard
)

function winner(hand1::PokerHand, hand2::PokerHand)
    for f in poker_hand_eval
        f1, f2 = f(hand1), f(hand2)
        f1 == f2 && continue
        return f1 > f2
    end
    return false
end

end  # module Poker

using .Poker


"""
    problem054()

Problem 054 of Project Euler.

https://projecteuler.net/problem=054
"""
function problem054(filename::AbstractString="txt/pb054.txt")
    splits = (split(s, " ") for s in readlines(filename))
    hands1 = [PokerHand(s[1:5]) for s in splits]
    hands2 = [PokerHand(s[6:10]) for s in splits]
    return count(winner(h1, h2) for (h1, h2) in zip(hands1, hands2))
end
