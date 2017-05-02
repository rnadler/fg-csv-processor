require_relative '../constants'

class DesatRuleThresholdConverter
  def self.convert(value)
    case value
      when 'PERCENT_3'
        0
      when 'PERCENT_4'
        1
      when 'NULL'
        NULL_VALUE
      else
        raise "DesatRuleThresholdConverter: Unknown value: #{value}"
    end
  end
end