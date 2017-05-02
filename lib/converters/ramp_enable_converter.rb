require_relative 'on_off_converter'

class RampEnableConverter
  def self.convert(value)
    case value
      when 'AUTO'
        2
      else
        begin
          OnOffConverter.convert(value)
        rescue
          raise "RampEnableConverter: Unknown value: #{value}"
        end
    end
  end
end