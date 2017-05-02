class DateConverter

  DATE_FORMAT_1 = '%Y-%m-%d'
  DATE_FORMAT_2 = '%m/%d/%Y'
  @@date_format = DATE_FORMAT_1

  def self.convert(value)
    begin
      get_date(value)
    rescue ArgumentError
      @@date_format = DATE_FORMAT_2
      get_date(value)
    end
  end
  private
  def self.get_date(value)
    Date.strptime(value, @@date_format)
  end
end