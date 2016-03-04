class Palindromes
  def initialize(options = {})
    @min_factor = options[:min_factor] || 1
    @max_factor = options[:max_factor] || 99
    @palindromics = []
  end

  def generate
    @min_factor.upto(@max_factor) do |factor_a|
      factor_a.upto(@max_factor) do |factor_b|
        factors = [factor_a, factor_b]
        @palindromics << factors if palindrome?(factors.reduce(:*))
      end
    end
  end

  def largest
    keep_only!(max_value)
    self
  end

  def smallest
    keep_only!(min_value)
    self
  end

  def factors
    @palindromics
  end

  def value
    values.first
  end

  private

  def palindrome?(value)
    value = value.to_s
    value == value.reverse
  end

  def values
    @palindromics.map { |palindromic| palindromic.reduce(:*) }
  end

  def max_value
    values.max
  end

  def min_value
    values.min
  end

  def keep_only!(value)
    @palindromics.keep_if {|palindromic| palindromic.reduce(:*) == value }
  end
end
