require_relative '../constants'

class HumidifierTypeConverter
  def self.convert(value)
    case value
      when 'ENDCAP'
        0
      when 'EXTERNAL'
        1
      when 'INTERNAL'
        2
      when 'NULL'
        NULL_VALUE
      else
        raise "HumidifierTypeConverter: Unknown value: #{value}"
    end
  end
end
