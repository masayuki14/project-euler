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

class Fixnum
  def length
    self.to_s.length
  end
end

def palindromic?(num)

  if num.instance_of?(String) && num.length <= 2
    num = num.to_i
  end

  # 1桁はtrue
  return true if num.length == 1

  # 2桁はゾロ目ならtrue
  if num.length == 2
    if num / 10 == num % 10
      return true
    else
      return false
    end
  end

  # 3桁なら最初と最後が等しくそれらを取り去っても回文数なら回文数
  if num.instance_of? String
    if num.slice(0, 1) == num.slice(num.length - 1, 1)
      num = num.slice(1, num.length - 2)
      return palindromic? num
    else
      return false
    end
  else
    if num % 10 == num.to_s[0].chr.to_i
      if num.to_s[1].chr.to_i == 0
        num = num.to_s.slice(1, num.to_s.length - 2)
      else
        num = num / 10
        num = num.to_s.slice(1, num.to_s.length).to_i
      end
      return palindromic?(num)

    else
      return false
    end
  end
end


palindromics = Array.new
max = 0
999.downto(0) do |i|
  999.downto(0) do |j|
    #p "%d , %d = %d" % [i, j, i*j]
    num = i * j

    if num.to_s == num.to_s.reverse
      palindromics << num
      if max < num
        p "%d , %d = %d" % [i, j, i*j]
        max = num
      end
    end
    #if palindromic?(i * j)
    #end
  end
end

p palindromics.max

__END__
puts palindromic? 101
puts palindromic? 3984
puts palindromic? 39088093
puts palindromic? 130858031
puts palindromic? 55
