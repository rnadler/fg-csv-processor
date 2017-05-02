require 'smarter_csv'
require_relative 'converters/source_converter'
require_relative 'converters/therapy_mode_converter'
require_relative 'converters/desat_rule_threshold_converter'
require_relative 'converters/on_off_converter'
require_relative 'converters/ramp_enable_converter'
require_relative 'converters/humidifier_type_converter'
require_relative 'converters/heated_tube_type_converter'
require_relative 'converters/epr_level_converter'
require_relative 'converters/epr_mode_converter'
require_relative 'converters/date_converter'
require_relative 'converters/age_converter'
require_relative 'converters/gender_converter'

class FgCsvProcessor
  attr_reader :data

  def initialize(file, use_tabs = false)
    @file = file
    options = {value_converters: {
        source: SourceConverter,
        therapy_mode: TherapyModeConverter,
        desat_rule_threshold: DesatRuleThresholdConverter,
        comfort_mode: OnOffConverter,
        ramp_enable: RampEnableConverter,
        humidifier_type: HumidifierTypeConverter,
        heated_tube_type: HeatedTubeTypeConverter,
        epr_level: EprLevelConverter,
        epr_mode: EprModeConverter,
        dob: AgeConverter,
        date: DateConverter,  # Currently excluded
        gender: GenderConverter
    }}
    options[:col_sep] = "\t" if use_tabs
    @data = SmarterCSV.process(@file, options)
  end

  def to_s
    "#{@file} rows=#{@data.length} cols=#{@data.first.keys.length}"
  end

end