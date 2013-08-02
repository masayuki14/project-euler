#Multiples of 3 and 5
#Problem 1
#
#If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.
#
# 10未満の自然数で3または5の倍数は3,5,6,9である。
# これらを合計すると23となる。
# 1000未満の自然数で3または5の倍数の合計はいくらか？

def sum_of_multiples(range)
  multiple = Array.new
  range.each do |i|
    multiple << i if (i % 3 == 0) || (i % 5 == 0)
  end
  return multiple
end

range = 1...10
p multiples = sum_of_multiples(range)
p multiples.inject(0) { |sum, v| sum += v }

range = 1...1000
p multiples = sum_of_multiples(range)
p multiples.inject(0) { |sum, v| sum += v }
