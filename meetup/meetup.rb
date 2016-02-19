class Meetup
  NUMBERS = { first: 0, second: 1, third: 2, fourth: 3, last: -1 }.freeze

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    target_day = Proc.new { |day| day.send("#{weekday}?".to_sym) }

    if schedule == :teenth
      entire_month.slice(12..31).detect(&target_day)
    else
      entire_month.select(&target_day)[NUMBERS[schedule]]
    end
  end

  private

  def entire_month
    biginning_of_month = Date.new(@year, @month)
    end_of_month = Date.new(@year, @month, -1)

    biginning_of_month.upto(end_of_month).to_a
  end
end
