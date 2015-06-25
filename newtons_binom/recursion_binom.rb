def binom(n)
  rec_binom(n).split.join(' + ')
end

def rec_binom(n, i=0, acc='')
  return acc if i > n
  acc += "#{c(n,i)}a^#{n-i}b^#{i}" + ' ' + rec_binom(n, i+1, acc)
end

def c(n, k)
  fact(n)/(fact(k)*fact(n-k))
end

def fact(n, acc=n)
  return 1 if n == 1 || n == 0
  acc *= fact(n-1)
end

require 'minitest/autorun'

describe 'binom' do
  it "should return Newton's binom" do
    binom(0).must_equal ("1a^0b^0")
    binom(1).must_equal ("1a^1b^0 + 1a^0b^1")
    binom(2).must_equal ("1a^2b^0 + 2a^1b^1 + 1a^0b^2")
    binom(3).must_equal ("1a^3b^0 + 3a^2b^1 + 3a^1b^2 + 1a^0b^3")
    binom(4).must_equal ("1a^4b^0 + 4a^3b^1 + 6a^2b^2 + 4a^1b^3 + 1a^0b^4")
    binom(5).must_equal ("1a^5b^0 + 5a^4b^1 + 10a^3b^2 + 10a^2b^3 + 5a^1b^4 + 1a^0b^5")
  end
end
