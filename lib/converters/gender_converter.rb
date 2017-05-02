require_relative '../constants'

class GenderConverter
  def self.convert(value)
    case value
      when 'MALE'
        1
      when 'FEMALE'
        0
      when 'NULL'
        NULL_VALUE
      else
        raise "GenderConverter: Unknown value: #{value}"
    end
  end
end