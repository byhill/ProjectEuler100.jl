# ProjectEuler100.jl

[![Build status](https://ci.appveyor.com/api/projects/status/hgkaobx9v1yfwrme?svg=true)](https://ci.appveyor.com/project/byhill/projecteuler100-jl)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)

![](https://projecteuler.net/profile/byhill.png?)

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
| 081     | [Path sum: two ways](https://projecteuler.net/problem=081)                       | 10%        | [0.001](src/problems/pb081.jl)  |
| 082     | [Path sum: three ways](https://projecteuler.net/problem=082)                     | 20%        | [0.007](src/problems/pb082.jl)  |
| 083     | [Path sum: four ways](https://projecteuler.net/problem=083)                      | 25%        | [0.010](src/problems/pb083.jl)  |
| 084     | [Monopoly odds](https://projecteuler.net/problem=084)                            | 35%        | [0.002](src/problems/pb084.jl)  |
| 085     | [Counting rectangles](https://projecteuler.net/problem=085)                      | 15%        | [0.000](src/problems/pb085.jl)  |
| 086     | [Cuboid route](https://projecteuler.net/problem=086)                             | 35%        | [0.000](src/problems/pb086.jl)  |
| 087     | [Prime power triples](https://projecteuler.net/problem=087)                      | 20%        | [0.109](src/probems/pb087.jl)   |
| 088     | [Product-sum numbers](https://projecteuler.net/problem=088)                      | 40%        | [0.006](src/problems/pb088.jl)  |
| 089     | [Roman numerals](https://projecteuler.net/problem=089)                           | 20%        | [0.001](src/problems/pb089.jl)  |
| 090     | [Cube digit pairs](https://projecteuler.net/problem=090)                         | 40%        | [0.026](src/problems/pb090.jl)  |
| 091     | [Right triangles with integer coordinates](https://projecteuler.net/problem=091) | 25%        | [0.000](src/problems/pb091.jl)  |
| 092     | [Square digit chains](https://projecteuler.net/problem=092)                      | 5%         | [0.001](src/problems/pb092.jl)  |
| 093     | [Arithmetic expressions](https://projecteuler.net/problem=093)                   | 35%        | [0.335](src/problems/pb093.jl)  |
| 094     | [Almost equilateral triangles](https://projecteuler.net/problem=094)             | 35%        | [0.000](src/problems/pb094.jl)  |
| 095     | [Amicable chains](https://projecteuler.net/problem=095)                          | 30%        | [0.964](src/problems/pb095.jl)  |
| 096     | [Su Doku](https://projecteuler.net/problem=096)                                  | 25%        | [1.652](src/problems/pb096.jl)  |
| 097     | [Large non-Mersenne prime](https://projecteuler.net/problem=097)                 | 5%         | [0.000](src/problems/pb097.jl)  |
| 098     | [Anagramic squares](https://projecteuler.net/problem=098)                        | 35%        | [0.056](src/problems/pb056.jl)  |
| 099     | [Largest exponential](https://projecteuler.net/problem=099)                      | 10%        | [0.001](src/problems/pb099.jl)  |
| 100     | [Arranged probability](https://projecteuler.net/problem=100)                     | 30%        | [0.000](src/problems/pb100.jl)  |

## Other completed problems  (last updated: 2023/01/30)

These are a list of all other Project Euler problems I have completed.
No solutions are provided.

### Problems 101-200
| Problem | Title                                                                                                                                           | Difficulty |
| ---     | ---                                                                                                                                             | ---        |
| 101     | [Optimum polynomial](https://projecteuler.net/problem=101)                                                                                      | 35%        |
| 102     | [Triangle containment](https://projecteuler.net/problem=102)                                                                                    | 15%        |
| 103     | [Special subset sums: optimum](https://projecteuler.net/problem=103)                                                                            | 45%        |
| 104     | [Pandigital Fibonacci ends](https://projecteuler.net/problem=104)                                                                               | 25%        |
| 105     | [Special subset sums: testing](https://projecteuler.net/problem=105)                                                                            | 45%        |
| 106     | [Special subset sums: meta-testing](https://projecteuler.net/problem=106)                                                                       | 50%        |
| 107     | [Minimal network](https://projecteuler.net/problem=107)                                                                                         | 35%        |
| 108     | [Diophantine reciprocals I](https://projecteuler.net/problem=108)                                                                               | 30%        |
| 109     | [Darts](https://projecteuler.net/problem=109)                                                                                                   | 45%        |
| 110     | [Diophantine reciprocals II](https://projecteuler.net/problem=110)                                                                              | 40%        |
| 111     | [Primes with runs](https://projecteuler.net/problem=111)                                                                                        | 45%        |
| 112     | [Bouncy numbers](https://projecteuler.net/problem=112)                                                                                          | 15%        |
| 113     | [Non-bouncy numbers](https://projecteuler.net/problem=113)                                                                                      | 30%        |
| 114     | [Counting block combinations I](https://projecteuler.net/problem=114)                                                                           | 35%        |
| 115     | [Counting block combinations II](https://projecteuler.net/problem=115)                                                                          | 35%        |
| 116     | [Red, green or blue tiles](https://projecteuler.net/problem=116)                                                                                | 30%        |
| 117     | [Red, green, and blue tiles](https://projecteuler.net/problem=117)                                                                              | 35%        |
| 118     | [Pandigital prime sets](https://projecteuler.net/problem=118)                                                                                   | 45%        |
| 119     | [Digit power sum](https://projecteuler.net/problem=119)                                                                                         | 30%        |
| 120     | [Square remainders](https://projecteuler.net/problem=120)                                                                                       | 25%        |
| 121     | [Disc game prize fund](https://projecteuler.net/problem=121)                                                                                    | 35%        |
| 122     | [Efficient exponentiation](https://projecteuler.net/problem=122)                                                                                | 40%        |
| 123     | [Prime square remainders](https://projecteuler.net/problem=123)                                                                                 | 30%        |
| 124     | [Ordered radicals](https://projecteuler.net/problem=124)                                                                                        | 25%        |
| 125     | [Palindromic sums](https://projecteuler.net/problem=125)                                                                                        | 25%        |
| 126     | [Cuboid layers](https://projecteuler.net/problem=126)                                                                                           | 55%        |
| 127     | [abc-hits](https://projecteuler.net/problem=127)                                                                                                | 50%        |
| 128     | [Hexagonal tile differences](https://projecteuler.net/problem=128)                                                                              | 55%        |
| 129     | [Repunit divisibility](https://projecteuler.net/problem=129)                                                                                    | 45%        |
| 130     | [Composites with prime repunit property](https://projecteuler.net/problem=130)                                                                  | 45%        |
| 131     | [Prime cube partnership](https://projecteuler.net/problem=131)                                                                                  | 40%        |
| 132     | [Large repunit factors](https://projecteuler.net/problem=132)                                                                                   | 45%        |
| 133     | [Repunit nonfactors](https://projecteuler.net/problem=133)                                                                                      | 50%        |
| 134     | [Prime pair connection](https://projecteuler.net/problem=134)                                                                                   | 45%        |
| 135     | [Same differences](https://projecteuler.net/problem=135)                                                                                        | 45%        |
| 136     | [Singleton difference](https://projecteuler.net/problem=136)                                                                                    | 50%        |
| 137     | [Fibonacci golden nuggets](https://projecteuler.net/problem=137)                                                                                | 50%        |
| 138     | [Special isosceles triangles](https://projecteuler.net/problem=138)                                                                             | 45%        |
| 139     | [Pythagorean tiles](https://projecteuler.net/problem=139)                                                                                       | 50%        |
| 140     | [Modified Fibonacci golden nuggets](https://projecteuler.net/problem=140)                                                                       | 55%        |
| 141     | [Investigating progressive numbers, n, which are also square](https://projecteuler.net/problem=141)                                             | 60%        |
| 142     | [Perfect Square Collection](https://projecteuler.net/problem=142)                                                                               | 45%        |
| 143     | [Investigating the Torricelli point of a triangle](https://projecteuler.net/problem=143)                                                        | 65%        |
| 144     | [Investigating multiple reflections of a laser beam](https://projecteuler.net/problem=144)                                                      | 50%        |
| 145     | [How many reversible numbers are there below one-billion?](https://projecteuler.net/problem=145)                                                | 20%        |
| 146     | [Investigating a Prime Pattern](https://projecteuler.net/problem=146)                                                                           | 50%        |
| 147     | [Rectangles in cross-hatched grids](https://projecteuler.net/problem=147)                                                                       | 65%        |
| 148     | [Exploring Pascal's triangle](https://projecteuler.net/problem=148)                                                                             | 50%        |
| 149     | [Searching for a maximum-sum subsequence](https://projecteuler.net/problem=149)                                                                 | 50%        |
| 150     | [Searching a triangular array for a sub-triangle having minimum-sum](https://projecteuler.net/problem=150)                                      | 55%        |
| 151     | [Paper sheets of standard sizes: an expected-value problem](https://projecteuler.net/problem=151)                                               | 50%        |
| 152     | [Writing 1/2 as a sum of inverse squares](https://projecteuler.net/problem=152)                                                                 | 65%        |
| 153     | [Investigating Gaussian Integers](https://projecteuler.net/problem=153)                                                                         | 65%        |
| 154     | [Exploring Pascal's pyramid](https://projecteuler.net/problem=154)                                                                              | 65%        |
| 155     | [Counting Capacitor Circuits](https://projecteuler.net/problem=155)                                                                             | 60%        |
| 157     | [Solving the diophantine equation 1/a+1/b= p/10n](https://projecteuler.net/problem=157)                                                         | 65%        |
| 158     | [Exploring strings for which only one character comes lexicographically after its neighbour to the left](https://projecteuler.net/problem=158)  | 55%        |
| 159     | [Digital root sums of factorisations](https://projecteuler.net/problem=159)                                                                     | 60%        |
| 160     | [Factorial trailing digits](https://projecteuler.net/problem=160)                                                                               | 60%        |
| 161     | [Triominoes](https://projecteuler.net/problem=161)                                                                                              | 70%        |
| 162     | [Hexadecimal numbers](https://projecteuler.net/problem=162)                                                                                     | 45%        |
| 163     | [Cross-hatched triangles](https://projecteuler.net/problem=163)                                                                                 | 70%        |
| 164     | [Numbers for which no three consecutive digits have a sum greater than a given value](https://projecteuler.net/problem=164)                     | 45%        |
| 165     | [Intersections](https://projecteuler.net/problem=165)                                                                                           | 65%        |
| 166     | [Criss Cross](https://projecteuler.net/problem=166)                                                                                             | 50%        |
| 167     | [Investigating Ulam sequences](https://projecteuler.net/problem=167)                                                                            | 75%        |
| 168     | [Number Rotations](https://projecteuler.net/problem=168)                                                                                        | 65%        |
| 169     | [Exploring the number of different ways a number can be expressed as a sum of powers of 2](https://projecteuler.net/problem=169)                | 50%        |
| 171     | [Finding numbers for which the sum of the squares of the digits is a square](https://projecteuler.net/problem=171)                              | 65%        |
| 172     | [Investigating numbers with few repeated digits](https://projecteuler.net/problem=172)                                                          | 55%        |
| 173     | [Using up to one million tiles how many different "hollow" square laminae can be formed?](https://projecteuler.net/problem=173)                 | 30%        |
| 174     | [Counting the number of "hollow" square laminae that can form one, two, three, ... distinct arrangements](https://projecteuler.net/problem=174) | 40%        |
| 175     | [Fractions involving the number of different ways a number can be expressed as a sum of powers of 2](https://projecteuler.net/problem=175)      | 70%        |
| 176     | [Right-angled triangles that share a cathetus](https://projecteuler.net/problem=176)                                                            | 70%        |
| 177     | [Integer angled Quadrilaterals](https://projecteuler.net/problem=177)                                                                           | 80%        |
| 178     | [Step Numbers](https://projecteuler.net/problem=178)                                                                                            | 55%        |
| 179     | [Consecutive positive divisors](https://projecteuler.net/problem=179)                                                                           | 25%        |
| 180     | [Rational zeros of a function of three variables](https://projecteuler.net/problem=180)                                                         | 75%        |
| 181     | [Investigating in how many ways objects of two different colours can be grouped](https://projecteuler.net/problem=181)                          | 70%        |
| 182     | [RSA encryption](https://projecteuler.net/problem=182)                                                                                          | 60%        |
| 183     | [Maximum product of parts](https://projecteuler.net/problem=183)                                                                                | 45%        |
| 185     | [Number Mind](https://projecteuler.net/problem=185)                                                                                             | 55%        |
| 186     | [Connectedness of a network](https://projecteuler.net/problem=186)                                                                              | 60%        |
| 187     | [Semiprimes](https://projecteuler.net/problem=187)                                                                                              | 25%        |
| 188     | [The hyperexponentiation of a number](https://projecteuler.net/problem=188)                                                                     | 35%        |
| 189     | [Tri-colouring a triangular grid](https://projecteuler.net/problem=189)                                                                         | 70%        |
| 190     | [Maximising a weighted product](https://projecteuler.net/problem=190)                                                                           | 50%        |
| 191     | [Prize Strings](https://projecteuler.net/problem=191)                                                                                           | 35%        |
| 192     | [Best Approximations](https://projecteuler.net/problem=192)                                                                                     | 75%        |
| 193     | [Squarefree Numbers](https://projecteuler.net/problem=193)                                                                                      | 55%        |
| 195     | [Inscribed circles of triangles with one angle of 60 degrees](https://projecteuler.net/problem=195)                                             | 75%        |
| 196     | [Prime triplets](https://projecteuler.net/problem=196)                                                                                          | 65%        |
| 197     | [Investigating the behaviour of a recursively defined sequence](https://projecteuler.net/problem=197)                                           | 45%        |
| 199     | [Iterative Circle Packing](https://projecteuler.net/problem=199)                                                                                | 70%        |
| 200     | [Find the 200th prime-proof sqube containing the contiguous sub-string "200"](https://projecteuler.net/problem=200)                             | 65%        |

### Problems 201-254
| Problem | Title                                                                                            | Difficulty |
| ---     | ---                                                                                              | ---        |
| 201     | [Subsets with a unique sum](https://projecteuler.net/problem=201)                                | 65%        |
| 203     | [Squarefree Binomial Coefficients](https://projecteuler.net/problem=203)                         | 25%        |
| 204     | [Generalised Hamming Numbers](https://projecteuler.net/problem=204)                              | 30%        |
| 205     | [Dice Game](https://projecteuler.net/problem=205)                                                | 15%        |
| 206     | [Concealed Square](https://projecteuler.net/problem=206)                                         | 5%         |
| 207     | [Integer partition equations](https://projecteuler.net/problem=207)                              | 40%        |
| 209     | [Circular Logic](https://projecteuler.net/problem=209)                                           | 60%        |
| 211     | [Divisor Square Sum](https://projecteuler.net/problem=211)                                       | 50%        |
| 213     | [Flea Circus](https://projecteuler.net/problem=213)                                              | 60%        |
| 214     | [Totient Chains](https://projecteuler.net/problem=214)                                           | 40%        |
| 215     | [Crack-free Walls](https://projecteuler.net/problem=215)                                         | 50%        |
| 216     | [Investigating the primality of numbers of the form 2n2-1](https://projecteuler.net/problem=216) | 45%        |
| 218     | [Perfect right-angled triangles](https://projecteuler.net/problem=218)                           | 55%        |
| 221     | [Alexandrian Integers](https://projecteuler.net/problem=221)                                     | 65%        |
| 222     | [Sphere Packing](https://projecteuler.net/problem=222)                                           | 60%        |
| 223     | [Almost right-angled triangles I](https://projecteuler.net/problem=223)                          | 70%        |
| 225     | [Tribonacci non-divisors](https://projecteuler.net/problem=225)                                  | 45%        |
| 226     | [A Scoop of Blancmange](https://projecteuler.net/problem=226)                                    | 65%        |
| 227     | [The Chase](https://projecteuler.net/problem=227)                                                | 65%        |
| 228     | [Minkowski Sums](https://projecteuler.net/problem=228)                                           | 70%        |
| 230     | [Fibonacci Words](https://projecteuler.net/problem=230)                                          | 50%        |
| 231     | [The prime factorisation of binomial coefficients](https://projecteuler.net/problem=231)         | 40%        |
| 232     | [The Race](https://projecteuler.net/problem=232)                                                 | 65%        |
| 233     | [Lattice points on a circle](https://projecteuler.net/problem=233)                               | 70%        |
| 234     | [Semidivisible numbers](https://projecteuler.net/problem=234)                                    | 50%        |
| 235     | [An Arithmetic Geometric sequence](https://projecteuler.net/problem=235)                         | 40%        |
| 243     | [Resilience](https://projecteuler.net/problem=243)                                               | 35%        |
| 249     | [Prime Subset Sums](https://projecteuler.net/problem=249)                                        | 60%        |
| 250     | [250250](https://projecteuler.net/problem=250)                                                   | 55%        |
| 254     | [Sums of Digit Factorials](https://projecteuler.net/problem=254)                                 | 75%        |

### Problems 255-300
| Problem | Title                                                                                                            | Difficulty |
| ---     | ---                                                                                                              | ---        |
| 258     | [A lagged Fibonacci sequence](https://projecteuler.net/problem=258)                                              | 70%        |
| 265     | [Binary Circles](https://projecteuler.net/problem=265)                                                           | 40%        |
| 267     | [Billionaire](https://projecteuler.net/problem=267)                                                              | 50%        |
| 268     | [Counting numbers with at least four distinct prime factors less than 100](https://projecteuler.net/problem=268) | 70%        |
| 271     | [Modular Cubes, part 1](https://projecteuler.net/problem=271)                                                    | 60%        |
| 272     | [Modular Cubes, part 2](https://projecteuler.net/problem=272)                                                    | 80%        |
| 277     | [A Modified Collatz sequence](https://projecteuler.net/problem=277)                                              | 35%        |
| 282     | [The Ackermann function](https://projecteuler.net/problem=282)                                                   | 70%        |
| 286     | [Scoring probabilities](https://projecteuler.net/problem=286)                                                    | 50%        |
| 288     | [An enormous factorial](https://projecteuler.net/problem=288)                                                    | 35%        |
| 291     | [Panaitopol Primes](https://projecteuler.net/problem=291)                                                        | 45%        |
| 293     | [Pseudo-Fortunate Numbers](https://projecteuler.net/problem=293)                                                 | 30%        |
| 297     | [Zeckendorf Representation](https://projecteuler.net/problem=297)                                                | 35%        |

### Problems 301-400
| Problem | Title                                                                            | Difficulty |
| ---     | ---                                                                              | ---        |
| 301     | [Nim](https://projecteuler.net/problem=301)                                      | 15%        |
| 303     | [Multiples with small digits](https://projecteuler.net/problem=303)              | 35%        |
| 304     | [Primonacci](https://projecteuler.net/problem=304)                               | 40%        |
| 312     | [Cyclic paths on Sierpiński graphs](https://projecteuler.net/problem=312)        | 50%        |
| 315     | [Digital root clocks](https://projecteuler.net/problem=315)                      | 20%        |
| 321     | [Swapping Counters](https://projecteuler.net/problem=321)                        | 30%        |
| 323     | [Bitwise-OR operations on random integers](https://projecteuler.net/problem=323) | 20%        |
| 340     | [Crazy Function](https://projecteuler.net/problem=340)                           | 30%        |
| 341     | [Golomb's self-describing sequence](https://projecteuler.net/problem=341)        | 45%        |
| 345     | [Matrix Sum](https://projecteuler.net/problem=345)                               | 15%        |
| 346     | [Strong Repunits](https://projecteuler.net/problem=346)                          | 15%        |
| 347     | [Largest integer divisible by two primes](https://projecteuler.net/problem=347)  | 15%        |
| 348     | [Sum of a square and a cube](https://projecteuler.net/problem=348)               | 25%        |
| 351     | [Hexagonal orchards](https://projecteuler.net/problem=351)                       | 25%        |
| 357     | [Prime generating integers](https://projecteuler.net/problem=357)                | 10%        |
| 358     | [Cyclic numbers](https://projecteuler.net/problem=358)                           | 25%        |
| 365     | [A huge binomial coefficient](https://projecteuler.net/problem=365)              | 40%        |
| 371     | [Licence plates](https://projecteuler.net/problem=371)                           | 30%        |
| 380     | [Amazing Mazes!](https://projecteuler.net/problem=380)                           | 60%        |
| 381     | [(prime-k) factorial](https://projecteuler.net/problem=381)                      | 15%        |
| 387     | [Harshad Numbers](https://projecteuler.net/problem=387)                          | 10%        |
| 399     | [Squarefree Fibonacci Numbers](https://projecteuler.net/problem=399)             | 45%        |

### Problems 401-500
| Problem | Title                                                                            | Difficulty |
| ---     | ---                                                                              | ---        |
| 401     | [Sum of squares of divisors](https://projecteuler.net/problem=401)               | 25%        |
| 407     | [Idempotents](https://projecteuler.net/problem=407)                              | 20%        |
| 417     | [Reciprocal cycles II](https://projecteuler.net/problem=417)                     | 35%        |
| 429     | [Sum of squares of unitary divisors](https://projecteuler.net/problem=429)       | 20%        |
| 449     | [Chocolate covered candy](https://projecteuler.net/problem=449)                  | 40%        |
| 451     | [Modular inverses](https://projecteuler.net/problem=451)                         | 30%        |
| 461     | [Almost Pi](https://projecteuler.net/problem=461)                                | 30%        |
| 463     | [A weird recurrence relation](https://projecteuler.net/problem=463)              | 35%        |
| 491     | [Double pandigital number divisible by 11](https://projecteuler.net/problem=491) | 20%        |
| 493     | [Under The Rainbow](https://projecteuler.net/problem=493)                        | 10%        |
| 500     | [Problem 500!!!](https://projecteuler.net/problem=500)                           | 15%        |

### Problems 501-600
| Problem | Title                                                                | Difficulty |
| ---     | ---                                                                  | ---        |
| 501     | [Eight Divisors](https://projecteuler.net/problem=501)               | 40%        |
| 504     | [Square on the Inside](https://projecteuler.net/problem=504)         | 15%        |
| 516     | [5-smooth totients](https://projecteuler.net/problem=516)            | 20%        |
| 531     | [Chinese leftovers](https://projecteuler.net/problem=531)            | 25%        |
| 548     | [Gozinta Chains](https://projecteuler.net/problem=548)               | 35%        |
| 549     | [Divisibility of factorials](https://projecteuler.net/problem=549)   | 15%        |
| 575     | [Wandering Robots](https://projecteuler.net/problem=575)             | 35%        |
| 577     | [Counting hexagons](https://projecteuler.net/problem=577)            | 20%        |
| 581     | [47-smooth triangular numbers](https://projecteuler.net/problem=581) | 30%        |
| 587     | [Concave triangle](https://projecteuler.net/problem=587)             | 20%        |
| 594     | [Rhombus Tilings](https://projecteuler.net/problem=594)              | 85%        |

### Problems 601-700
| Problem | Title                                                                | Difficulty |
| ---     | ---                                                                  | ---        |
| 601     | [Divisibility streaks](https://projecteuler.net/problem=601)         | 20%        |
| 622     | [Riffle Shuffles](https://projecteuler.net/problem=622)              | 15%        |
| 628     | [Open chess positions](https://projecteuler.net/problem=628)         | 30%        |
| 630     | [Crossed lines](https://projecteuler.net/problem=630)                | 20%        |
| 650     | [Divisors of Binomial Product](https://projecteuler.net/problem=650) | 10%        |
| 659     | [Largest prime](https://projecteuler.net/problem=659)                | 20%        |
| 668     | [Square root smooth Numbers](https://projecteuler.net/problem=668)   | 20%        |
| 684     | [Inverse Digit Sum](https://projecteuler.net/problem=684)            | 5%         |
| 686     | [Powers of Two](https://projecteuler.net/problem=686)                | 5%         |
| 692     | [Siegbert and Jo](https://projecteuler.net/problem=692)              | 10%        |
| 694     | [Cube-full Divisors](https://projecteuler.net/problem=694)           | 15%        |
| 700     | [Eulercoin](https://projecteuler.net/problem=700)                    | 5%         |

### Problems 701-800
| Problem | Title                                                                   | Difficulty                              | Rank |
| ---     | ---                                                                     | ---                                     | ---  |
| 709     | [Even Stevens](https://projecteuler.net/problem=709)                    | 15%                                     |      |
| 710     | [One Million Members](https://projecteuler.net/problem=710)             | 10%                                     |      |
| 714     | [Duodigits](https://projecteuler.net/problem=714)                       | 25%                                     |      |
| 725     | [Digit sum numbers](https://projecteuler.net/problem=725)               | 10%                                     |      |
| 743     | [Window into a Matrix](https://projecteuler.net/problem=743)            | 10%                                     |      |
| 745     | [Sum of Squares II](https://projecteuler.net/problem=745)               | 10%                                     |      |
| 749     | [Near Power Sums](https://projecteuler.net/problem=749)                 | 15%                                     |      |
| 751     | [Concatenation Coincidence](https://projecteuler.net/problem=751)       | 5%                                      |      |
| 754     | [Product of Gauss Factorials](https://projecteuler.net/problem=754)     | 20%                                     |      |
| 755     | [Not Zeckendorf](https://projecteuler.net/problem=755)                  | 15%                                     |      |
| 757     | [Stealthy Numbers](https://projecteuler.net/problem=757)                | 10%                                     |      |
| 764     | [Asymmetric Diophantine Equation](https://projecteuler.net/problem=764) | 40%                                     |      |
| 777     | [Lissajous Curves](https://projecteuler.net/problem=777)                | 95%                                     | 91   |
| 780     | [Toriangulations](https://projecteuler.net/problem=780)                 | 100% (Not finalized yet, < 100 solvers) | 58   |
| 788     | [Dominating Numbers](https://projecteuler.net/problem=788)              | 10%                                     |      |
| 800     | [Hybrid Integers](https://projecteuler.net/problem=800)                 | 5%                                      |      |

### Problems 801-827
| Problem | Title                                                                             | Difficulty                             | Rank |
| ---     | ---                                                                               | ---                                    | ---  |
| 802     | [Iterated Composition](https://projecteuler.net/problem=802)                      | 35%                                    |      |
| 804     | [Counting Binary Quadratic Representations](https://projecteuler.net/problem=804) | 20%                                    |      |
| 807     | [Loops of Ropes](https://projecteuler.net/problem=807)                            | 90% (Not finalized yet, < 100 solvers) | 73   |
| 808     | [Reversible prime squares](https://projecteuler.net/problem=808)                  | 5%                                     | 94   |
| 809     | [Rational Recurrence Relation](https://projecteuler.net/problem=809)              | 35%                                    |      |
| 810     | [XOR-Primes](https://projecteuler.net/problem=810)                                | 20%                                    | 82   |
| 811     | [Bitwise Recursion](https://projecteuler.net/problem=811)                         | 40%                                    | 82   |
| 813     | [XOR-Powers](https://projecteuler.net/problem=813)                                | 20%                                    | 65   |
| 814     | [Mezzo-forte](https://projecteuler.net/problem=814)                               | 50%                                    |      |
| 815     | [Group by Value](https://projecteuler.net/problem=815)                            | 25%                                    |      |
| 816     | [Shortest distance among points](https://projecteuler.net/problem=816)            | 5%                                     | 36   |
| 817     | [Digits in Squares](https://projecteuler.net/problem=817)                         | 20%                                    |      |
| 820     | [Nth digit of Reciprocals](https://projecteuler.net/problem=820)                  |                                        | 76   |
| 822     | [Square the Smallest](https://projecteuler.net/problem=822)                       |                                        | 53   |
| 825     | [Chasing Game](https://projecteuler.net/problem=825)                              |                                        | 55   |
