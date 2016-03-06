class Palindromes
  def initialize(options = {})
    @min_factor = options[:min_factor] || 1
    @max_factor = options[:max_factor]
    @palindromes = []
  end

  def generate
    @min_factor.upto(@max_factor) do |factor_a|
      factor_a.upto(@max_factor) do |factor_b|
        value = factor_a*factor_b
        if palindrome?(value)
          @palindromes << Palindrome.new(value, @min_factor, @max_factor)
        end
      end
    end
  end

  def largest
    @palindromes.max_by(&:value)
  end

  def smallest
    @palindromes.first
  end
  
  private

  def palindrome?(value)
    value = value.to_s
    value == value.reverse
  end
end

class Palindrome
  attr_reader :value
  
  def initialize(value, min, max)
    @value = value
    @min = min
    @max = max
  end
  
  def factors
    dividers.map do |num|
      [num , value / num].sort
    end.uniq
  end
  
  private
  
  def dividers
    (@min..@max).select { |num| value % num == 0 && value/num <= @max }
  end
end
