require_relative '../constants'

class SourceConverter
  def self.convert(value)
    case value
      when 'SD_CARD'
        0
      when 'WIRELESS'
        1
      when 'UNKNOWN'
        2
      when 'NULL'
        NULL_VALUE
      else
        raise "SourceConverter: Unknown value: #{value}"
    end
  end
end
