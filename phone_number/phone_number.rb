class PhoneNumber
  def initialize(number)
    @number = number
  end
  
  def number
    @number.gsub!(/\W/, '')
    @number.slice!(/(^1)\d{10}/, 1)
    @number.match(/^\d+$/) && @number.size == 10  ? @number : '0' * 10
  end
  
  def area_code
    number[0, 3]
  end
  
  def to_s
    "(#{number[0,3]}) #{number[3, 3]}-#{number[6, 4]}"
  end
end