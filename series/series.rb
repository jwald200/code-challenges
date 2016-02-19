class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(length_of_slice)
    fail ArgumentError if  length_of_slice > @digits.size

    numbers = @digits.chars.map(&:to_i)
    results = []
    numbers.each_index do |index|
      slice = numbers.slice(index,length_of_slice)
      results << slice if slice.size == length_of_slice
    end
    results
  end
end
