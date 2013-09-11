# Smallest multiple
# Problem 5
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
#
# 2520は1から10のすべての数で割り切れる最小値である。
# 1から20の全てで割り切れる最小の正の数は何か。

require './problem3'

# 配列の要素数を数える
# [2, 2, 3, 5] -> {2=>2, 3=>1, 5=>1}
def count_nums(numbers)
  result = Hash.new
  numbers.each do |num|
    if result[num]
      result[num] += 1
    else
      result[num] = 1
    end
  end
  return result
end

factor_set = Hash.new
20.downto(1) do |i|
  # problem3 で作った素因数分解の関数を使う
  factors = find_prime_factors(i)

  # 素因数がいくつあるかカウント
  # keyが素因数でvalueはその数
  # 2 * 2 * 3 => {2=>2, 3=>1}
  counted = count_nums(factors)

  # それぞれの素因数で最低限必要な数をカウント
  counted.each_key do |key|
    if factor_set[key]
      if factor_set[key] < counted[key]
        factor_set[key] = counted[key]
      end
    else
      factor_set[key] = counted[key]
    end
  end
end

divisible = 1
# 必要最低限の素因数を掛けあわせれば解
factor_set.each_key do |key|
  divisible = divisible * (key ** factor_set[key])
end

puts divisible

# 20: 2 * 2 * 5
# 19: 19
# 18: 2 * 3 * 3
# 17: 17
# 16: 2 * 2 * 2 * 2
# 15: 3 * 5
# 14: 2 * 7
# 13: 13
# 12: 2 * 2 * 3
# 11: 11
# 10: 2 * 5
#  9: 3 * 3
#  8: 2 * 2 * 2
#  7: 7
#  6: 2 * 3
#  5: 5
#  4: 2 * 2
#  3: 3
#  2: 2
#  1: 1
