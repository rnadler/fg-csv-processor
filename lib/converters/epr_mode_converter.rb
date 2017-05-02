require_relative '../constants'

class EprModeConverter
  def self.convert(value)
    case value
      when 'OFF'
        0
      when 'RAMP_ONLY'
        1
      when 'FULLTIME'
        2
      when 'NULL'
        NULL_VALUE
      else
        raise "EprModeConverter: Unknown value: #{value}"
    end
  end
end
