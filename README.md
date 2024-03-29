# ProjectEuler100.jl

[![Build status](https://ci.appveyor.com/api/projects/status/hgkaobx9v1yfwrme?svg=true)](https://ci.appveyor.com/project/byhill/projecteuler100-jl)

![PE](https://projecteuler.net/profile/byhill.png?)


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

| Problem | Title                                                                            | Difficulty | Running Time (s)               | Hackerrank                                                                                                            |
| ---     | ---                                                                              | ---        | ---                            | ---                                                                                                                   |
| 001     | [Multiples of 3 or 5](https://projecteuler.net/problem=001)                      | 5%         | [0.000](src/problems/pb001.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler001/problem) ([code](src/hackerrank/pb001.jl)) |
| 002     | [Even Fibonacci numbers](https://projecteuler.net/problem=002)                   | 5%         | [0.000](src/problems/pb002.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler002/problem) ([code](src/hackerrank/pb002.jl)) |
| 003     | [Largest prime factor](https://projecteuler.net/problem=003)                     | 5%         | [0.000](src/problems/pb003.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler003/problem) ([code](src/hackerrank/pb003.jl)) |
| 004     | [Largest palindrome product](https://projecteuler.net/problem=004)               | 5%         | [0.000](src/problems/pb004.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler004/problem) ([code](src/hackerrank/pb004.jl)) |
| 005     | [Smallest multiple](https://projecteuler.net/problem=005)                        | 5%         | [0.000](src/problems/pb005.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler005/problem) ([code](src/hackerrank/pb005.jl)) |
| 006     | [Sum square difference](https://projecteuler.net/problem=006)                    | 5%         | [0.000](src/problems/pb006.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler006/problem) ([code](src/hackerrank/pb006.jl)) |
| 007     | [10001st prime](https://projecteuler.net/problem=007)                            | 5%         | [0.000](src/problems/pb007.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler007/problem) ([code](src/hackerrank/pb007.jl)) |
| 008     | [Largest product in a series](https://projecteuler.net/problem=008)              | 5%         | [0.000](src/problems/pb008.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler008/problem) ([code](src/hackerrank/pb008.jl)) |
| 009     | [Special Pythagorean triplet](https://projecteuler.net/problem=009)              | 5%         | [0.000](src/problems/pb009.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler009/problem) ([code](src/hackerrank/pb009.jl)) |
| 010     | [Summation of primes](https://projecteuler.net/problem=010)                      | 5%         | [0.000](src/problems/pb010.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler010/problem) ([code](src/hackerrank/pb010.jl)) |
| 011     | [Largest product in a grid](https://projecteuler.net/problem=011)                | 5%         | [0.000](src/problems/pb011.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler011/problem) ([code](src/hackerrank/pb011.jl)) |
| 012     | [Highly divisible triangular number](https://projecteuler.net/problem=012)       | 5%         | [0.000](src/problems/pb012.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler012/problem) ([code](src/hackerrank/pb012.jl)) |
| 013     | [Large sum](https://projecteuler.net/problem=013)                                | 5%         | [0.000](src/problems/pb013.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler013/problem) ([code](src/hackerrank/pb013.jl)) |
| 014     | [Longest Collatz sequence](https://projecteuler.net/problem=014)                 | 5%         | [0.143](src/problems/pb014.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler014/problem) ([code](src/hackerrank/pb014.jl)) |
| 015     | [Lattice paths](https://projecteuler.net/problem=015)                            | 5%         | [0.000](src/problems/pb015.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler015/problem) ([code](src/hackerrank/pb015.jl)) |
| 016     | [Power digit sum](https://projecteuler.net/problem=016)                          | 5%         | [0.000](src/problems/pb016.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler016/problem) ([code](src/hackerrank/pb016.jl)) |
| 017     | [Number letter counts](https://projecteuler.net/problem=017)                     | 5%         | [0.000](src/problems/pb017.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler017/problem) ([code](src/hackerrank/pb017.jl)) |
| 018     | [Maximum path sum I](https://projecteuler.net/problem=018)                       | 5%         | [0.000](src/problems/pb018.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler018/problem) ([code](src/hackerrank/pb018.jl)) |
| 019     | [Counting Sundays](https://projecteuler.net/problem=019)                         | 5%         | [0.000](src/problems/pb019.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler019/problem) ([code](src/hackerrank/pb019.jl)) |
| 020     | [Factorial digit sum](https://projecteuler.net/problem=020)                      | 5%         | [0.000](src/problems/pb020.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler020/problem) ([code](src/hackerrank/pb020.jl)) |
| 021     | [Amicable numbers](https://projecteuler.net/problem=021)                         | 5%         | [0.001](src/problems/pb021.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler021/problem) ([code](src/hackerrank/pb021.jl)) |
| 022     | [Names scores](https://projecteuler.net/problem=022)                             | 5%         | [0.002](src/problems/pb022.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler022/problem) ([code](src/hackerrank/pb022.jl)) |
| 023     | [Non-abundant sums](https://projecteuler.net/problem=023)                        | 5%         | [0.004](src/problems/pb023.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler023/problem) ([code](src/hackerrank/pb023.jl)) |
| 024     | [Lexicographic permutations](https://projecteuler.net/problem=024)               | 5%         | [0.000](src/problems/pb024.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler024/problem) ([code](src/hackerrank/pb024.jl)) |
| 025     | [1000-digit Fibonacci number](https://projecteuler.net/problem=025)              | 5%         | [0.000](src/problems/pb025.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler025/problem) ([code](src/hackerrank/pb025.jl)) |
| 026     | [Reciprocal cycles](https://projecteuler.net/problem=026)                        | 5%         | [0.000](src/problems/pb026.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler026/problem) ([code](src/hackerrank/pb026.jl)) |
| 027     | [Quadratic primes](https://projecteuler.net/problem=027)                         | 5%         | [0.001](src/problems/pb027.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler027/problem) ([code](src/hackerrank/pb027.jl)) |
| 028     | [Number spiral diagonals](https://projecteuler.net/problem=028)                  | 5%         | [0.000](src/problems/pb028.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler028/problem) ([code](src/hackerrank/pb028.jl)) |
| 029     | [Distinct powers](https://projecteuler.net/problem=029)                          | 5%         | [0.000](src/problems/pb029.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler029/problem) ([code](src/hackerrank/pb029.jl)) |
| 030     | [Digit fifth powers](https://projecteuler.net/problem=030)                       | 5%         | [0.000](src/problems/pb030.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler030/problem) ([code](src/hackerrank/pb030.jl)) |
| 031     | [Coin sums](https://projecteuler.net/problem=031)                                | 5%         | [0.000](src/problems/pb031/jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler031/problem) ([code](src/hackerrank/pb031.jl)) |
| 032     | [Pandigital products](https://projecteuler.net/problem=032)                      | 5%         | [0.042](src/problems/pb032.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler032/problem) ([code](src/hackerrank/pb032.jl)) |
| 033     | [Digit cancelling fractions](https://projecteuler.net/problem=033)               | 5%         | [0.000](src/problems/pb033.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler033/problem) ([code](src/hackerrank/pb033.jl)) |
| 034     | [Digit factorials](https://projecteuler.net/problem=034)                         | 5%         | [0.032](src/problems/pb034.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler034/problem) ([code](src/hackerrank/pb034.jl)) |
| 035     | [Circular primes](https://projecteuler.net/problem=035)                          | 5%         | [0.007](src/problems/pb035.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler035/problem) ([code](src/hackerrank/pb035.jl)) |
| 036     | [Double-base palindromes](https://projecteuler.net/problem=036)                  | 5%         | [0.030](src/problems/pb036.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler036/problem) ([code](src/hackerrank/pb036.jl)) |
| 037     | [Truncatable primes](https://projecteuler.net/problem=037)                       | 5%         | [0.000](src/problems/pb037.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler037/problem) ([code](src/hackerrank/pb037.jl)) |
| 038     | [Pandigital multiples](https://projecteuler.net/problem=038)                     | 5%         | [0.001](src/problems/pb038.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler038/problem) ([code](src/hackerrank/pb038.jl)) |
| 039     | [Integer right triangles](https://projecteuler.net/problem=039)                  | 5%         | [0.000](src/problems/pb039.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler039/problem) ([code](src/hackerrank/pb039.jl)) |
| 040     | [Champernowne's constant](https://projecteuler.net/problem=040)                  | 5%         | [0.000](src/problems/pb040.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler040/problem) ([code](src/hackerrank/pb040.jl)) |
| 041     | [Pandigital prime](https://projecteuler.net/problem=041)                         | 5%         | [0.052](src/problems/pb041.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler041/problem) ([code](src/hackerrank/pb041.jl)) |
| 042     | [Coded triangle numbers](https://projecteuler.net/problem=042)                   | 5%         | [0.000](src/problems/pb042.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler042/problem) ([code](src/hackerrank/pb042.jl)) |
| 043     | [Sub-string divisibility](https://projecteuler.net/problem=043)                  | 5%         | [0.961](src/problems/pb043.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler043/problem) ([code](src/hackerrank/pb043.jl)) |
| 044     | [Pentagon numbers](https://projecteuler.net/problem=044)                         | 5%         | [0.000](src/problems/pb044.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler044/problem) ([code](src/hackerrank/pb044.jl)) |
| 045     | [Triangular, pentagonal, and hexagonal](https://projecteuler.net/problem=045)    | 5%         | [0.000](src/problems/pb045.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler045/problem) ([code](src/hackerrank/pb045.jl)) |
| 046     | [Goldbach's other conjecture](https://projecteuler.net/problem=046)              | 5%         | [0.000](src/problems/pb046.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler046/problem) ([code](src/hackerrank/pb046.jl)) |
| 047     | [Distinct primes factors](https://projecteuler.net/problem=047)                  | 5%         | [0.011](src/problems/pb047.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler047/problem) ([code](src/hackerrank/pb047.jl)) |
| 048     | [Self powers](https://projecteuler.net/problem=048)                              | 5%         | [0.001](src/problems/pb048.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler048/problem) ([code](src/hackerrank/pb048.jl)) |
| 049     | [Prime permutations](https://projecteuler.net/problem=049)                       | 5%         | [0.000](src/problems/pb049.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler049/problem) ([code](src/hackerrank/pb049.jl)) |
| 050     | [Consecutive prime sum](https://projecteuler.net/problem=050)                    | 5%         | [0.003](src/problems/pb050.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler050/problem) ([code](src/hackerrank/pb050.jl)) |
| 051     | [Prime digit replacements](https://projecteuler.net/problem=051)                 | 15%        | [0.023](src/problems/pb051.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler051/problem) ([code](src/hackerrank/pb051.jl)) |
| 052     | [Permuted multiples](https://projecteuler.net/problem=052)                       | 5%         | [0.051](src/problems/pb052.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler052/problem) ([code](src/hackerrank/pb052.jl)) |
| 053     | [Combinatoric selections](https://projecteuler.net/problem=053)                  | 5%         | [0.000](src/problems/pb053.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler053/problem) ([code](src/hackerrank/pb053.jl)) |
| 054     | [Poker hands](https://projecteuler.net/problem=054)                              | 10%        | [0.004](src/problems/pb054.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler054/problem) ([code](src/hackerrank/pb054.jl)) |
| 055     | [Lychrel numbers](https://projecteuler.net/problem=055)                          | 5%         | [0.043](src/problems/pb055.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler055/problem) ([code](src/hackerrank/pb055.jl)) |
| 056     | [Powerful digit sum](https://projecteuler.net/problem=056)                       | 5%         | [0.012](src/problems/pb056.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler056/problem) ([code](src/hackerrank/pb056.jl)) |
| 057     | [Square root convergents](https://projecteuler.net/problem=057)                  | 5%         | [0.002](src/problems/pb057.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler057/problem) ([code](src/hackerrank/pb057.jl)) |
| 058     | [Spiral primes](https://projecteuler.net/problem=058)                            | 5%         | [0.016](src/problems/pb058.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler058/problem) ([code](src/hackerrank/pb058.jl)) |
| 059     | [XOR decryption](https://projecteuler.net/problem=059)                           | 5%         | [0.087](src/problems/pb059.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler059/problem) ([code](src/hackerrank/pb059.jl)) |
| 060     | [Prime pair sets](https://projecteuler.net/problem=060)                          | 20%        | [2.607](src/problems/pb060.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler060/problem) ([code](src/hackerrank/pb060.jl)) |
| 061     | [Cyclical figurate numbers](https://projecteuler.net/problem=061)                | 20%        | [0.063](src/problems/pb061.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler061/problem) ([code](src/hackerrank/pb061.jl)) |
| 062     | [Cubic permutations](https://projecteuler.net/problem=062)                       | 15%        | [0.003](src/problems/pb062.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler062/problem) ([code](src/hackerrank/pb062.jl)) |
| 063     | [Powerful digit counts](https://projecteuler.net/problem=63)                     | 5%         | [0.000](src/problems/pb063.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler063/problem) ([code](src/hackerrank/pb063.jl)) |
| 064     | [Odd period square roots](https://projecteuler.net/problem=064)                  | 20%        | [0.793](src/problems/pb064.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler064/problem) ([code](src/hackerrank/pb064.jl)) |
| 065     | [Convergents of e](https://projecteuler.net/problem=065)                         | 15%        | [0.000](src/problems/pb065.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler065/problem) ([code](src/hackerrank/pb065.jl)) |
| 066     | [Diophantine equation](https://projecteuler.net/problem=066)                     | 25%        | [0.019](src/problems/pb066.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler066/problem) ([code](src/hackerrank/pb066.jl)) |
| 067     | [Maximum path sum II](https://projecteuler.net/problem=067)                      | 5%         | [0.001](src/problems/pb067.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler067/problem) ([code](src/hackerrank/pb067.jl)) |
| 068     | [Magic 5-gon ring](https://projecteuler.net/problem=068)                         | 25%        | [0.000](src/problems/pb068.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler068/problem) ([code](src/hackerrank/pb068.jl)) |
| 069     | [Totient maximum](https://projecteuler.net/problem=069)                          | 10%        | [0.000](src/problems/pb069.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler069/problem) ([code](src/hackerrank/pb069.jl)) |
| 070     | [Totient permutation](https://projecteuler.net/problem=070)                      | 20%        | [3.590](src/problems/pb070.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler070/problem) ([code](src/hackerrank/pb070.jl)) |
| 071     | [Ordered fractions](https://projecteuler.net/problem=071)                        | 10%        | [0.000](src/problems/pb071.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler071/problem) ([code](src/hackerrank/pb071.jl)) |
| 072     | [Counting fractions](https://projecteuler.net/problem=072)                       | 20%        | [0.009](src/problems/pb072.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler072/problem) ([code](src/hackerrank/pb072.jl)) |
| 073     | [Counting fractions in a range](https://projecteuler.net/problem=073)            | 15%        | [0.000](src/problems/pb073.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler073/problem) ([code](src/hackerrank/pb073.jl)) |
| 074     | [Digit factorial chains](https://projecteuler.net/problem=074)                   | 15%        | [0.034](src/problems/pb074.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler074/problem) ([code](src/hackerrank/pb074.jl)) |
| 075     | [Singular integer right triangles](https://projecteuler.net/problem=075)         | 25%        | [0.018](src/problems/pb075.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler075/problem) ([code](src/hackerrank/pb075.jl)) |
| 076     | [Counting summations](https://projecteuler.net/problem=076)                      | 10%        | [0.000](src/problems/pb076.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler076/problem) ([code](src/hackerrank/pb076.jl)) |
| 077     | [Prime summations](https://projecteuler.net/problem=077)                         | 25%        | [0.000](src/problems/pb077.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler077/problem) ([code](src/hackerrank/pb077.jl)) |
| 078     | [Coin partitions](https://projecteuler.net/problem=078)                          | 30%        | [0.001](src/problems/pb078.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler078/problem) ([code](src/hackerrank/pb078.jl)) |
| 079     | [Passcode derivation](https://projecteuler.net/problem=079)                      | 5%         | [0.000](src/problems/pb079.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler079/problem) ([code](src/hackerrank/pb079.jl)) |
| 080     | [Square root digital expansion](https://projecteuler.net/problem=080)            | 20%        | [0.000](src/problems/pb080.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler080/problem) ([code](src/hackerrank/pb080.jl)) |
| 081     | [Path sum: two ways](https://projecteuler.net/problem=081)                       | 10%        | [0.001](src/problems/pb081.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler081/problem) ([code](src/hackerrank/pb081.jl)) |
| 082     | [Path sum: three ways](https://projecteuler.net/problem=082)                     | 20%        | [0.007](src/problems/pb082.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler082/problem) ([code](src/hackerrank/pb082.jl)) |
| 083     | [Path sum: four ways](https://projecteuler.net/problem=083)                      | 25%        | [0.010](src/problems/pb083.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler083/problem) ([code](src/hackerrank/pb083.jl)) |
| 084     | [Monopoly odds](https://projecteuler.net/problem=084)                            | 35%        | [0.002](src/problems/pb084.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler084/problem) ([code](src/hackerrank/pb084.jl)) |
| 085     | [Counting rectangles](https://projecteuler.net/problem=085)                      | 15%        | [0.000](src/problems/pb085.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler085/problem) ([code](src/hackerrank/pb085.jl)) |
| 086     | [Cuboid route](https://projecteuler.net/problem=086)                             | 35%        | [0.000](src/problems/pb086.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler086/problem) ([code](src/hackerrank/pb086.jl)) |
| 087     | [Prime power triples](https://projecteuler.net/problem=087)                      | 20%        | [0.109](src/problems/pb087.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler087/problem) ([code](src/hackerrank/pb087.jl)) |
| 088     | [Product-sum numbers](https://projecteuler.net/problem=088)                      | 40%        | [0.006](src/problems/pb088.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler088/problem) ([code](src/hackerrank/pb088.jl)) |
| 089     | [Roman numerals](https://projecteuler.net/problem=089)                           | 20%        | [0.001](src/problems/pb089.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler089/problem) ([code](src/hackerrank/pb089.jl)) |
| 090     | [Cube digit pairs](https://projecteuler.net/problem=090)                         | 40%        | [0.026](src/problems/pb090.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler090/problem) ([code](src/hackerrank/pb090.jl)) |
| 091     | [Right triangles with integer coordinates](https://projecteuler.net/problem=091) | 25%        | [0.000](src/problems/pb091.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler091/problem) ([code](src/hackerrank/pb091.jl)) |
| 092     | [Square digit chains](https://projecteuler.net/problem=092)                      | 5%         | [0.001](src/problems/pb092.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler092/problem) ([code](src/hackerrank/pb092.jl)) |
| 093     | [Arithmetic expressions](https://projecteuler.net/problem=093)                   | 35%        | [0.335](src/problems/pb093.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler093/problem) ([code](src/hackerrank/pb093.jl)) |
| 094     | [Almost equilateral triangles](https://projecteuler.net/problem=094)             | 35%        | [0.000](src/problems/pb094.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler094/problem) ([code](src/hackerrank/pb094.jl)) |
| 095     | [Amicable chains](https://projecteuler.net/problem=095)                          | 30%        | [0.964](src/problems/pb095.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler095/problem) ([code](src/hackerrank/pb095.jl)) |
| 096     | [Su Doku](https://projecteuler.net/problem=096)                                  | 25%        | [1.652](src/problems/pb096.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler096/problem) ([code](src/hackerrank/pb096.jl)) |
| 097     | [Large non-Mersenne prime](https://projecteuler.net/problem=097)                 | 5%         | [0.000](src/problems/pb097.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler097/problem) ([code](src/hackerrank/pb097.jl)) |
| 098     | [Anagramic squares](https://projecteuler.net/problem=098)                        | 35%        | [0.056](src/problems/pb056.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler098/problem) ([code](src/hackerrank/pb098.jl)) |
| 099     | [Largest exponential](https://projecteuler.net/problem=099)                      | 10%        | [0.001](src/problems/pb099.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler099/problem) ([code](src/hackerrank/pb099.jl)) |
| 100     | [Arranged probability](https://projecteuler.net/problem=100)                     | 30%        | [0.000](src/problems/pb100.jl) | [100](https://www.hackerrank.com/contests/projecteuler/challenges/euler100/problem) ([code](src/hackerrank/pb100.jl)) |
