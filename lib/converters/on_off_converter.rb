require_relative '../constants'

class OnOffConverter
  def self.convert(value)
    case value
      when 'ON'
        1
      when 'OFF'
        0
      when 'NULL'
        NULL_VALUE
      else
        raise "OnOffConverter: Unknown value: #{value}"
    end
  end
end