class Meetup
  NUMBERS = { first: 0, second: 1, third: 2, fourth: 3, last: -1 }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    target_day = Proc.new { |day| day.send("#{weekday}?".to_sym) }

    if schedule == :teenth
      weeks[teenth(weekday)].detect(&target_day)
    else
      weeks.flatten.select(&target_day)[NUMBERS[schedule]]
    end
  end

  private
  
  def weeks
    biginning_of_month = Date.new(@year, @month)
    end_of_month = Date.new(@year, @month, -1)

    weeks = [[]]
    biginning_of_month.upto(end_of_month) do |day|
      weeks.last << day
      weeks << [] if day.saturday?
    end
    weeks
  end

  def days_in_first_week
    weeks.first.size
  end

  def teenth(weekday)
    case weekday
    when :monday
      days_in_first_week > 3 ? 2 : 3
    when :tuesday
      days_in_first_week > 2 ? 2 : 3
    when :wednesday
      days_in_first_week > 1 ? 2 : 3
    when :thursday
      2
    when :friday
      days_in_first_week > 6 ? 1 : 2
    when :saturday
      days_in_first_week > 5 ? 1 : 2
    when :sunday
      days_in_first_week > 4 ? 2 : 3
    end
  end
end
