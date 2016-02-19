class PhoneNumber
  def initialize(number)
    @number = number
  end
  
  def number
    valid_number || '0' * 10
  end
  
  def area_code
    number[0, 3]
  end
  
  def to_s
    print_number = number
    "(#{print_number[0,3]}) #{print_number[3, 3]}-#{print_number[6, 4]}"
  end
  
  private
  
  def valid_number
    /^\(?1?(\d{3})\W{0,2}(\d{3})\W?(\d{4})$/.match(@number)&.captures&.join
  end
end