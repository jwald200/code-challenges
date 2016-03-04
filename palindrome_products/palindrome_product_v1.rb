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
    new_palindrome(max_value)
  end

  def smallest
    new_palindrome(min_value)
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

  protected

  def keep_only!(value)
    @palindromics.keep_if {|palindromic| palindromic.reduce(:*) == value }
  end

  def new_palindrome(min_or_max)
    palindrome = Palindromes.new(max_factor: @max_factor, min_factor: @min_factor)
    palindrome.generate
    palindrome.keep_only!(min_or_max)
    palindrome
  end
end
