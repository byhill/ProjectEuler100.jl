# ProjectEuler100.jl

[![Build status](https://ci.appveyor.com/api/projects/status/hgkaobx9v1yfwrme?svg=true)](https://ci.appveyor.com/project/byhill/projecteuler100-jl?)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)

![](https://projecteuler.net/profile/byhill.png)

This repository contains my solutions to the first 100 problems of [Project Euler](https://projecteuler.net/),
written in [Julia](https://julialang.org/).
Hopefully, by making this repository public,
it will help someone learn how to tackle Project Euler problems while using Julia.
With the exception of problem 100, the solutions in this repository also work well
(after a little modification) for [Hackerrank's](https://www.hackerrank.com/contests/projecteuler/challenges)
ongoing Project Euler+ contest.
Note that the solutions are tested on 64-bit machines,
and will likely not run correctly on 32-bit machines.

Due to Project Euler's [policy](https://projecteuler.net/about#publish) on publishing solutions,
I will **not** share my solutions to problems past the first 100.

If you would like to see my current progress on Project Euler,
such as what problems I've completed, what awards I've obtained,
or my forum posts, feel free to add me as a friend on Project Euler.
My friend key is [1327298_jzCskJIfItQqZaPDyT4kQpsHmSlrcHky](https://projecteuler.net/friends).
You can also view my progress on HackerRanks' Project Euler+ contest
[here](https://www.hackerrank.com/byhill).

## Problems

The following is the list of problems.
Timings are made using [BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl),
on a 10.15.7 macos, 2.2 GHz Quad-Core Intel Core i7 processor, with 16 GB 1600 MHz DDR3 memory.

| Problem | Title                                                                            | Difficulty | Running Time (s)                |
| ---     | ---                                                                              | ---        | ---                             |
| 001     | [Multiples of 3 or 5](https://projecteuler.net/problem=001)                      | 5%         | [0.000](src/problems/pb001.jl)  |
| 002     | [Even Fibonacci numbers](https://projecteuler.net/problem=002)                   | 5%         | [0.000](src/problems/pb002.jl)  |
| 003     | [Largest prime factor](https://projecteuler.net/problem=003)                     | 5%         | [0.000](src/problems/pb003.jl)  |
| 004     | [Largest palindrome product](https://projecteuler.net/problem=004)               | 5%         | [0.000](src/problems/pb004.jl)  |
| 005     | [Smallest multiple](https://projecteuler.net/problem=005)                        | 5%         | [0.000](src/problems/pb005.jl)  |
| 006     | [Sum square difference](https://projecteuler.net/problem=006)                    | 5%         | [0.000](src/problems/pb006.jl)  |
| 007     | [10001st prime](https://projecteuler.net/problem=007)                            | 5%         | [0.000](src/problems/pb007.jl)  |
| 008     | [Largest product in a series](https://projecteuler.net/problem=008)              | 5%         | [0.000](src/problems/pb008.jl)  |
| 009     | [Special Pythagorean triplet](https://projecteuler.net/problem=009)              | 5%         | [0.000](src/problems/pb009.jl)  |
| 010     | [Summation of primes](https://projecteuler.net/problem=010)                      | 5%         | [0.001](src/problems/pb010.jl)  |
| 011     | [Largest product in a grid](https://projecteuler.net/problem=011)                | 5%         | [0.000](src/problems/pb011.jl)  |
| 012     | [Highly divisible triangular number](https://projecteuler.net/problem=012)       | 5%         | [0.000](src/problems/pb012.jl)  |
| 013     | [Large sum](https://projecteuler.net/problem=013)                                | 5%         | [0.000](src/problems/pb013.jl)  |
| 014     | [Longest Collatz sequence](https://projecteuler.net/problem=014)                 | 5%         | [0.156](src/problems/pb014.jl)  |
| 015     | [Lattice paths](https://projecteuler.net/problem=015)                            | 5%         | [0.000](src/problems/pb015.jl)  |
| 016     | [Power digit sum](https://projecteuler.net/problem=016)                          | 5%         | [0.000](src/problems/pb016.jl)  |
| 017     | [Number letter counts](https://projecteuler.net/problem=017)                     | 5%         | [0.000](src/problems/pb017.jl)  |
| 018     | [Maximum path sum I](https://projecteuler.net/problem=018)                       | 5%         | [0.000](src/problems/pb018.jl)  |
| 019     | [Counting Sundays](https://projecteuler.net/problem=019)                         | 5%         | [0.000](src/problems/pb019.jl)  |
| 020     | [Factorial digit sum](https://projecteuler.net/problem=020)                      | 5%         | [0.000](src/problems/pb020.jl)  |
| 021     | [Amicable numbers](https://projecteuler.net/problem=021)                         | 5%         | [0.000](src/problems/pb021.jl)  |
| 022     | [Names scores](https://projecteuler.net/problem=022)                             | 5%         | [0.002](src/problems/pb022.jl)  |
| 023     | [Non-abundant sums](https://projecteuler.net/problem=023)                        | 5%         | [0.004](src/problems/pb023.jl)  |
| 024     | [Lexicographic permutations](https://projecteuler.net/problem=024)               | 5%         | [0.000](src/problems/pb024.jl)  |
| 025     | [1000-digit Fibonacci number](https://projecteuler.net/problem=025)              | 5%         | [0.000](src/problems/pb025.jl)  |
| 026     | [Reciprocal cycles](https://projecteuler.net/problem=026)                        | 5%         | [0.000](src/problems/pb026.jl)  |
| 027     | [Quadratic primes](https://projecteuler.net/problem=027)                         | 5%         | [0.002](src/problems/pb027.jl)  |
| 028     | [Number spiral diagonals](https://projecteuler.net/problem=028)                  | 5%         | [0.000](src/problems/pb028.jl)  |
| 029     | [Distinct powers](https://projecteuler.net/problem=029)                          | 5%         | [0.000](src/problems/pb029.jl)  |
| 030     | [Digit fifth powers](https://projecteuler.net/problem=030)                       | 5%         | [0.001](src/problems/pb030.jl)  |
| 031     | [Coin sums](https://projecteuler.net/problem=031)                                | 5%         | [0.000](src/problems/pb031/jl)  |
| 032     | [Pandigital products](https://projecteuler.net/problem=032)                      | 5%         | [0.045](src/problems/pb032.jl)  |
| 033     | [Digit cancelling fractions](https://projecteuler.net/problem=033)               | 5%         | [0.000](src/problems/pb033.jl)  |
| 034     | [Digit factorials](https://projecteuler.net/problem=034)                         | 5%         | [0.034](src/problems/pb034.jl)  |
| 035     | [Circular primes](https://projecteuler.net/problem=035)                          | 5%         | [0.008](src/problems/pb035.jl)  |
| 036     | [Double-base palindromes](https://projecteuler.net/problem=036)                  | 5%         | [0.026](src/problems/pb036.jl)  |
| 037     | [Truncatable primes](https://projecteuler.net/problem=037)                       | 5%         | [0.000](src/problems/pb037.jl)  |
| 038     | [Pandigital multiples](https://projecteuler.net/problem=038)                     | 5%         | [0.002](src/problems/pb038.jl)  |
| 039     | [Integer right triangles](https://projecteuler.net/problem=039)                  | 5%         | [0.000](src/problems/pb039.jl)  |
| 040     | [Champernowne's constant](https://projecteuler.net/problem=040)                  | 5%         | [0.000](src/problems/pb040.jl)  |
| 041     | [Pandigital prime](https://projecteuler.net/problem=041)                         | 5%         | [0.052](src/problems/pb041.jl)  |
| 042     | [Coded triangle numbers](https://projecteuler.net/problem=042)                   | 5%         | [0.000](src/problems/pb042.jl)  |
| 043     | [Sub-string divisibility](https://projecteuler.net/problem=043)                  | 5%         | [0.795](src/problems/pb043.jl)  |
| 044     | [Pentagon numbers](https://projecteuler.net/problem=044)                         | 5%         | [0.016](src/problems/pb044.jl)  |
| 045     | [Triangular, pentagonal, and hexagonal](https://projecteuler.net/problem=045)    | 5%         | [0.000](src/problems/pb045.jl)  |
| 046     | [Goldbach's other conjecture](https://projecteuler.net/problem=046)              | 5%         | [0.000](src/problems/pb046.jl)  |
| 047     | [Distinct primes factors](https://projecteuler.net/problem=047)                  | 5%         | [0.011](src/problems/pb047.jl)  |
| 048     | [Self powers](https://projecteuler.net/problem=048)                              | 5%         | [0.001](src/problems/pb048.jl)  |
| 049     | [Prime permutations](https://projecteuler.net/problem=049)                       | 5%         | [0.001](src/problems/pb049.jl)  |
| 050     | [Consecutive prime sum](https://projecteuler.net/problem=050)                    | 5%         | [0.000](src/problems/pb050.jl)  |
| 051     | [Prime digit replacements](https://projecteuler.net/problem=051)                 | 15%        | [0.025](src/problems/pb051.jl)  |
| 052     | [Permuted multiples](https://projecteuler.net/problem=052)                       | 5%         | [0.061](src/problems/pb052.jl)  |
| 053     | [Combinatoric selections](https://projecteuler.net/problem=053)                  | 5%         | [0.000](src.problems/pb053.jl)  |
| 054     | [Poker hands](https://projecteuler.net/problem=054)                              | 10%        | [0.005](src/problems/pb054.jl)  |
| 055     | [Lychrel numbers](https://projecteuler.net/problem=055)                          | 5%         | [0.054](src/problems/pb055.jl)  |
| 056     | [Powerful digit sum](https://projecteuler.net/problem=056)                       | 5%         | [0.013](src/problems/pb056.jl)  |
| 057     | [Square root convergents](https://projecteuler.net/problem=057)                  | 5%         | [0.001](src/problems/pb057.jl)  |
| 058     | [Spiral primes](https://projecteuler.net/problem=058)                            | 5%         | [0.016](src/problems/pb058.jl)  |
| 059     | [XOR decryption](https://projecteuler.net/problem=059)                           | 5%         | [0.066](src/problems/pb059.jl)  |
| 060     | [Prime pair sets](https://projecteuler.net/problem=060)                          | 20%        | [2.806](src/problems/pb060.jl)  |
| 061     | [Cyclical figurate numbers](https://projecteuler.net/problem=061)                | 20%        | [0.065](src/problems/pb061.jl)  |
| 062     | [Cubic permutations](https://projecteuler.net/problem=062)                       | 15%        | [0.005](src/problems/pb062.jl)  |
| 063     | [Powerful digit counts](https://projecteuler.net/problem=63)                     | 5%         | [0.000](src/problems/pb063.jl)  |
| 064     | [Odd period square roots](https://projecteuler.net/problem=064)                  | 20%        | [0.018](src/problems/pb064.jl)  |
| 065     | [Convergents of e](https://projecteuler.net/problem=065)                         | 15%        | [0.000](src/problems/pb065.jl)  |
| 066     | [Diophantine equation](https://projecteuler.net/problem=066)                     | 25%        | [0.013](src/problems/pb066.jl)  |
| 067     | [Maximum path sum II](https://projecteuler.net/problem=067)                      | 5%         | [0.001](src/problems/pb067.jl)  |
| 068     | [Magic 5-gon ring](https://projecteuler.net/problem=068)                         | 25%        | [0.000](src/problems/pb068.jl)  |
| 069     | [Totient maximum](https://projecteuler.net/problem=069)                          | 10%        | [0.000](src/problems/pb069.jl)  |
| 070     | [Totient permutation](https://projecteuler.net/problem=070)                      | 20%        | [6.482](src/problems/pb070.jl)  |
| 071     | [Ordered fractions](https://projecteuler.net/problem=071)                        | 10%        | [0.000](src/problems/pb071.jl)  |
| 072     | [Counting fractions](https://projecteuler.net/problem=072)                       | 20%        | [0.019](src/problems/pb072.jl)  |
| 073     | [Counting fractions in a range](https://projecteuler.net/problem=073)            | 15%        | [0.000](src/problems/pb073.jl)  |
| 074     | [Digit factorial chains](https://projecteuler.net/problem=074)                   | 15%        | [0.277](src/problems/pb074.jl)  |
| 075     | [Singular integer right triangles](https://projecteuler.net/problem=075)         | 25%        | [0.018](src/problems/pb075.jl)  |
| 076     | [Counting summations](https://projecteuler.net/problem=076)                      | 10%        | [0.000](src/problems/pb076.jl)  |
| 077     | [Prime summations](https://projecteuler.net/problem=077)                         | 25%        | [0.000](src/problems/pb077.jl)  |
| 078     | [Coin partitions](https://projecteuler.net/problem=078)                          | 30%        | [0.001](src/problems/pb078.jl)  |
| 079     | [Passcode derivation](https://projecteuler.net/problem=079)                      | 5%         | [0.000](src/problems/pb079.jl)  |
| 080     | [Square root digital expansion](https://projecteuler.net/problem=080)            | 20%        | [0.000](src/problems/pb080.jl)  |
