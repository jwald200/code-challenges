class School
  def initialize
    @roster = {}
  end

  def to_h
    roster.sort.to_h.each { |_, grade| grade.sort! }
  end

  def add(name, grade)
    roster[grade] = (grades(grade) << name)
  end

  def grades(grade)
    roster.fetch(grade, [])
  end

  private

  attr_reader :roster
end
