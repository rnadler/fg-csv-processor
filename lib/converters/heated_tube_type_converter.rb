require_relative '../constants'

class HeatedTubeTypeConverter
  def self.convert(value)
    case value
      when 'None'
        0
      when '15mm'
        1
      when '19mm'
        2
      when 'NULL'
        NULL_VALUE
      else
        raise "HeatedTubeTypeConverter: Unknown value: #{value}"
    end
  end
end
