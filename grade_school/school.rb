class School
  attr_reader :stutents

  def initialize
    @stutents = {}
  end

  def to_h
    stutents.values.each(&:sort!)
    stutents.sort.to_h
  end

  def add(name, grade)
    grade = stutents[grade] ||= []
    grade << name
  end

  def grade(number)
    stutents[number] || []
  end
end
