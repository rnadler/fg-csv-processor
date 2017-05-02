require_relative '../constants'

class EprLevelConverter
  def self.convert(value)
    case value
      when 'OFF'
        0
      when 'ONE'
        1
      when 'TWO'
        2
      when 'THREE'
        3
      when 'NULL'
        NULL_VALUE
      else
        raise "EprLevelConverter: Unknown value: #{value}"
    end
  end
end
