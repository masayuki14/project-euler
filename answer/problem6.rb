# Sum square difference
# Problem 6
#
# The sum of the squares of the first ten natural numbers is,
#   1^2 + 2^2 + 3^2 + ..... + 10^2 = 385
# The squares of the sum of the first ten natural numbers is,
#   (1 + 2 + ..... + 10)^2 = 3025
# Hence the diffrence between the sum of the squares of the first ten natural numbers and 
# the square of the sum is 3025 - 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural
# numbers and the square of the sum.
#
# 1~10の平方の和は 385 であり、1~10の和の平方は 3025 である。
# それらの差は 2640 となる。
# 同様に1~100の数での差を求めよ

# sum of the square
a = (1..100).to_a.map{|n| n**2}.inject(:+)

# square of the sum
b = (1..100).to_a.inject(:+) ** 2

p (b - a)
