require_relative 'date_converter'

class AgeConverter
  def self.convert(value)
    age(DateConverter.convert(value))
  end

  private
  def self.age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end