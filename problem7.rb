# 10001st prime
# Problem 7
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10001st prime number?
#
# 10001番目の素数
# 最初の6雨の素数は 2, 3, 5, 7, 11, 13 である。6番目の素数とは13である。
# では10001番目の素数はなにか？

def through(operator, numbers)
  for num in numbers
    return false if operator % num == 0
  end
  return true
end

num = 2
primes = Array.new
cnt = 0
limit = 10001

loop do
  if num != 1 && through(num, primes)
    primes << num
    cnt += 1
  end
  break if (cnt == limit)
  num += 1
end

p num
