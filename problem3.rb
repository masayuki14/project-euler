# Largest prime factor
# Problem 3
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
#
# 13195 素因数は 5,7,13,29 である
# 600851475143 の素因数で最大値を求めよ

# 指定の数値までに含まれる素数を求める
# アルゴリズムはエラトステネスのふるいを用いる
def prime_numbers_from(num)

  # 素数リスト
  # 2は始めから含める
  prime_numbers = [2]

  # 探索リスト
  # 偶数を始めから除外しておく
  targets = Array.new(num/2) {|i| i * 2 + 1}
  targets.delete 1

  targets.each do |v|
    next if v == 1

    # 探索リストの先頭を素数リストに加える
    prime_numbers << v

    # 素数リストに加えた数の全ての倍数を探索リストから削除する
    operator = 2
    delete_num = v * operator
    while delete_num < num
      targets.delete delete_num
      operator += 1
      delete_num = v * operator
    end

    # 素数リストの最大値の平方が探索リストの最大値より大きい場合
    # 素数リストと探索リストに残っている数が素数となる
    if v ** 2 > targets.max
      prime_numbers = prime_numbers + targets
      break
    end
  end
  return prime_numbers
end

# 引数に渡された数の素因数分解を行い結果を配列で返す
def find_prime_factors(num)
  prime_numbers = prime_numbers_from(10000)

  prime_factors = Array.new
  while num != 1
    prime_numbers.each do |prime_number|
      loop do
        if num % prime_number == 0
          prime_factors << prime_number
          num = num / prime_number
        else
          break
        end
      end
    end
  end

  return prime_factors
end

