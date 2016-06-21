# Largest palindrome product
# Problem 4
# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#
# 回文数は前から呼んでも後ろから呼んでも同じ数である。
# 2桁の数の積からなる回文数の最大値は 9009 で 91 ✕ 99 で求められる。
# 3桁の数の積からなる回文数の最大値はいくらか

class Integer
  def palindromic?
    self.to_s == self.to_s.reverse
  end
end

palindromics = Array.new
max = 0
999.downto(100) do |i|
  999.downto(100) do |j|
    num = i * j
    next if num % 11 != 0
    if num.palindromic?
      palindromics << num
      if max < num
        max = num
      else
        break
      end
    end
  end
end

p palindromics.max

puts 101.palindromic?
puts 3984.palindromic?
puts 39088093.palindromic?
puts 130858031.palindromic?
puts 55.palindromic?
