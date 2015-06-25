class Binom
  def initialize n
    @n = n.to_i
  end

  def result
    range.map {|i| "#{c(@n, i)}a^#{@n-i}b^#{i}" }.join(' + ')
  end

  private

  def range
    (0..@n).to_a
  end

  def c( n, k)
    n.!/(k.!*(n-k).!)
  end
end

class Fixnum
  def !
    (1..self).reduce(:*) || 1
  end
end

require 'minitest/autorun'

describe Binom do
  describe '#result' do
    it "should return Newton's binom" do
      Binom.new(0).result.must_equal ("1a^0b^0")
      Binom.new(1).result.must_equal ("1a^1b^0 + 1a^0b^1")
      Binom.new(2).result.must_equal ("1a^2b^0 + 2a^1b^1 + 1a^0b^2")
      Binom.new(3).result.must_equal ("1a^3b^0 + 3a^2b^1 + 3a^1b^2 + 1a^0b^3")
      Binom.new(4).result.must_equal ("1a^4b^0 + 4a^3b^1 + 6a^2b^2 + 4a^1b^3 + 1a^0b^4")
      Binom.new(5).result.must_equal ("1a^5b^0 + 5a^4b^1 + 10a^3b^2 + 10a^2b^3 + 5a^1b^4 + 1a^0b^5")
    end
  end
end
