require_relative '../constants'

class TherapyModeConverter
  def self.convert(value)
    case value
      when 'CPAP'
        0
      when 'AUTO_SET'
      when 'AUTOSET'
        1
      when 'APAP'
        2
      when 'SPONTANEOUS'
      when 'SPONT'
        3
      when 'SPONTANEOUS_TIMED'
      when 'SPONT_TIMED'
        4
      when 'TIMED'
        5
      when 'VAUTO'
        6
      when 'ASV'
        7
      when 'ASVAUTO'
        8
      when 'IVAPS'
        9
      when 'PAC'
        10
      when 'AUTOSET_FOR_HER'
        11
      when 'IVAPS_AUTOEPAP'
        12
      when 'ACV'
        13
      when 'PACV'
        14
      when 'PACVSV'
        15
      when 'PS'
        16
      when 'PSSV'
        17
      when 'VSIMV'
        18
      when 'PSIMV'
        19
      when 'PACSV'
        20
      when 'STSV'
        21
      when 'NULL'
        NULL_VALUE
      else
        raise "TherapyModeConverter: Unknown value: #{value}"
    end
  end
end